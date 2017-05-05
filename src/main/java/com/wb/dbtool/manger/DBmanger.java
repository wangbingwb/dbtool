package com.wb.dbtool.manger;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.enumeration.FieldType;
import com.wb.dbtool.po.*;
import com.wb.dbtool.service.ServiceFactory;
import com.wb.dbtool.service.XmlService;
import com.wb.dbtool.tool.Dialog;
import com.wb.dbtool.tool.Tool;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import javax.xml.crypto.Data;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class DBmanger {

    public static boolean isUpdate = false;
    private XmlService xmlService;
    private VelocityEngine velocityEngine;
    private AbstractDBmapper dBmapper;

    public DBmanger() {
        xmlService = ServiceFactory.getXmlService();
        try {
            velocityEngine = new VelocityEngine();
            velocityEngine.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
            velocityEngine.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
            velocityEngine.init();
        } catch (Exception e) {
            e.printStackTrace();
        }
        invalidate();
    }

    /**
     * 当前操作路径
     */
    private String path = "E:\\DBtool";
    private List<DB> dbs = new ArrayList<DB>();

    public DB findDBByDBName(String name) {
        for (DB db : dbs) {
            if (db.getDbName().equals(name)) {
                return db;
            }
        }
        return null;
    }

    public boolean removeDBByDBName(String name) {
        for (DB db : dbs) {
            if (db.getDbName().equals(name)) {
                dbs.remove(db);
                return true;
            }
        }
        return false;
    }

    public Table findTableByTableName(DB db, String name) {
        for (Table t : db.getTables()) {
            if (t.getTableName().equals(name)) {
                return t;
            }
        }
        return null;
    }

    public Table getNewTableName(DB db) {
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
                name = base + "(" + k + ")";
            } else {
                Table table = new Table(name);
                table.setTableComment("注释");

                db.putTable(table);
                return table;
            }
        } while (true);
    }

    public String getNewDBName() {
        String base = "NEW_DB";
        String name = base;
        int k = 0;
        do {
            int i;
            for (i = 0; i < dbs.size(); i++) {
                if (name.equals(dbs.get(i).getDbName())) {
                    break;
                }
            }
            if (i < dbs.size()) {
                k++;
                name = base + "(" + k + ")";
            } else {
                DB db = new DB(name);

                db.setBasePackage("com.example");
                db.setModuleName("example");
                db.setDbComment("注释");
                dbs.add(db);
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
                name = base + "(" + k + ")";
            } else {
                Field field = new Field(name);
                field.setDefaultValue("NULL");
                field.setIsQuery(false);
                field.setIsMust(false);
                field.setIsPrimaryKey(false);
                field.setFieldType(FieldType.String);
                field.setFieldLenght(FieldType.String.getDefaultLength());
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

    public List<DB> getDbs() {
        return dbs;
    }

    public void setDbs(List<DB> dbs) {
        this.dbs = dbs;
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
        for (DB db : dbs) {
            if (db.getBasePackage() == null || "".equals(db.getBasePackage())) {
                Dialog.showConfirmDialog("库" + db.getDbName() + "没有填写基本包路径信息!");
                return false;
            } else if (db.getModuleName() == null || "".equals(db.getModuleName())) {
                Dialog.showConfirmDialog("库" + db.getDbName() + "没有填写工程名!");
                return false;
            } else if (db.getDbComment() == null || "".equals(db.getDbComment())) {
                Dialog.showConfirmDialog("库" + db.getDbName() + "没有填写注释!");
                return false;
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
            xmlService.save(path, dbs);
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

    /**
     *
     * @param f 目录
     * @param exclude 排除
     */
    private void clear(File f,String exclude) {
        if (f.isDirectory()) {
            File[] files = f.listFiles();
            for (File file : files) {
                if (file.isDirectory()) {
                    if (!file.getName().contains(exclude)){
                        clear(file);
                        boolean delete = file.delete();

                        System.out.println("删除" + file.getName() + (delete ? "成功" : "失败"));
                    }
                } else {
                    if (!file.getName().contains(exclude)){
                        boolean delete = file.delete();

                        System.out.println("删除" + file.getName() + (delete ? "成功" : "失败"));
                    }
                }
            }
        }
    }

    /**
     * 生成模板 入口
     *
     * @param path
     */
    public void generate(String path, String option, DataBase dataBase) {
        File root = new File(path);
        if (!root.exists()) {
            Dialog.showTimedDialog(1000, "目录不存在!");
        }
        Dialog.showProgress("生成中...");
        new Thread() {
            @Override
            public void run() {
                for (DB db : dbs) {
                    File module = new File(path + File.separator + db.getModuleName());
                    if (!module.exists()) {
                        module.mkdir();
                    } else {
                        clear(module);
                    }
                    if (DataBase.ORACLE.name().equals(dataBase.name())) {
                        dBmapper = new OracleDBmapper(dataBase);
                    } else if (DataBase.MYBATIS.name().equals(dataBase.name())) {
                        dBmapper = new MybatisDBmapper(dataBase);
                    }
                    switch (option) {
                        case "Webx_Mybatis":
                            generateModule_springwebx(module, db, dataBase, "Webx_Mybatis");
                            break;
                        case "SpringMVC_Mybatis":
                            generateModule_springmvc(module, db, dataBase, "SpringMVC_Mybatis");
                            break;
                        case "Mybatis":
                            generateModule_mybatis(module, db, dataBase, "Mybatis");
                            break;
                        case "Cybertech":
                            generateModule_cybertech(module, db, dataBase, "Cybertech");
                            break;
                        default:

                    }
                }
                Dialog.stopPopup();
            }
        }.start();
    }

    /**
     * 生成模块
     *
     * @param module
     * @param db
     */
    public void generateModule_springmvc(File module, DB db, DataBase dataBase, String option) {
        String basePackage = db.getBasePackage();

        String[] split = basePackage.split("\\.");

        generatePom(module, db, option);
        StringBuffer stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("java");
        for (String s : split) {
            stringBuffer.append(File.separator).append(s);
        }
        stringBuffer.append(File.separator).append(db.getModuleName());

        File src = new File(stringBuffer.toString());
        if (!src.exists()) {
            src.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("resources");
        File resources = new File(stringBuffer.toString());
        if (!resources.exists()) {
            resources.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("webapp");
        File webapp = new File(stringBuffer.toString());
        if (!webapp.exists()) {
            webapp.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath());
        stringBuffer.append(File.separator).append("src").append(File.separator).append("test").append(File.separator).append("java");
        File testSrc = new File(stringBuffer.toString());
        if (!testSrc.exists()) {
            testSrc.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath());
        stringBuffer.append(File.separator).append("src").append(File.separator).append("test").append(File.separator).append("resources");
        File testResources = new File(stringBuffer.toString());
        if (!testResources.exists()) {
            testResources.mkdirs();
        }

        generatePo(new File(src.getAbsolutePath() + File.separator + "po"), db, option);
        generateMapper(new File(resources.getAbsolutePath() + File.separator + "mapper"), db, dataBase, option);
        generateMapperJava(new File(src.getAbsolutePath() + File.separator + "dao"), db, option);
        generateManager(new File(src.getAbsolutePath() + File.separator + "service"), db, option);
        generateRequset(new File(src.getAbsolutePath() + File.separator + "request"), db, option);
        generateResponse(new File(src.getAbsolutePath() + File.separator + "response"), db, option);
        generatProperties(resources, db, option);
        generateLogback(resources, db, option);
        generatProperties(testResources, db, option);
        generateSpring(resources, db, dataBase, option);
        generateSpringMvc(resources, db, option);
        generateSpring(testResources, db, dataBase, option);
        generateSpringMybatis(resources, db, option);
        generateSpringMybatis(testResources, db, option);
        generateTest(testSrc, db, option);
        generateWebapp(webapp, db, option);
    }

    /**
     * 生成模块Webx
     *
     * @param module
     * @param db
     */
    public void generateModule_springwebx(File module, DB db, DataBase dataBase, String option) {
        String basePackage = db.getBasePackage();

        String[] split = basePackage.split("\\.");

        generatePom(module, db, option);
        StringBuffer stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("java");
        for (String s : split) {
            stringBuffer.append(File.separator).append(s);
        }
        File home = new File(stringBuffer.toString() + File.separator + "home");
        File api = new File(stringBuffer.toString() + File.separator + "api");
        stringBuffer.append(File.separator).append(db.getModuleName());

        File src = new File(stringBuffer.toString());
        if (!src.exists()) {
            src.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("resources");
        File resources = new File(stringBuffer.toString());
        if (!resources.exists()) {
            resources.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("webapp");
        File webapp = new File(stringBuffer.toString());
        if (!webapp.exists()) {
            webapp.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath());
        stringBuffer.append(File.separator).append("src").append(File.separator).append("test").append(File.separator).append("java");
        for (String s : split) {
            stringBuffer.append(File.separator).append(s);
        }
        stringBuffer.append(File.separator).append(db.getModuleName());
        File testSrc = new File(stringBuffer.toString());
        if (!testSrc.exists()) {
            testSrc.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath());
        stringBuffer.append(File.separator).append("src").append(File.separator).append("test").append(File.separator).append("resources");
        File testResources = new File(stringBuffer.toString());
        if (!testResources.exists()) {
            testResources.mkdirs();
        }

        stringBuffer = new StringBuffer(module.getAbsolutePath());
        stringBuffer.append(File.separator).append("src").append(File.separator).append("test");
        File test = new File(stringBuffer.toString());
        if (!test.exists()) {
            test.mkdirs();
        }

        generatePo(new File(src.getAbsolutePath() + File.separator + "po"), db, option);
        generateMapper(new File(resources.getAbsolutePath() + File.separator + "mapper"), db, dataBase, option);
        generateMapperJava(new File(src.getAbsolutePath() + File.separator + "dao"), db, option);
        generateManager(new File(src.getAbsolutePath() + File.separator + "business"), db, option);
        generateRequset(new File(src.getAbsolutePath() + File.separator + "request"), db, option);
        generateResponse(new File(src.getAbsolutePath() + File.separator + "response"), db, option);
        generateBase(new File(src.getAbsolutePath() + File.separator + "base"), db, option);
        generateHome(home, db, option);
        generateApi(api, db, option);
        generatProperties(resources, db, option);
        generateSpring(resources, db, dataBase, option);
        generateSpring(testResources, db, dataBase, option);
        generateSpringMybatis(resources, db, option);
        generateSpringMybatis(testResources, db, option);
        generateTest(testSrc, db, option);
        generateWebxWebapp(webapp, db, option);
        generateWebxQuickStartServer(test, db, option);
    }

    public void generateHome(File root, DB db, String option) {
        try {
            if (!root.exists()) {
                root.mkdirs();
            }

            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            File module = new File(root.getAbsolutePath() + File.separator + "module");
            File screen = new File(root.getAbsolutePath() + File.separator + "module" + File.separator + "screen");
            File action = new File(root.getAbsolutePath() + File.separator + "module" + File.separator + "action");
            screen.mkdirs();
            action.mkdirs();

            outputVM(new File(action.getAbsolutePath() + File.separator + "RegisterAction.java"), velocityEngine.getTemplate("/templates/" + option + "/home/module/action/RegisterAction.vm", "UTF-8"), ctx);
            outputVM(new File(screen.getAbsolutePath() + File.separator + "Index.java"), velocityEngine.getTemplate("/templates/" + option + "/home/module/screen/Index.vm", "UTF-8"), ctx);
            outputVM(new File(module.getAbsolutePath() + File.separator + "Visitor.java"), velocityEngine.getTemplate("/templates/" + option + "/home/module/Visitor.vm", "UTF-8"), ctx);

        } catch (Exception e) {

        }
    }

    public void generateApi(File root, DB db, String option) {
        try {
            if (!root.exists()) {
                root.mkdirs();
            }

            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("db", db);
            ctx.put("tool", Tool.class);
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            File screen = new File(root.getAbsolutePath() + File.separator + "module" + File.separator + "screen");
            screen.mkdirs();

            outputVM(new File(screen.getAbsolutePath() + File.separator + "Api.java"), velocityEngine.getTemplate("/templates/" + option + "/api/module/screen/Api.vm", "UTF-8"), ctx);

        } catch (Exception e) {

        }
    }

    /**
     * 生成模块 mybatis
     *
     * @param module
     * @param db
     */
    public void generateModule_mybatis(File module, DB db, DataBase dataBase, String option) {
        generatePo(new File(module.getAbsolutePath() + File.separator + "po"), db, option);
        generateMapper(new File(module.getAbsolutePath() + File.separator + "mapper"), db, dataBase, option);
        generateMapperJava(new File(module.getAbsolutePath() + File.separator + "dao"), db, option);
        generateSpringMybatis(new File(module.getAbsolutePath()), db, option);
        generatProperties(new File(module.getAbsolutePath()), db, option);
        generateTable(new File(module.getAbsolutePath()), db, option);

    }

    /**
     * 生成模块 cybertech
     *
     * @param module
     * @param db
     */
    public void generateModule_cybertech(File module, DB db, DataBase dataBase, String option) {

        generatePo(new File(module.getAbsolutePath() + File.separator + "po"), db, option);
        generateMapper(new File(module.getAbsolutePath() + File.separator + "mapper"), db, dataBase, option);
        generateCybertechMapperJava(new File(module.getAbsolutePath() + File.separator + "dao"), db, option);
        generateSpringMybatis(new File(module.getAbsolutePath()), db, option);
        generatProperties(new File(module.getAbsolutePath()), db, option);
        generateTable(new File(module.getAbsolutePath()), db, option);

    }

    /**
     * 生成POM.xml
     *
     * @param root
     * @param db
     */
    public void generateWebapp(File root, DB db, String option) {
        try {
            File poDir = new File(root.getAbsolutePath() + File.separator + "META-INF");
            if (!poDir.exists()) {
                poDir.mkdir();
            }
            Template t = velocityEngine.getTemplate("/templates/" + option + "/MANIFEST.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            File f = new File(poDir.getAbsolutePath() + File.separator + "MANIFEST.MF");
            if (!f.exists()) {
                f.createNewFile();
            }
            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
        try {
            File poDir = new File(root.getAbsolutePath() + File.separator + "WEB-INF");
            if (!poDir.exists()) {
                poDir.mkdir();
            }
            Template t = velocityEngine.getTemplate("/templates/" + option + "/web.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            File f = new File(poDir.getAbsolutePath() + File.separator + "web.xml");
            if (!f.exists()) {
                f.createNewFile();
            }
            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
    }

    private void outputVM(File out, Template t, VelocityContext ctx) {
        OutputStreamWriter writer = null;
        try {
            if (!out.exists()) {
                out.createNewFile();
            }

            writer = new OutputStreamWriter(new FileOutputStream(out), "UTF-8");
            t.merge(ctx, writer);
            writer.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * webxWebapp文件夹及文件生成
     *
     * @param root
     * @param db
     * @param option
     */
    public void generateWebxWebapp(File root, DB db, String option) {
        VelocityContext ctx = new VelocityContext();
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("tool", Tool.class);
        try {
            {//生成home模板
                File control = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "templates" + File.separator + "control");
                control.mkdirs();
                outputVM(new File(control.getAbsolutePath() + File.separator + "header.vm"), velocityEngine.getTemplate("/templates/" + option + "/webapp/home/templates/control/header.vm", "UTF-8"), ctx);
                outputVM(new File(control.getAbsolutePath() + File.separator + "footer.vm"), velocityEngine.getTemplate("/templates/" + option + "/webapp/home/templates/control/footer.vm", "UTF-8"), ctx);

                File layout = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "templates" + File.separator + "layout");
                layout.mkdirs();
                outputVM(new File(layout.getAbsolutePath() + File.separator + "default.vm"), velocityEngine.getTemplate("/templates/" + option + "/webapp/home/templates/layout/default.vm", "UTF-8"), ctx);

                File screen = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "templates" + File.separator + "screen");
                screen.mkdirs();
                outputVM(new File(screen.getAbsolutePath() + File.separator + "index.vm"), velocityEngine.getTemplate("/templates/" + option + "/webapp/home/templates/screen/index.vm", "UTF-8"), ctx);
            }

            {//生成common模板
                File layout = new File(root.getAbsolutePath() + File.separator + "common" + File.separator + "templates" + File.separator + "layout");
                layout.mkdirs();
                outputVM(new File(layout.getAbsolutePath() + File.separator + "default.vm"), velocityEngine.getTemplate("/templates/" + option + "/webapp/common/templates/layout/default.vm", "UTF-8"), ctx);

                File screen = new File(root.getAbsolutePath() + File.separator + "common" + File.separator + "templates" + File.separator + "screen");
                screen.mkdirs();
                outputVM(new File(screen.getAbsolutePath() + File.separator + "error.vm"), velocityEngine.getTemplate("/templates/" + option + "/webapp/common/templates/screen/error.vm", "UTF-8"), ctx);

                File templates = new File(root.getAbsolutePath() + File.separator + "common" + File.separator + "templates");
                templates.mkdirs();
                outputVM(new File(templates.getAbsolutePath() + File.separator + "macros.vm"), velocityEngine.getTemplate("/templates/" + option + "/webapp/common/templates/macros.vm", "UTF-8"), ctx);
            }

            File WEB_INF_DIR = new File(root.getAbsolutePath() + File.separator + "WEB-INF");
            WEB_INF_DIR.mkdir();

            {//生成WEB-INF下的web.xml等文件
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "web.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/web.vm", "UTF-8"), ctx);
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "logback.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/logback.vm", "UTF-8"), ctx);
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "webx.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/webx.vm", "UTF-8"), ctx);
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "webx-api.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/webx-api.vm", "UTF-8"), ctx);
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "webx-home.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/webx-home.vm", "UTF-8"), ctx);
            }

            {//生成WEB-INF下的common文件
                File common = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "common");
                common.mkdirs();

                outputVM(new File(common.getAbsolutePath() + File.separator + "pipeline.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/common/pipeline.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "pipeline-exception.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/common/pipeline-exception.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "resources.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/common/resources.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "uris.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/common/uris.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "webx-component.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/common/webx-component.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "webx-component-and-root.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/common/webx-component-and-root.vm", "UTF-8"), ctx);
            }

            {//生成WEB-INF下的表单验证文件
                File api = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "api");
                api.mkdirs();
                outputVM(new File(api.getAbsolutePath() + File.separator + "form.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/home/form.vm", "UTF-8"), ctx);

                File home = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "home");
                home.mkdirs();
                outputVM(new File(home.getAbsolutePath() + File.separator + "form.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/home/form.vm", "UTF-8"), ctx);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成POM.xml
     *
     * @param root
     * @param db
     */
    public void generatePom(File root, DB db, String option) {
        File poDir = new File(root.getAbsolutePath() + File.separator + "pom.xml");
        if (!poDir.exists()) {
            try {
                poDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Template t = velocityEngine.getTemplate("/templates/" + option + "/pom.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(poDir), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
    }

    /**
     * 生成Webx通用文件
     *
     * @param root
     * @param db
     */
    public void generateWebxQuickStartServer(File root, DB db, String option) {
        VelocityContext ctx = new VelocityContext();
        try {
            File java = new File(root.getAbsolutePath() + File.separator + "java");
            java.mkdirs();
            outputVM(new File(java.getAbsolutePath() + File.separator + "QuickStartServer.java"), velocityEngine.getTemplate("/templates/" + option + "/test/quickStartServer.vm", "UTF-8"), ctx);

            File resources = new File(root.getAbsolutePath() + File.separator + "resources");
            resources.mkdirs();
            outputVM(new File(resources.getAbsolutePath() + File.separator + "webdefault-windows.xml"), velocityEngine.getTemplate("/templates/" + option + "/test/webdefault-windows.vm", "UTF-8"), ctx);

        } catch (Exception e) {

        }
    }

    /**
     * 生成config.properties
     *
     * @param root
     * @param db
     */
    public void generatProperties(File root, DB db, String option) {
        File poDir = new File(root.getAbsolutePath() + File.separator + "jdbc.properties");
        if (!poDir.exists()) {
            try {
                poDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Template t = velocityEngine.getTemplate("/templates/" + option + "/jdbc.properties.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(poDir), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
    }

    /**
     * 生成SpringMybatis
     *
     * @param root
     * @param db
     */
    public void generateSpringMybatis(File root, DB db, String option) {
        File poDir = new File(root.getAbsolutePath() + File.separator + "spring-mybatis.xml");
        if (!poDir.exists()) {
            try {
                poDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Template t = velocityEngine.getTemplate("/templates/" + option + "/spring-mybatis.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(poDir), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
    }

    /**
     * 生成Spring.xml
     *
     * @param root
     * @param db
     */
    public void generateSpring(File root, DB db, DataBase dataBase, String option) {
        File poDir = new File(root.getAbsolutePath() + File.separator + "spring.xml");
        if (!poDir.exists()) {
            try {
                poDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Template t = velocityEngine.getTemplate("/templates/" + option + "/spring.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            if (root.getAbsolutePath().contains("test")) {
                ctx.put("isTest", true);
            } else {
                ctx.put("isTest", false);
            }

            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(poDir), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }

        if (!root.getAbsolutePath().contains("test")) {
            File tableDir = new File(root.getAbsolutePath() + File.separator + db.getModuleName() + "_table");
            tableDir.mkdirs();
            for (Table table : db.getTables()) {
                try {
                    File f = new File(tableDir.getAbsolutePath() + File.separator + table.getTableName() + ".sql");
                    f.createNewFile();

                    Template t = velocityEngine.getTemplate("/templates/" + option + "/table.vm", "UTF-8");
                    VelocityContext ctx = new VelocityContext();

                    ctx.put("tool", Tool.class);
                    ctx.put("db", db);
                    ctx.put("basePackage", db.getBasePackage());
                    ctx.put("moduleName", db.getModuleName());
                    ctx.put("table", table);
                    ctx.put("dBmapper", dBmapper);
                    ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                    OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
                    try {
                        t.merge(ctx, writer);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        writer.close();
                    }
                } catch (Exception e) {

                }
            }
            try {
                File f = new File(tableDir.getAbsolutePath() + File.separator + "ALL_TABLE.sql");
                f.createNewFile();

                Template t = velocityEngine.getTemplate("/templates/" + option + "/tableAll.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("db", db);
                ctx.put("dBmapper", dBmapper);

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成Table.sql
     *
     * @param root
     * @param db
     */
    public void generateTable(File root, DB db, String option) {
        File tableDir = new File(root.getAbsolutePath() + File.separator + db.getModuleName() + "_table");
        tableDir.mkdirs();
        for (Table table : db.getTables()) {
            try {
                File f = new File(tableDir.getAbsolutePath() + File.separator + table.getTableName() + ".sql");
                f.createNewFile();

                Template t = velocityEngine.getTemplate("/templates/" + option + "/table.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("db", db);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("dBmapper", dBmapper);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
        try {
            File f = new File(tableDir.getAbsolutePath() + File.separator + "ALL_TABLE.sql");
            f.createNewFile();

            Template t = velocityEngine.getTemplate("/templates/" + option + "/tableAll.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("db", db);
            ctx.put("dBmapper", dBmapper);

            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
    }

    /**
     * 生成Spring.xml
     *
     * @param root
     * @param db
     */
    public void generateSpringMvc(File root, DB db, String option) {
        File poDir = new File(root.getAbsolutePath() + File.separator + "spring-mvc.xml");
        if (!poDir.exists()) {
            try {
                poDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Template t = velocityEngine.getTemplate("/templates/" + option + "/spring-mvc.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(poDir), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
    }

    /**
     * 生成Spring.xml
     *
     * @param root
     * @param db
     */
    public void generateLogback(File root, DB db, String option) {
        File poDir = new File(root.getAbsolutePath() + File.separator + "logback.xml");
        if (!poDir.exists()) {
            try {
                poDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Template t = velocityEngine.getTemplate("/templates/" + option + "/logback.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(poDir), "UTF-8");
            try {
                t.merge(ctx, writer);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                writer.close();
            }
        } catch (Exception e) {

        }
    }

    /**
     * 生成PO
     *
     * @param root
     * @param db
     */
    public void generatePo(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/po/po.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "PO" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成Mapper
     *
     * @param root
     * @param db
     */
    public void generateMapper(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            File[] files = root.listFiles();
            for (File file : files) {
                file.delete();
            }
        }
        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/mapper/mapper.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("db", db);
                ctx.put("dataBase", dataBase.toString());
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".xml");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成Mapper.java
     *
     * @param root
     * @param db
     */
    public void generateMapperJava(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            File[] files = root.listFiles();
            for (File file : files) {
                file.delete();
            }
        }
        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/dao/daoJava.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Dao" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成MapperImpl.java
     *
     * @param root
     * @param db
     */
    public void generateCybertechMapperJava(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/dao/daoJava.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Dao" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }

        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/dao/daoJavaImpl.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DaoImpl" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    public void generateManager(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            File[] files = root.listFiles();
            for (File file : files) {
                file.delete();
            }
        }
        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/business/manager.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Manager" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/business/managerImpl.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "ManagerImpl" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成Condition
     *
     * @param root
     * @param db
     */
    public void generateRequset(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            File[] files = root.listFiles();
            for (File file : files) {
                file.delete();
            }
        }

        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/request/createRequestClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateRequest" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }

            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/request/deleteRequestClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteRequest" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/request/UpdateRequestClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateRequest" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/request/findRequestClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindRequest" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/request/findAllRequestClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindAllRequest" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/request/getRequestClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetRequest" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成一般文件
     *
     * @param root
     * @param db
     */
    public void generateResponse(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            File[] files = root.listFiles();
            for (File file : files) {
                file.delete();
            }
        }

        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/response/createResponseClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateResponse" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/response/deleteResponseClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteResponse" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/response/updateResponseClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateResponse" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/response/findResponseClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindResponse" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/response/findAllResponseClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindAllResponse" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/response/getResponseClass.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetResponse" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成base类
     *
     * @param root
     * @param db
     */
    public void generateBase(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        try {
            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            outputVM(new File(root.getAbsolutePath() + File.separator + "Error.java"), velocityEngine.getTemplate("/templates/" + option + "/base/Error.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Error.java"), velocityEngine.getTemplate("/templates/" + option + "/base/Error.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "ErrorType.java"), velocityEngine.getTemplate("/templates/" + option + "/base/ErrorType.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Response.java"), velocityEngine.getTemplate("/templates/" + option + "/base/Response.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "FindResponse.java"), velocityEngine.getTemplate("/templates/" + option + "/base/FindResponse.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Request.java"), velocityEngine.getTemplate("/templates/" + option + "/base/Request.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "UpdateRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/base/UpdateRequest.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "FindRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/base/FindRequest.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Token.java"), velocityEngine.getTemplate("/templates/" + option + "/base/Token.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LocalData.java"), velocityEngine.getTemplate("/templates/" + option + "/base/LocalData.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "IDgenerator.java"), velocityEngine.getTemplate("/templates/" + option + "/base/IDgenerator.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LogUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/base/LogUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Message.java"), velocityEngine.getTemplate("/templates/" + option + "/base/Message.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "MapUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/base/MapUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "MD5Util.java"), velocityEngine.getTemplate("/templates/" + option + "/base/MD5Util.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "RSAUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/base/RSAUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "WebUtils.java"), velocityEngine.getTemplate("/templates/" + option + "/base/WebUtils.vm", "UTF-8"), ctx);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void generateTest(File root, DB db, String option) {
        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/test/test.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Test" + ".java");
                if (po.exists()) {
                    po.delete();
                }
                po.createNewFile();

                OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(po), "UTF-8");
                try {
                    t.merge(ctx, writer);
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    writer.close();
                }
            } catch (Exception e) {
            }
        }
    }

    public void invalidate() {
        dbs = xmlService.inflate(path);
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

    public static void loadDb(Map<String, String> properties) {

        String type = properties.get("type");
        String url = properties.get("url");
        String username = properties.get("username");
        String password = properties.get("password");
        String driverClassName = properties.get("driverClassName");
        Connection cn = null;

        if ("Orcale".equals(type)) {
            try {
                OracleDBmapper dBmapper = new OracleDBmapper(DataBase.ORACLE);

                //加载驱动类
                Class.forName(driverClassName);
                cn = DriverManager.getConnection(url, username, password);

                DB db = new DB(username);
                //查询所有表
                Statement statement = cn.createStatement();
                ResultSet rs = statement.executeQuery("select t.table_name,c.comments from user_tables t LEFT JOIN user_tab_comments c ON t.table_name = c.table_name ORDER BY T .table_name");

                while (rs.next()) {
                    Table table = new Table(rs.getString("table_name"), rs.getString("comments"));
                    db.putTable(table);
                }

                for (Table table : db.getTables()) {
                    String sql = "SELECT T.*,CASE WHEN C.POSITION='1' THEN '1' ELSE '0' END PrimaryKey FROM(select A.COLUMN_ID,A.COLUMN_NAME,A.DATA_TYPE,A.DATA_LENGTH,A .DATA_PRECISION,A .DATA_SCALE,A.NULLABLE,A.DATA_DEFAULT,B.comments from user_tab_columns A ,user_col_comments B where A.Table_Name='" + table.getTableName() + "' AND B.Table_Name='" + table.getTableName() + "' AND A.COLUMN_NAME=B.COLUMN_NAME) T LEFT JOIN user_cons_columns C ON T.COLUMN_NAME = C.COLUMN_NAME AND POSITION = '1' AND C.Table_Name='" + table.getTableName() + "' ORDER BY T .COLUMN_ID";
                    ResultSet set = statement.executeQuery(sql);

                    while (set.next()) {
                        Field field = new Field();

                        field.setFieldName(set.getString("COLUMN_NAME"));

                        String data_type = set.getString("DATA_TYPE");
                        int data_length = set.getInt("DATA_LENGTH");
                        int data_precision = set.getInt("DATA_PRECISION");
                        int data_scale = set.getInt("DATA_SCALE");
                        field.setFieldType(dBmapper.getJavaType(data_type, data_length, data_precision, data_scale));
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

                MangerFactory.getdBmanger().dbs.add(db);
                isUpdate = true;
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
            Dialog.showConfirmDialog("Mysql类型暂未开发!");
        }
    }
}
