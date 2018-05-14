package com.wb.dbtool.manger.callable;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.manger.DBManager;
import com.wb.dbtool.po.AbstractDBmapper;
import com.wb.dbtool.po.DB;
import com.wb.dbtool.po.Table;
import com.wb.dbtool.tool.Tool;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Callable;

public class SpringMVCMybatisCallable implements Callable {

    private String root;
    private DataBase dataBase;
    private DB db;
    private String option;

    private VelocityEngine velocityEngine;

    public SpringMVCMybatisCallable(String root, DataBase dataBase, DB db, String option) {
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
            clear(module);
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

        //生成java文件
        generateEntity(new File(src.getAbsolutePath() + File.separator + "ent"), db, dataBase, option);
        generateEnums(new File(src.getAbsolutePath() + File.separator + "enums"), db, dataBase, option);
        generateFilter(new File(src.getAbsolutePath() + File.separator + "filter"), db, dataBase, option);
        generateMapper(new File(src.getAbsolutePath() + File.separator + "mpr"), db, dataBase, option);
        generateManager(new File(src.getAbsolutePath() + File.separator + "mgr"), db, dataBase, option);
        generateRequset(new File(src.getAbsolutePath() + File.separator + "req"), db, dataBase, option);
        generateResponse(new File(src.getAbsolutePath() + File.separator + "rsp"), db, dataBase, option);
        generateBase(new File(src.getParentFile().getAbsolutePath() + File.separator + "framework"), db, dataBase, option);
        generateController(new File(src.getParentFile().getAbsolutePath() + File.separator + "controller"), db, dataBase, option);

        //生成resources文件
        generateResources(resources, db, dataBase, option);

        //生成webapp
        generateWebxWebapp(webapp, db, dataBase, option);
        //生成webapp-angularjs版本
        File file = new File(webapp.getAbsolutePath() + "-angularjs");
        file.mkdirs();
        generateWebxWebappAngularjs(file, db, dataBase, option);

        //生成test
        generateResources(testResources, db, dataBase, option);
        generateTest(testSrc, db, dataBase, option);
        return true;
    }

    private void clear(File f) {
        if (f.isDirectory()) {
            File[] files = f.listFiles();
            for (File file : files) {
                if (file.getName().equals(".idea") || file.getName().equals("target") || file.getName().endsWith(".iml")) {
                    continue;
                }
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
     * @param f       目录
     * @param exclude 排除
     */
    private void clear(File f, String exclude) {
        if (f.isDirectory()) {
            File[] files = f.listFiles();
            for (File file : files) {
                if (file.isDirectory()) {
                    if (!file.getName().contains(exclude)) {
                        clear(file);
                        boolean delete = file.delete();

                        System.out.println("删除" + file.getName() + (delete ? "成功" : "失败"));
                    }
                } else {
                    if (!file.getName().contains(exclude)) {
                        boolean delete = file.delete();

                        System.out.println("删除" + file.getName() + (delete ? "成功" : "失败"));
                    }
                }
            }
        }
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
            Template template = velocityEngine.getTemplate("/templates/" + option + "/pom.vm", "UTF-8");
            outputVM(file, template, ctx);
        } catch (Exception e) {

        }
    }

    /**
     * 生成entity
     *
     * @param root
     * @param db
     */
    public void generateEntity(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
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
                Template template = velocityEngine.getTemplate("/templates/" + option + "/java/ent/entity.vm", "UTF-8");
                outputVM(file, template, ctx);

            } catch (Exception e) {

            }
        }
    }

