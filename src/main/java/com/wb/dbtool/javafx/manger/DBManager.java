package com.wb.dbtool.javafx.manger;

import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.enumeration.FieldType;
import com.wb.dbtool.javafx.manger.callable.*;
import com.wb.dbtool.javafx.po.*;
import com.wb.dbtool.javafx.tool.Dialog;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;

public class DBManager {

    public static boolean isUpdate = false;
    private XmlManager xmlService;
    public static AbstractDBmapper dBmapper;

    public DBManager() {
        xmlService = ManagerFactory.getXmlManager();
        invalidate();
    }

    /**
     * 当前操作路径
     */
    private String path = "C://dbtool";

    static {
        File file = new File("C://dbtool");
        file.mkdirs();
    }

    private List<Project> projects = new ArrayList<Project>();

    public Project findProjectByName(String name) {
        for (Project db : projects) {
            if (db.getProjecName().equals(name)) {
                return db;
            }
        }
        return null;
    }

    public boolean removeProjectByName(String name) {
        for (Project db : projects) {
            if (db.getProjecName().equals(name)) {
                projects.remove(db);
                return true;
            }
        }
        return false;
    }

    public Table findTableByTableName(Module db, String name) {
        for (Table t : db.getTables()) {
            if (t.getTableName().equals(name)) {
                return t;
            }
        }
        return null;
    }

    public Table getNewTableName(Module db) {
        String base = "NEW_TABLE";
        String name = base;
        int k = 0;
        do {
            int i;
            for (i = 0; i < db.getTables().size(); i++) {
                if (name.equals(db.getTables().get(i).getTableName())) {
                    break;
                }
            }
            if (i < db.getTables().size()) {
                k++;
                name = base + "_" + k;
            } else {
                Table table = new Table(name);
                table.setTableComment("注释");
                table.setCreate(true);
                table.setDelete(true);
                table.setUpdate(true);
                table.setFind(true);
                table.setGet(true);
                table.setSearch(false);
                table.setGetAll(false);

                db.putTable(table);
                return table;
            }
        } while (true);
    }

    public String getNewProjectName() {
        String base = "NEW_DB";
        String name = base;
        int k = 0;
        do {
            int i;
            for (i = 0; i < projects.size(); i++) {
                if (name.equals(projects.get(i).getProjecName())) {
                    break;
                }
            }
            if (i < projects.size()) {
                k++;
                name = base + "_" + k;
            } else {
                Project db = new Project(name);

                db.setBasePackage("com.example");
                db.setAuthor("姓名");
                projects.add(db);
                return name;
            }
        } while (true);
    }

    public String getNewFieldName(List<Field> fields) {
        String base = "NEW_FIELD";
        String name = base;
        int k = 0;
        do {
            int i;
            for (i = 0; i < fields.size(); i++) {
                if (name.equals(fields.get(i).getFieldName())) {
                    break;
                }
            }
            if (i < fields.size()) {
                k++;
                name = base + "_" + k;
            } else {
                Field field = new Field(name);
                field.setDefaultValue("NULL");
                field.setIsQuery(false);
                field.setIsMust(false);
                field.setIsPrimaryKey(false);
                field.setFieldType(FieldType.String_var50);
                field.setFieldLenght(FieldType.String_var50.getDefaultLength());
                int j = 0;
                for (; j < fields.size(); j++) {
                    if (fields.get(j).getFieldName().equals("ROW_VERSION")) {
                        break;
                    }
                }
                fields.add(j, field);
                return name;
            }
        } while (true);
    }

    public List<Project> getDbs() {
        return projects;
    }

    public void setDbs(List<Project> projects) {
        this.projects = projects;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        if (path != null && !path.equals(this.path)) {
            this.path = path;
            invalidate();
        }
    }

    public boolean doCheck() {

        for (Project project : projects) {
            if (project.getProjecName() == null || "".equals(project.getProjecName())) {
                Dialog.showConfirmDialog("项目" + project.getProjecName() + "没有填写工程名!");
                return false;
            }
            if (project.getBasePackage() == null || "".equals(project.getBasePackage())) {
                Dialog.showConfirmDialog("项目" + project.getProjecName() + "没有填写域名!");
                return false;
            }
            if (project.getAuthor() == null || "".equals(project.getAuthor())) {
                Dialog.showConfirmDialog("项目" + project.getProjecName() + "没有填写作者!");
                return false;
            }

            for (Module db : project.getModuleList()) {
                if (db.getModuleName() == null || "".equals(db.getModuleName())) {
                    Dialog.showConfirmDialog("库" + db.getDbName() + "没有填写工程名!");
                    return false;
                } else if (db.getDbComment() == null || "".equals(db.getDbComment())) {
                    Dialog.showConfirmDialog("库" + db.getDbName() + "没有填写注释!");
                    return false;
                }
            }

        }

        return true;
    }

