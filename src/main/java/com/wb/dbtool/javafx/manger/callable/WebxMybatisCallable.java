package com.wb.dbtool.javafx.manger.callable;

import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.manger.DBManager;
import com.wb.dbtool.javafx.po.AbstractDBmapper;
import com.wb.dbtool.javafx.po.DB;
import com.wb.dbtool.javafx.po.Table;
import com.wb.dbtool.javafx.tool.Tool;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Callable;

import static com.wb.dbtool.javafx.tool.Tool.outputVM;
import static com.wb.dbtool.javafx.tool.Tool.revert;

public class WebxMybatisCallable implements Callable {

    private String root;
    private DataBase dataBase;
    private DB db;
    private String option;

    private VelocityEngine velocityEngine;

    public WebxMybatisCallable(String root, DataBase dataBase, DB db, String option) {
        this.root = root;
        this.dataBase = dataBase;
        this.db = db;
        this.option = option;
        try {
            velocityEngine = new VelocityEngine();
            velocityEngine.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
            velocityEngine.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
            velocityEngine.init();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private AbstractDBmapper dBmapper;

    public Boolean call() throws Exception {

        File module = new File(root + File.separator + db.getModuleName());
        if (!module.exists()) {
            module.mkdir();
        } else {
            Tool.clear(module);
        }

        dBmapper = DBManager.dBmapper;

        String basePackage = db.getBasePackage();

        String[] split = basePackage.split("\\.");

        generatePom(module, db, dataBase, option);
        StringBuffer stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("java");
        for (String s : split) {
            stringBuffer.append(File.separator).append(s);
        }
        File home = new File(stringBuffer.toString() + File.separator + "home");
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

        //生成java文件
        generatePo(new File(src.getAbsolutePath() + File.separator + "ent"), db, dataBase, option);
        generateFilter(new File(src.getAbsolutePath() + File.separator + "filter"), db, dataBase, option);
        generateMapper(new File(src.getAbsolutePath() + File.separator + "mpr"), db, dataBase, option);
        generateManager(new File(src.getAbsolutePath() + File.separator + "mgr"), db, dataBase, option);
        generateRequset(new File(src.getAbsolutePath() + File.separator + "req"), db, dataBase, option);
        generateResponse(new File(src.getAbsolutePath() + File.separator + "rsp"), db, dataBase, option);
        generateBase(new File(src.getParentFile().getAbsolutePath() + File.separator + "framework"), db, dataBase, option);
        generateHome(home, db, dataBase, option);

        //生成resources文件
        generatProperties(resources, db, dataBase, option);
        generateSpring(resources, db, dataBase, option);
        generateSpring(testResources, db, dataBase, option);
        generateSpringMybatis(resources, db, dataBase, option);

        //生成webapp
        generateWebxWebapp(webapp, db, dataBase, option);

        //生成test
        generateSpringMybatis(testResources, db, dataBase, option);
        generateTest(testSrc, db, dataBase, option);
        generateWebxQuickStartServer(test, db, dataBase, option);

        return true;
    }

    /**
     * 生成POM.xml
     *
     * @param root
     * @param db
     */
    public void generatePom(File root, DB db, DataBase dataBase, String option) {
        try {
            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            File file = new File(root.getAbsolutePath() + File.separator + "pom.xml");
            Template template = velocityEngine.getTemplate("/modules/" + option + "/pom.vm", "UTF-8");
            outputVM(file, template, ctx);
        } catch (Exception e) {

        }
    }

    /**
     * 生成PO
     *
     * @param root
     * @param db
     */
    public void generatePo(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            Tool.clear(root);
        }

        for (Table table : db.getTables()) {
            try {
                VelocityContext ctx = new VelocityContext();
                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("author", db.getAuthor());
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File file = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + ".java");
                Template template = velocityEngine.getTemplate("/modules/" + option + "/java/ent/entity.vm", "UTF-8");
                outputVM(file, template, ctx);

            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成Filter
     *
     * @param root
     * @param db
     */
    public void generateFilter(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            Tool.clear(root);
        }

        try {
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            outputVM(new File(root.getAbsolutePath() + File.separator + "Authorizations" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/filter/Authorizations.vm", "UTF-8"), ctx);
        } catch (Exception e) {
            e.printStackTrace();
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
            Tool.clear(root);
        }
        VelocityContext ctx = new VelocityContext();

        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("author", db.getAuthor());

        for (Table table : db.getTables()) {
            try {
                ctx.put("table", table);

                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".java"),
                        velocityEngine.getTemplate("/modules/" + option + "/java/mpr/mapperJava.vm", "UTF-8"), ctx);

                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".xml"),
                        velocityEngine.getTemplate("/modules/" + option + "/java/mpr/mapper.vm", "UTF-8"), ctx);

            } catch (Exception e) {

            }
        }
    }