    /**
     * 生成Enums
     *
     * @param root
     * @param db
     */
    public void generateEnums(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        try {
            VelocityContext ctx = new VelocityContext();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("author", db.getAuthor());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            File file = new File(root.getAbsolutePath() + File.separator +"Type.java");
            Template template = velocityEngine.getTemplate("/templates/" + option + "/java/enums/Type.vm", "UTF-8");
            outputVM(file, template, ctx);

        } catch (Exception e) {

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
            clear(root);
        }

        try {
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            outputVM(new File(root.getAbsolutePath() + File.separator + "Authorizations" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/filter/Authorizations.vm", "UTF-8"), ctx);
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
            clear(root);
        }
        VelocityContext ctx = new VelocityContext();

        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("author", db.getAuthor());
        ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

        for (Table table : db.getTables()) {
            try {
                ctx.put("table", table);

                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".java"),
                        velocityEngine.getTemplate("/templates/" + option + "/java/mpr/mapperJava.vm", "UTF-8"), ctx);

                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".xml"),
                        velocityEngine.getTemplate("/templates/" + option + "/java/mpr/mapper.vm", "UTF-8"), ctx);

            } catch (Exception e) {

            }
        }
    }

    public void generateManager(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
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

                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Manager" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/mgr/manager.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "ManagerImpl" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/mgr/managerImpl.vm", "UTF-8"), ctx);
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
            clear(root);
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
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateRequest" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/req/createRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteRequest" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/req/deleteRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateRequest" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/req/updateRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindRequest" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/req/findRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchRequest" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/req/searchRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllRequest" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/req/GetAllRequestClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetRequest" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/req/getRequestClass.vm", "UTF-8"), ctx);
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
            clear(root);
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
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateResponse" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/rsp/createResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteResponse" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/rsp/deleteResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateResponse" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/rsp/updateResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindResponse" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/rsp/findResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchResponse" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/rsp/searchResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllResponse" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/rsp/GetAllResponseClass.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetResponse" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/java/rsp/getResponseClass.vm", "UTF-8"), ctx);
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
            clear(root);
        }
        try {
            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("timestamp", new Date().getTime());

            File base = new  File(root.getAbsolutePath() + File.separator+"base");
            base.mkdirs();
            File freemarker = new  File(root.getAbsolutePath() + File.separator+"freemarker");
            freemarker.mkdirs();
            File utils = new  File(root.getAbsolutePath() + File.separator+"utils");
            utils.mkdirs();

            outputVM(new File(base.getAbsolutePath() + File.separator + "Error.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/Error.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "ErrorType.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/ErrorType.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "UserToken.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/UserToken.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LocalData.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/LocalData.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "IDgenerator.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/IDgenerator.vm", "UTF-8"), ctx);
            outputVM(new File(utils.getAbsolutePath() + File.separator + "LogUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/utils/LogUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Message.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/Message.vm", "UTF-8"), ctx);
            outputVM(new File(utils.getAbsolutePath() + File.separator + "MapperUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/utils/MapperUtil.vm", "UTF-8"), ctx);
            outputVM(new File(utils.getAbsolutePath() + File.separator + "MD5Util.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/utils/MD5Util.vm", "UTF-8"), ctx);
            outputVM(new File(utils.getAbsolutePath() + File.separator + "RSAUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/utils/RSAUtil.vm", "UTF-8"), ctx);
            outputVM(new File(utils.getAbsolutePath() + File.separator + "WebUtils.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/utils/WebUtils.vm", "UTF-8"), ctx);
//            outputVM(new File(root.getAbsolutePath() + File.separator + "DataFormatUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/DataFormatUtil.vm", "UTF-8"), ctx);
//            outputVM(new File(root.getAbsolutePath() + File.separator + "BaseUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/BaseUtil.vm", "UTF-8"), ctx);
            outputVM(new File(utils.getAbsolutePath() + File.separator + "ValidationUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/utils/ValidationUtil.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseEntity.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseEntity.vm", "UTF-8"), ctx);
            outputVM(new File(utils.getAbsolutePath() + File.separator + "CookieUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/utils/CookieUtil.vm", "UTF-8"), ctx);


            outputVM(new File(freemarker.getAbsolutePath() + File.separator + "FreemarkerViewNameTranslator.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/freemarker/FreemarkerViewNameTranslator.vm", "UTF-8"), ctx);
            outputVM(new File(freemarker.getAbsolutePath() + File.separator + "Layout.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/freemarker/Layout.vm", "UTF-8"), ctx);
            outputVM(new File(freemarker.getAbsolutePath() + File.separator + "Url.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/freemarker/Url.vm", "UTF-8"), ctx);

            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseFindRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseFindRequest.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseFindResponse.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseFindResponse.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseGetAllResponse.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseGetAllResponse.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseRequest.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseResponse.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseResponse.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseSearchRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseSearchRequest.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseSearchResponse.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseSearchResponse.vm", "UTF-8"), ctx);
            outputVM(new File(base.getAbsolutePath() + File.separator + "BaseUpdateRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/java/framework/base/BaseUpdateRequest.vm", "UTF-8"), ctx);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成Controller类
     *
     * @param root
     * @param db
     */
    public void generateController(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        try {
            VelocityContext ctx = new VelocityContext();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("db", db);
            ctx.put("table", db.getTables());
            ctx.put("author", db.getAuthor());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            outputVM(new File(root.getAbsolutePath() + File.separator + "AjaxController.java"), velocityEngine.getTemplate("/templates/" + option + "/java/controller/AjaxController.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "IndexController.java"), velocityEngine.getTemplate("/templates/" + option + "/java/controller/IndexController.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LoginController.java"), velocityEngine.getTemplate("/templates/" + option + "/java/controller/LoginController.vm", "UTF-8"), ctx);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成Resources spring,spring-mvc,mybatis,jdbc
     *
     * @param root
     * @param db
     */
    public void generateResources(File root, DB db, DataBase dataBase, String option) {
        try {
            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            if (root.getAbsolutePath().contains("test")) {
                ctx.put("isTest", true);
            } else {
                ctx.put("isTest", false);
            }
            outputVM(new File(root.getAbsolutePath() + File.separator + "spring.xml"), velocityEngine.getTemplate("/templates/" + option + "/resources/spring.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "spring-mvc.xml"), velocityEngine.getTemplate("/templates/" + option + "/resources/spring-mvc.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "spring-mybatis.xml"), velocityEngine.getTemplate("/templates/" + option + "/resources/spring-mybatis.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "logback.xml"), velocityEngine.getTemplate("/templates/" + option + "/resources/logback.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "jdbc.properties"), velocityEngine.getTemplate("/templates/" + option + "/resources/jdbc.properties.vm", "UTF-8"), ctx);

        } catch (Exception e) {

        }

        if (!root.getAbsolutePath().contains("test")) {
            File tableDir = new File(root.getAbsolutePath() + File.separator + db.getModuleName() + "_table");
            tableDir.mkdirs();

            try {
                Template t = velocityEngine.getTemplate("/templates/" + option + "/resources/table.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();
                ctx.put("tool", Tool.class);
                ctx.put("dataBase", dataBase.toString());
                ctx.put("db", db);
                ctx.put("author", db.getAuthor());
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("dBmapper", dBmapper);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));


                for (Table table : db.getTables()) {
                    File f = new File(tableDir.getAbsolutePath() + File.separator + table.getTableName() + ".sql");
                    f.createNewFile();

                    ctx.put("table", table);
                    OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
                    try {
                        t.merge(ctx, writer);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        writer.close();
                    }

                }
            } catch (Exception e) {

            }
            try {
                File f = new File(tableDir.getAbsolutePath() + File.separator + "ALL_TABLE.sql");
                f.createNewFile();

                Template t = velocityEngine.getTemplate("/templates/" + option + "/resources/tableAll.vm", "UTF-8");
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

    public void generateTest(File root, DB db, DataBase dataBase, String option) {
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
        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("author", db.getAuthor());
        ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        try {

            File static_ = new File(root.getAbsolutePath() + File.separator + "static");
            boolean mkdirs = static_.mkdirs();
            File css = new File(static_.getAbsolutePath() + File.separator + "css");
            boolean mkdirs1 = css.mkdirs();
            File js = new File(static_.getAbsolutePath() + File.separator + "js");
            boolean mkdirs2 = js.mkdirs();

            {//js文件
                outputVM(new File(js.getAbsolutePath() + File.separator + "services.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp/static/js/services.vm", "UTF-8"), ctx);
                revert(new File(js.getAbsolutePath() + File.separator + "services.js"));
                outputVM(new File(js.getAbsolutePath() + File.separator + "tools.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp/static/js/tools.vm", "UTF-8"), ctx);
                revert(new File(js.getAbsolutePath() + File.separator + "tools.js"));
                outputVM(new File(js.getAbsolutePath() + File.separator + "jquery-3.2.1.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp/static/js/jquery-3.2.1.vm", "UTF-8"), ctx);
                revert(new File(js.getAbsolutePath() + File.separator + "jquery-3.2.1.js"));
            }


            File WEB_INF_DIR = new File(root.getAbsolutePath() + File.separator + "WEB-INF");
            WEB_INF_DIR.mkdirs();

            {//生成WEB-INF下的web.xml等文件
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "web.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/web.vm", "UTF-8"), ctx);
            }

            {//生成WEB-INF下的文件夹
                File views = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "views");
                views.mkdirs();
                outputVM(new File(views.getAbsolutePath() + File.separator + "index.jsp"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/views/index.vm", "UTF-8"), ctx);
                revert(new File(views.getAbsolutePath() + File.separator + "index.jsp"));

                File include = new File(views.getAbsolutePath() + File.separator + "include");
                include.mkdirs();
                outputVM(new File(include.getAbsolutePath() + File.separator + "top.jsp"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/views/include/top.vm", "UTF-8"), ctx);
                outputVM(new File(include.getAbsolutePath() + File.separator + "foot.jsp"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/views/include/foot.vm", "UTF-8"), ctx);
                revert(new File(include.getAbsolutePath() + File.separator + "top.jsp"));
                revert(new File(include.getAbsolutePath() + File.separator + "foot.jsp"));

                File ftl = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "ftl");
                ftl.mkdirs();
                File control = new File(ftl.getAbsolutePath() + File.separator + "control");
                control.mkdirs();
                File layout = new File(ftl.getAbsolutePath() + File.separator + "layout");
                layout.mkdirs();
                File screen = new File(ftl.getAbsolutePath() + File.separator + "screen");
                screen.mkdirs();
                outputVM(new File(control.getAbsolutePath() + File.separator + "footer.ftl"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/ftl/control/footer.vm", "UTF-8"), ctx);
                revert(new File(control.getAbsolutePath() + File.separator + "footer.ftl"));
                outputVM(new File(control.getAbsolutePath() + File.separator + "header.ftl"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/ftl/control/header.vm", "UTF-8"), ctx);
                revert(new File(control.getAbsolutePath() + File.separator + "header.ftl"));
                outputVM(new File(control.getAbsolutePath() + File.separator + "macro.ftl"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/ftl/control/macro.vm", "UTF-8"), ctx);
                revert(new File(control.getAbsolutePath() + File.separator + "macro.ftl"));
                outputVM(new File(layout.getAbsolutePath() + File.separator + "default.ftl"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/ftl/layout/default.vm", "UTF-8"), ctx);
                revert(new File(layout.getAbsolutePath() + File.separator + "default.ftl"));
                outputVM(new File(screen.getAbsolutePath() + File.separator + "index.ftl"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/ftl/screen/index.vm", "UTF-8"), ctx);
                revert(new File(screen.getAbsolutePath() + File.separator + "index.ftl"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * webxWebappAngularjs文件夹及文件生成
     *
     * @param root
     * @param db
     * @param option
     */
    public void generateWebxWebappAngularjs(File root, DB db, DataBase dataBase, String option) {
        VelocityContext ctx = new VelocityContext();
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("author", db.getAuthor());
        ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        try {

            File static_ = new File(root.getAbsolutePath() + File.separator + "static");
            boolean mkdirs = static_.mkdirs();
            File styles = new File(static_.getAbsolutePath() + File.separator + "styles");
            boolean mkdirs1 = styles.mkdirs();
            File scripts = new File(static_.getAbsolutePath() + File.separator + "scripts");
            boolean mkdirs2 = scripts.mkdirs();
            File ctrls = new File(scripts.getAbsolutePath() + File.separator + "ctrls");
            boolean mkdirs3 = ctrls.mkdirs();
            File libs = new File(scripts.getAbsolutePath() + File.separator + "libs");
            boolean mkdirs4 = libs.mkdirs();

            {//scripts文件
                outputVM(new File(scripts.getAbsolutePath() + File.separator + "home.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/home.vm", "UTF-8"), ctx);
                revert(new File(scripts.getAbsolutePath() + File.separator + "home.js"));
                outputVM(new File(scripts.getAbsolutePath() + File.separator + "home-filter.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/home-filter.vm", "UTF-8"), ctx);
                revert(new File(scripts.getAbsolutePath() + File.separator + "home-filter.js"));
                outputVM(new File(scripts.getAbsolutePath() + File.separator + "home-services.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/home-services.vm", "UTF-8"), ctx);
                revert(new File(scripts.getAbsolutePath() + File.separator + "home-services.js"));
                outputVM(new File(ctrls.getAbsolutePath() + File.separator + "demoCtrl.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/ctrls/demoCtrl.vm", "UTF-8"), ctx);
                revert(new File(ctrls.getAbsolutePath() + File.separator + "demoCtrl.js"));
                outputVM(new File(libs.getAbsolutePath() + File.separator + "angular-locale_zh-cn.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/libs/angular-locale_zh-cn.vm", "UTF-8"), ctx);
                revert(new File(libs.getAbsolutePath() + File.separator + "angular-locale_zh-cn.js"));
                outputVM(new File(libs.getAbsolutePath() + File.separator + "jquery-3.2.1.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/libs/jquery-3.2.1.vm", "UTF-8"), ctx);
                revert(new File(libs.getAbsolutePath() + File.separator + "jquery-3.2.1.js"));
                outputVM(new File(libs.getAbsolutePath() + File.separator + "tools.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/libs/tools.vm", "UTF-8"), ctx);
                revert(new File(libs.getAbsolutePath() + File.separator + "tools.js"));
                outputVM(new File(libs.getAbsolutePath() + File.separator + "ui-bootstrap-tpls-1.3.2.js"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/scripts/libs/ui-bootstrap-tpls-1.3.2.vm", "UTF-8"), ctx);
                revert(new File(libs.getAbsolutePath() + File.separator + "ui-bootstrap-tpls-1.3.2.js"));
            }

            {//styles文件
                outputVM(new File(styles.getAbsolutePath() + File.separator + "base.css"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/styles/base.vm", "UTF-8"), ctx);
                outputVM(new File(styles.getAbsolutePath() + File.separator + "bootstrap.min.css"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/static/styles/bootstrap.min.vm", "UTF-8"), ctx);
            }


            File WEB_INF_DIR = new File(root.getAbsolutePath() + File.separator + "WEB-INF");
            WEB_INF_DIR.mkdirs();

            {//生成WEB-INF下的web.xml等文件
                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "web.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/WEB-INF/web.vm", "UTF-8"), ctx);
            }

            {//生成WEB-INF下的文件夹
                File views = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "views");
                views.mkdirs();
                outputVM(new File(views.getAbsolutePath() + File.separator + "index.jsp"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/WEB-INF/views/index.vm", "UTF-8"), ctx);
                revert(new File(views.getAbsolutePath() + File.separator + "index.jsp"));

                File include = new File(views.getAbsolutePath() + File.separator + "include");
                include.mkdirs();
                outputVM(new File(include.getAbsolutePath() + File.separator + "top.jsp"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/WEB-INF/views/include/top.vm", "UTF-8"), ctx);
                outputVM(new File(include.getAbsolutePath() + File.separator + "foot.jsp"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/WEB-INF/views/include/foot.vm", "UTF-8"), ctx);
                outputVM(new File(include.getAbsolutePath() + File.separator + "head.jsp"), velocityEngine.getTemplate("/templates/" + option + "/webapp-angularjs/WEB-INF/views/include/head.vm", "UTF-8"), ctx);
                revert(new File(include.getAbsolutePath() + File.separator + "top.jsp"));
                revert(new File(include.getAbsolutePath() + File.separator + "foot.jsp"));
                revert(new File(include.getAbsolutePath() + File.separator + "head.jsp"));
            }

        } catch (Exception e) {
            e.printStackTrace();
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

    private void revert(File file) {
        StringBuffer sb = new StringBuffer("");
        BufferedReader bufferedReader = null;
        BufferedWriter bufferedWriter = null;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                str = str.replaceAll("=%=","\\$");
                str = str.replaceAll("=#=","\\#");
                sb.append(str+"\n");
            }
            bufferedReader.close();

            bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
            bufferedWriter.write(sb.toString());
            bufferedWriter.flush();
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }
    }
}