    /**
     * 保存配置文件 /.db
     */
    public void save() {
        if (path != null) {
            File file = new File(path + File.separator + ".db");
            if (file.exists()) {//清空文件
                clear(file);
            } else {
                file.mkdirs();
            }
            xmlService.save(path, projects);
        }
    }

    private void clear(File f) {
        if (f.isDirectory()) {
            File[] files = f.listFiles();
            for (File file : files) {
                if (file.isDirectory()) {
                    clear(file);
                    boolean delete = file.delete();

                    System.out.println("删除" + file.getName() + (delete ? "成功" : "失败"));
                } else {
                    boolean delete = file.delete();

                    System.out.println("删除" + file.getName() + (delete ? "成功" : "失败"));
                }
            }
        }
    }

    private static ExecutorService service = Executors.newFixedThreadPool(1);

    public void tryGetDBmapper(DataBase dataBase) {
        if (dataBase.name().equals(DataBase.MYSQL.name())) {
            dBmapper = new MySqlDBmapper(dataBase);
        } else if (dataBase.name().equals(DataBase.ORACLE.name())) {
            dBmapper = new OracleDBmapper(dataBase);
        }
    }

    /**
     * 生成模板 入口
     *
     * @param path
     */
    public void generate(final String path, final String option, final DataBase dataBase) {
        tryGetDBmapper(dataBase);

        File root = new File(path);
        if (!root.exists()) {
            Dialog.showTimedDialog(1000, "目录不存在!");
        }
        Dialog.showProgress("生成中...");
        new Thread() {
            @Override
            public void run() {
                for (Project db : projects) {
                    Callable callback = null;
                    switch (option) {
                        case "SpringBoot":
                            callback = new SpringBootCallable(path, dataBase, db, option);
                            break;
                        case "SpringMVC_Mybatis":
                            callback = new SpringMVCMybatisCallable(path, dataBase, db, option);
                            break;
                        default:

                    }

                    Future submit = service.submit(callback);
                    try {
                        submit.get();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    } catch (ExecutionException e) {
                        e.printStackTrace();
                    }
                }
                Dialog.stopPopup();
                Dialog.showSuccess("生成完成.");
            }
        }.start();
    }