    public void generateManager(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            Tool.clear(root);
        }
        try {
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("author", db.getAuthor());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            for (Table table : db.getTables()) {
                ctx.put("table", table);

                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Manager" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/mgr/manager.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "ManagerImpl" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/mgr/managerImpl.vm", "UTF-8"), ctx);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成Requset
     *
     * @param root
     * @param db
     */
    public void generateRequset(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            Tool.clear(root);
        }

        try {

            VelocityContext ctx = new VelocityContext();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("author", db.getAuthor());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            for (Table table : db.getTables()) {
                ctx.put("table", table);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateRequest" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/req/createRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteRequest" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/req/deleteRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateRequest" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/req/updateRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindRequest" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/req/findRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchRequest" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/req/searchRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllRequest" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/req/getAllRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetRequest" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/req/getRequestClass.vm", "UTF-8"), ctx);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成一般文件
     *
     * @param root
     * @param db
     */
    public void generateResponse(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            Tool.clear(root);
        }

        try {
            VelocityContext ctx = new VelocityContext();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("author", db.getAuthor());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            for (Table table : db.getTables()) {
                ctx.put("table", table);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateResponse" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/rsp/createResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteResponse" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/rsp/deleteResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateResponse" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/rsp/updateResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindResponse" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/rsp/findResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchResponse" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/rsp/searchResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllResponse" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/rsp/GetAllResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetResponse" + ".java"), velocityEngine.getTemplate("/modules/" + option + "/java/rsp/getResponseClass.vm", "UTF-8"), ctx);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成base类
     *
     * @param root
     * @param db
     */
    public void generateBase(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            Tool.clear(root);
        }
        try {
            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            outputVM(new File(root.getAbsolutePath() + File.separator + "Error.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/Error.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Error.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/Error.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "ErrorType.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/ErrorType.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "UserToken.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/UserToken.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LocalData.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/LocalData.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "IDgenerator.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/IDgenerator.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LogUtil.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/LogUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Message.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/Message.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "MapperUtil.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/MapperUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "MD5Util.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/MD5Util.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "RSAUtil.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/RSAUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "WebUtils.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/WebUtils.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "DataFormatUtil.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/DataFormatUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseUtil.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "ValidationUtil.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/ValidationUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseEntity.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseEntity.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "CookieUtil.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/CookieUtil.vm", "UTF-8"), ctx);

            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseFindRequest.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseFindRequest.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseFindResponse.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseFindResponse.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseGetAllResponse.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseGetAllResponse.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseRequest.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseRequest.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseResponse.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseResponse.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseSearchRequest.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseSearchRequest.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseSearchResponse.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseSearchResponse.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseUpdateRequest.java"), velocityEngine.getTemplate("/modules/" + option + "/java/framework/BaseUpdateRequest.vm", "UTF-8"), ctx);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void generateHome(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            Tool.clear(root);
        }

        try {

            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("db", db);
            ctx.put("table", db.getTables());
            ctx.put("author", db.getAuthor());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            File module = new File(root.getAbsolutePath() + File.separator + "module");
            File screen = new File(root.getAbsolutePath() + File.separator + "module" + File.separator + "screen");
            File action = new File(root.getAbsolutePath() + File.separator + "module" + File.separator + "action");
            screen.mkdirs();
            action.mkdirs();

            outputVM(new File(action.getAbsolutePath() + File.separator + "RegisterAction.java"), velocityEngine.getTemplate("/modules/" + option + "/java/home/module/action/RegisterAction.vm", "UTF-8"), ctx);
            outputVM(new File(screen.getAbsolutePath() + File.separator + "Index.java"), velocityEngine.getTemplate("/modules/" + option + "/java/home/module/screen/Index.vm", "UTF-8"), ctx);
            outputVM(new File(module.getAbsolutePath() + File.separator + "Visitor.java"), velocityEngine.getTemplate("/modules/" + option + "/java/home/module/Visitor.vm", "UTF-8"), ctx);

            outputVM(new File(screen.getAbsolutePath() + File.separator + "Ajax.java"), velocityEngine.getTemplate("/modules/" + option + "/java/home/module/screen/Ajax.vm", "UTF-8"), ctx);
            outputVM(new File(screen.getAbsolutePath() + File.separator + "Api.java"), velocityEngine.getTemplate("/modules/" + option + "/java/home/module/screen/Api.vm", "UTF-8"), ctx);
            outputVM(new File(screen.getAbsolutePath() + File.separator + "Upload.java"), velocityEngine.getTemplate("/modules/" + option + "/java/home/module/screen/Upload.vm", "UTF-8"), ctx);


        } catch (Exception e) {

        }
    }

    /**
     * 生成config.properties
     *
     * @param root
     * @param db
     */
    public void generatProperties(File root, DB db, DataBase dataBase, String option) {
        File poDir = new File(root.getAbsolutePath() + File.separator + "jdbc.properties");
        if (!poDir.exists()) {
            try {
                poDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Template t = velocityEngine.getTemplate("/modules/" + option + "/resources/jdbc.properties.vm", "UTF-8");
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
            Template t = velocityEngine.getTemplate("/modules/" + option + "/resources/spring.vm", "UTF-8");
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

                    Template t = velocityEngine.getTemplate("/modules/" + option + "/resources/table.vm", "UTF-8");
                    VelocityContext ctx = new VelocityContext();

                    ctx.put("tool", Tool.class);
                    ctx.put("dataBase", dataBase.toString());
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

                Template t = velocityEngine.getTemplate("/modules/" + option + "/resources/tableAll.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("dataBase", dataBase.toString());
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
     * 生成SpringMybatis
     *
     * @param root
     * @param db
     */
    public void generateSpringMybatis(File root, DB db, DataBase dataBase, String option) {
        try {
            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            outputVM(new File(root.getAbsolutePath() + File.separator + "spring-mybatis.xml"), velocityEngine.getTemplate("/modules/" + option + "/resources//spring-mybatis.vm", "UTF-8"), ctx);
        } catch (Exception e) {

        }
    }

    public void generateTest(File root, DB db, DataBase dataBase, String option) {
        for (Table table : db.getTables()) {
            try {
                Template t = velocityEngine.getTemplate("/modules/" + option + "/test/test.vm", "UTF-8");
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

    /**
     * webxWebapp文件夹及文件生成
     *
     * @param root
     * @param db
     * @param option
     */
    public void generateWebxWebapp(File root, DB db, DataBase dataBase, String option) {
        VelocityContext ctx = new VelocityContext();
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("db", db);
        ctx.put("tool", Tool.class);
        ctx.put("author", db.getAuthor());
        try {
            {//生成home模板
                File control = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "modules" + File.separator + "control");
                control.mkdirs();
                outputVM(new File(control.getAbsolutePath() + File.separator + "header.vm"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/modules/control/header.vm", "UTF-8"), ctx);
                outputVM(new File(control.getAbsolutePath() + File.separator + "footer.vm"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/modules/control/footer.vm", "UTF-8"), ctx);

                File layout = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "modules" + File.separator + "layout");
                layout.mkdirs();
                outputVM(new File(layout.getAbsolutePath() + File.separator + "default.vm"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/modules/layout/default.vm", "UTF-8"), ctx);

                File screen = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "modules" + File.separator + "screen");
                screen.mkdirs();
                outputVM(new File(screen.getAbsolutePath() + File.separator + "index.vm"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/modules/screen/index.vm", "UTF-8"), ctx);

                File css = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "dict" + File.separator + "css");
                css.mkdirs();
                File js = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "dict" + File.separator + "js");
                js.mkdirs();

                File images = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "images");
                images.mkdirs();
                File styles = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "styles");
                styles.mkdirs();
                File scripts = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "scripts");
                scripts.mkdirs();


                outputVM(new File(scripts.getAbsolutePath() + File.separator + "home.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/home.vm", "UTF-8"), ctx);
                outputVM(new File(scripts.getAbsolutePath() + File.separator + "home-filter.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/home-filter.vm", "UTF-8"), ctx);
                outputVM(new File(scripts.getAbsolutePath() + File.separator + "home-services.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/home-services.vm", "UTF-8"), ctx);
                revert(new File(scripts.getAbsolutePath() + File.separator + "home.js"));
                revert(new File(scripts.getAbsolutePath() + File.separator + "home-filter.js"));
                revert(new File(scripts.getAbsolutePath() + File.separator + "home-services.js"));

                File ctrls = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "scripts" + File.separator + "ctrls");
                ctrls.mkdirs();
                outputVM(new File(ctrls.getAbsolutePath() + File.separator + "demoCtrl.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/ctrls/demoCtrl.vm", "UTF-8"), ctx);
                revert(new File(ctrls.getAbsolutePath() + File.separator + "demoCtrl.js"));

                File libs = new File(root.getAbsolutePath() + File.separator + "home" + File.separator + "scripts" + File.separator + "libs");
                libs.mkdirs();
                outputVM(new File(libs.getAbsolutePath() + File.separator + "angular.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/libs/angular.vm", "UTF-8"), ctx);
                outputVM(new File(libs.getAbsolutePath() + File.separator + "angular-locale_zh-cn.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/libs/angular-locale_zh-cn.vm", "UTF-8"), ctx);
                outputVM(new File(libs.getAbsolutePath() + File.separator + "jquery-3.2.1.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/libs/jquery-3.2.1.vm", "UTF-8"), ctx);
                outputVM(new File(libs.getAbsolutePath() + File.separator + "tools.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/libs/tools.vm", "UTF-8"), ctx);
                outputVM(new File(libs.getAbsolutePath() + File.separator + "ui-bootstrap-tpls-1.3.2.js"), velocityEngine.getTemplate("/modules/" + option + "/webapp/home/scripts/libs/ui-bootstrap-tpls-1.3.2.vm", "UTF-8"), ctx);

                revert(new File(libs.getAbsolutePath() + File.separator + "angular.js"));
                revert(new File(libs.getAbsolutePath() + File.separator + "angular-locale_zh-cn.js"));
                revert(new File(libs.getAbsolutePath() + File.separator + "jquery-3.2.1.js"));
                revert(new File(libs.getAbsolutePath() + File.separator + "tools.js"));
                revert(new File(libs.getAbsolutePath() + File.separator + "ui-bootstrap-tpls-1.3.2.js"));

            }

            {//生成common模板
                File layout = new File(root.getAbsolutePath() + File.separator + "common" + File.separator + "modules" + File.separator + "layout");
                layout.mkdirs();
                outputVM(new File(layout.getAbsolutePath() + File.separator + "default.vm"), velocityEngine.getTemplate("/modules/" + option + "/webapp/common/modules/layout/default.vm", "UTF-8"), ctx);

                File screen = new File(root.getAbsolutePath() + File.separator + "common" + File.separator + "modules" + File.separator + "screen");
                screen.mkdirs();
                outputVM(new File(screen.getAbsolutePath() + File.separator + "error.vm"), velocityEngine.getTemplate("/modules/" + option + "/webapp/common/modules/screen/error.vm", "UTF-8"), ctx);

                File modules = new File(root.getAbsolutePath() + File.separator + "common" + File.separator + "modules");
                modules.mkdirs();
                outputVM(new File(modules.getAbsolutePath() + File.separator + "macros.vm"), velocityEngine.getTemplate("/modules/" + option + "/webapp/common/modules/macros.vm", "UTF-8"), ctx);
            }

            File WEB_INF_DIR = new File(root.getAbsolutePath() + File.separator + "WEB-INF");
            WEB_INF_DIR.mkdir();

            {//生成WEB-INF下的web.xml等文件
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "web.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/web.vm", "UTF-8"), ctx);
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "logback.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/logback.vm", "UTF-8"), ctx);
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "webx.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/webx.vm", "UTF-8"), ctx);
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "webx-home.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/webx-home.vm", "UTF-8"), ctx);
            }

            {//生成WEB-INF下的common文件
                File common = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "common");
                common.mkdirs();

                outputVM(new File(common.getAbsolutePath() + File.separator + "pipeline.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/common/pipeline.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "pipeline-exception.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/common/pipeline-exception.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "resources.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/common/resources.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "uris.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/common/uris.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "webx-component.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/common/webx-component.vm", "UTF-8"), ctx);
                outputVM(new File(common.getAbsolutePath() + File.separator + "webx-component-and-root.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/common/webx-component-and-root.vm", "UTF-8"), ctx);
            }

            {//生成WEB-INF下的表单验证文件
                File home = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "home");
                home.mkdirs();
                outputVM(new File(home.getAbsolutePath() + File.separator + "form.xml"), velocityEngine.getTemplate("/modules/" + option + "/webapp/WEB-INF/home/form.vm", "UTF-8"), ctx);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成Webx通用文件
     *
     * @param root
     * @param db
     */
    public void generateWebxQuickStartServer(File root, DB db, DataBase dataBase, String option) {
        VelocityContext ctx = new VelocityContext();
        try {
            File java = new File(root.getAbsolutePath() + File.separator + "java");
            java.mkdirs();
            outputVM(new File(java.getAbsolutePath() + File.separator + "QuickStartServer.java"), velocityEngine.getTemplate("/modules/" + option + "/test/quickStartServer.vm", "UTF-8"), ctx);

            File resources = new File(root.getAbsolutePath() + File.separator + "resources");
            resources.mkdirs();
            outputVM(new File(resources.getAbsolutePath() + File.separator + "webdefault-windows.xml"), velocityEngine.getTemplate("/modules/" + option + "/test/webdefault-windows.vm", "UTF-8"), ctx);

        } catch (Exception e) {

        }
    }
}