    public void generateSDK(File module, File sdk,List<Api> apis) {
        if (module.exists()) {
            boolean mkdirs = sdk.mkdirs();
            File reqList = new File(module.getAbsolutePath() + File.separator + "req");
            File rspList = new File(module.getAbsolutePath() + File.separator + "rsp");
            File entList = new File(module.getAbsolutePath() + File.separator + "ent");
            File enumsList = new File(module.getAbsolutePath() + File.separator + "enums");
            SDKCallable sdkCallable = new SDKCallable(sdk, reqList, rspList, entList, enumsList,apis);
            Future submit = service.submit(sdkCallable);
            try {
                Boolean b = (Boolean) submit.get();
                if (!b) {
                    Dialog.showError("请确认目录结构是否存在或正确!");
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

            Dialog.showSuccess("Api生成完成.");
        }
    }

    public void invalidate() {
        projects = xmlService.inflate(path);
    }

    public static boolean testConnect(Map<String, String> properties) {

        String url = properties.get("url");
        String username = properties.get("username");
        String password = properties.get("password");
        String driverClassName = properties.get("driverClassName");

        try {
            //加载MySql的驱动类
            Class.forName(driverClassName);

            Connection cn = DriverManager.getConnection(url, username, password);
            cn.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean loadDb(Map<String, String> properties) {

        String type = properties.get("type");
        String url = properties.get("url");
        String username = properties.get("username");
        String password = properties.get("password");
        String driverClassName = properties.get("driverClassName");
        Connection cn = null;

        if ("Orcale".equals(type)) {
            try {
                dBmapper = new OracleDBmapper(DataBase.ORACLE);

                //加载驱动类
                Class.forName(driverClassName);
                cn = DriverManager.getConnection(url, username, password);

                Project project = new Project(username);
                Module module = new Module(username);
                project.getModuleList().add(module);
                //查询所有表
                Statement statement = cn.createStatement();
                ResultSet rs = statement.executeQuery("select t.table_name,c.comments from user_tables t LEFT JOIN user_tab_comments c ON t.table_name = c.table_name ORDER BY T .table_name");

                while (rs.next()) {
                    Table table = new Table(rs.getString("table_name"), rs.getString("comments"));
                    module.putTable(table);
                }

                for (Table table : module.getTables()) {
                    String sql = "SELECT T.*,CASE WHEN C.POSITION='1' THEN '1' ELSE '0' END PrimaryKey FROM(select A.COLUMN_ID,A.COLUMN_NAME,A.DATA_TYPE,A.DATA_LENGTH,A .DATA_PRECISION,A .DATA_SCALE,A.NULLABLE,A.DATA_DEFAULT,B.comments from user_tab_columns A ,user_col_comments B where A.Table_Name='" + table.getTableName() + "' AND B.Table_Name='" + table.getTableName() + "' AND A.COLUMN_NAME=B.COLUMN_NAME) T LEFT JOIN user_cons_columns C ON T.COLUMN_NAME = C.COLUMN_NAME AND POSITION = '1' AND C.Table_Name='" + table.getTableName() + "' ORDER BY T .COLUMN_ID";
                    ResultSet set = statement.executeQuery(sql);

                    while (set.next()) {
                        Field field = new Field();

                        field.setFieldName(set.getString("COLUMN_NAME"));

                        String data_type = set.getString("DATA_TYPE");
                        int data_length = set.getInt("DATA_LENGTH");
                        int data_precision = set.getInt("DATA_PRECISION");
                        int data_scale = set.getInt("DATA_SCALE");
                        field.setFieldType(dBmapper.getType(data_type, data_length, data_precision, data_scale));
                        field.setFieldLenght(set.getInt("DATA_LENGTH"));
                        String nullable = set.getString("NULLABLE");
                        field.setDefaultValue(set.getString("DATA_DEFAULT"));
                        field.setFieldComment(set.getString("COMMENTS"));
                        if ("N".equals(nullable)) {
                            field.setIsMust(true);
                        } else {
                            field.setIsMust(false);
                        }
                        String primarykey = set.getString("PRIMARYKEY");
                        if ("1".equals(primarykey)) {
                            field.setIsPrimaryKey(true);
                        } else {
                            field.setIsPrimaryKey(false);
                        }
                        field.setIsQuery(false);

                        table.putField(field);
                    }
                }

                ManagerFactory.getdBManager().projects.add(project);
                isUpdate = true;
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else if ("Mysql".equals(type)) {
            try {
                dBmapper = new MySqlDBmapper(DataBase.MYSQL);

                //加载驱动类
                Class.forName(driverClassName);
                cn = DriverManager.getConnection(url, username, password);

                String[] split = url.split("/");
                String dbName = split[split.length - 1];

                Project project = new Project(dbName);
                Module module = new Module(dbName);
                project.getModuleList().add(module);
                //查询所有表
                Statement statement = cn.createStatement();
                ResultSet rs = statement.executeQuery("SELECT TABLE_NAME,TABLE_COMMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '" + dbName + "'");

                while (rs.next()) {
                    Table table = new Table(rs.getString("TABLE_NAME"), rs.getString("TABLE_COMMENT"));
                    module.putTable(table);
                }

                for (Table table : module.getTables()) {
                    String sql = "select COLUMN_NAME,COLUMN_COMMENT,COLUMN_KEY,COLUMN_DEFAULT,IS_NULLABLE,DATA_TYPE, COLUMN_TYPE,CHARACTER_MAXIMUM_LENGTH from information_schema.COLUMNS where table_name = '" + table.getTableName() + "' and table_schema = '" + dbName + "' ORDER BY ORDINAL_POSITION ASC";
                    ResultSet set = statement.executeQuery(sql);

                    while (set.next()) {
                        Field field = new Field();

                        field.setFieldName(set.getString("COLUMN_NAME"));

                        if ("NO".equals(set.getString("IS_NULLABLE"))) {
                            field.setIsMust(true);
                        } else {
                            field.setIsMust(false);
                        }

                        if ("PRI".equals(set.getString("COLUMN_KEY"))) {
                            field.setIsPrimaryKey(true);
                        } else {
                            field.setIsPrimaryKey(false);
                        }

                        String data_type = set.getString("DATA_TYPE");
                        int data_length = set.getInt("CHARACTER_MAXIMUM_LENGTH");
                        field.setFieldType(dBmapper.getType(data_type, data_length, 0, 0));
                        field.setFieldLenght(0);
                        if ("varchar".equals(data_type) || "char".equals(data_type)) {
                            int length = Integer.parseInt(set.getString("CHARACTER_MAXIMUM_LENGTH"));
                            field.setFieldLenght(length);
                        }

                        field.setDefaultValue(set.getString("COLUMN_DEFAULT"));
                        field.setFieldComment(set.getString("COLUMN_COMMENT"));

                        field.setIsQuery(false);

                        table.putField(field);
                    }
                }

                ManagerFactory.getdBManager().projects.add(project);
                isUpdate = true;
                return true;
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return false;
        }
        return false;
    }
}
