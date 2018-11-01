package xyz.wbsite.dbtool.javafx.manger.callable;

import xyz.wbsite.dbtool.javafx.enumeration.DataBase;
import xyz.wbsite.dbtool.javafx.manger.DBManager;
import xyz.wbsite.dbtool.javafx.manger.FreeMarkerManager;
import xyz.wbsite.dbtool.javafx.manger.ManagerFactory;
import xyz.wbsite.dbtool.javafx.manger.XmlManager;
import xyz.wbsite.dbtool.javafx.po.AbstractDBmapper;
import xyz.wbsite.dbtool.javafx.po.Module;
import xyz.wbsite.dbtool.javafx.po.Table;
import xyz.wbsite.dbtool.javafx.tool.Tool;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.Callable;

import static xyz.wbsite.dbtool.javafx.tool.Tool.clear;

public class SpringMVCMybatisCallable implements Callable {

    private String root;
    private DataBase dataBase;
    private Module md;
    private String option;
    private Tool tool = new Tool();

    private FreeMarkerManager freeMarkerManager;

    public SpringMVCMybatisCallable(String root, DataBase dataBase, Module md, String option) {
        this.root = root;
        this.dataBase = dataBase;
        this.md = md;
        this.option = option;
        this.freeMarkerManager = ManagerFactory.getFreeMarkerManager();
    }

    private AbstractDBmapper dBmapper;

    public Boolean call() throws Exception {

        File module = new File(root + File.separator + md.getModuleName());
        if (!module.exists()) {
            module.mkdir();
        } else {
            clear(module);
        }

        dBmapper = DBManager.dBmapper;

        String basePackage = md.getBasePackage();

        String[] split = basePackage.split("\\.");

        System.out.println("生成模块:Pom");
        generatePom(module, md, dataBase, option);
        StringBuffer stringBuffer = new StringBuffer(module.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("java");
        for (String s : split) {
            stringBuffer.append(File.separator).append(s);
        }
        stringBuffer.append(File.separator).append(md.getModuleName());

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

        {
            //生成Controller
            System.out.println("生成模块:controller");
            generateController(new File(src.getParentFile().getAbsolutePath() + File.separator + "controller"), md, dataBase, option);

            {
                //module
                System.out.println("生成模块:Entity");
                generateEntity(new File(src.getAbsolutePath() + File.separator + "ent"), md, dataBase, option);
                System.out.println("生成模块:Enums");
                generateEnums(new File(src.getAbsolutePath() + File.separator + "enums"), md, dataBase, option);
                System.out.println("生成模块:Filter");
                generateFilter(new File(src.getAbsolutePath() + File.separator + "filter"), md, dataBase, option);
                System.out.println("生成模块:Mapper");
                generateMapper(new File(src.getAbsolutePath() + File.separator + "mpr"), md, dataBase, option);
                System.out.println("生成模块:Manager");
                generateManager(new File(src.getAbsolutePath() + File.separator + "mgr"), md, dataBase, option);
                System.out.println("生成模块:Requset");
                generateRequset(new File(src.getAbsolutePath() + File.separator + "req"), md, dataBase, option);
                System.out.println("生成模块:Response");
                generateResponse(new File(src.getAbsolutePath() + File.separator + "rsp"), md, dataBase, option);
                System.out.println("生成模块:framework");

            }

            //framework
            System.out.println("生成模块:framework");
            generateBase(new File(src.getParentFile().getAbsolutePath() + File.separator + "framework"), md, dataBase, option);

        }

        {//生成resources文件
            System.out.println("生成模块:Resources");
            generateResources(resources, md, dataBase, option);
        }

        {//生成webapp
            System.out.println("生成模块:Webapp");
            generateWebapp(webapp, md, dataBase, option);
        }

        {//生成test 和 testResources
            System.out.println("生成模块:Test 和 TestResources");
            generateResources(testResources, md, dataBase, option);
            generateTest(testSrc, md, dataBase, option);
        }
        System.out.println("finish");
        return true;
    }

    /**
     * 生成POM.xml
     *
     * @param root
     * @param db
     */
    public void generatePom(File root, Module db, DataBase dataBase, String option) {
        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());

            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "pom.xml"), option + "/pom.ftl", ctx);
        } catch (Exception e) {

        }
    }

    /**
     * 生成entity
     *
     * @param root
     * @param db
     */
    public void generateEntity(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        for (Table table : md.getTables()) {
            try {
                HashMap<String, Object> ctx = new HashMap<String, Object>();
                ctx.put("tool", Tool.class);
                ctx.put("basePackage", md.getBasePackage());
                ctx.put("moduleName", md.getModuleName());
                ctx.put("table", table);
                ctx.put("author", md.getAuthor());
                ctx.put("date", new Date());

                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + ".java"), option + "/java/ent/entity.ftl", ctx);

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
    public void generateEnums(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());

            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "Type.java"), option + "/java/enums/Type.ftl", ctx);

        } catch (Exception e) {

        }

    }

    /**
     * 生成Filter
     *
     * @param root
     * @param db
     */
    public void generateFilter(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());

            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "Authorizations" + ".java"), option + "/java/filter/Authorizations.ftl", ctx);
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
    public void generateMapper(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());

        for (Table table : md.getTables()) {
            try {
                ctx.put("table", table);

                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".java"), option + "/java/mpr/mapperJava.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".xml"), option + "/java/mpr/mapper.ftl", ctx);

            } catch (Exception e) {

            }
        }
    }

    public void generateManager(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());

            for (Table table : md.getTables()) {
                ctx.put("table", table);

                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Manager" + ".java"), option + "/java/mgr/manager.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "ManagerImpl" + ".java"), option + "/java/mgr/managerImpl.ftl", ctx);
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
    public void generateRequset(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        try {

            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());

            for (Table table : md.getTables()) {
                ctx.put("table", table);

                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateRequest" + ".java"), option + "/java/req/createRequestClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteRequest" + ".java"), option + "/java/req/deleteRequestClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateRequest" + ".java"), option + "/java/req/updateRequestClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindRequest" + ".java"), option + "/java/req/findRequestClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchRequest" + ".java"), option + "/java/req/searchRequestClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllRequest" + ".java"), option + "/java/req/GetAllRequestClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetRequest" + ".java"), option + "/java/req/getRequestClass.ftl", ctx);
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
    public void generateResponse(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());

            for (Table table : md.getTables()) {
                ctx.put("table", table);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateResponse" + ".java"), option + "/java/rsp/createResponseClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteResponse" + ".java"), option + "/java/rsp/deleteResponseClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateResponse" + ".java"), option + "/java/rsp/updateResponseClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindResponse" + ".java"), option + "/java/rsp/findResponseClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchResponse" + ".java"), option + "/java/rsp/searchResponseClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllResponse" + ".java"), option + "/java/rsp/GetAllResponseClass.ftl", ctx);
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetResponse" + ".java"), option + "/java/rsp/getResponseClass.ftl", ctx);
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
    public void generateBase(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("timestamp", new Date().getTime());

            File base = new File(root.getAbsolutePath() + File.separator + "base");
            base.mkdirs();
            File freemarker = new File(root.getAbsolutePath() + File.separator + "freemarker");
            freemarker.mkdirs();
            File springmvc = new File(root.getAbsolutePath() + File.separator + "springmvc");
            springmvc.mkdirs();
            File utils = new File(root.getAbsolutePath() + File.separator + "utils");
            utils.mkdirs();

            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseEntity.java"), option + "/java/framework/base/BaseEntity.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseFindRequest.java"), option + "/java/framework/base/BaseFindRequest.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseFindResponse.java"), option + "/java/framework/base/BaseFindResponse.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseGetAllRequest.java"), option + "/java/framework/base/BaseGetAllRequest.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseRequest.java"), option + "/java/framework/base/BaseRequest.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseResponse.java"), option + "/java/framework/base/BaseResponse.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseSearchRequest.java"), option + "/java/framework/base/BaseSearchRequest.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "BaseUpdateRequest.java"), option + "/java/framework/base/BaseUpdateRequest.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "Error.java"), option + "/java/framework/base/Error.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "ErrorType.java"), option + "/java/framework/base/ErrorType.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "SortType.java"), option + "/java/framework/base/SortType.java", ctx);
            freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "Token.java"), option + "/java/framework/base/Token.java", ctx);


            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "AESUtil.java"), option + "/java/framework/utils/AESUtil.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "Base64Util.java"), option + "/java/framework/utils/Base64Util.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "CookieUtil.java"), option + "/java/framework/utils/CookieUtil.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "IDgenerator.java"), option + "/java/framework/utils/IDgenerator.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "LocalData.java"), option + "/java/framework/utils/LocalData.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "LogUtil.java"), option + "/java/framework/utils/LogUtil.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "MapperUtil.java"), option + "/java/framework/utils/MapperUtil.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "MD5Util.java"), option + "/java/framework/utils/MD5Util.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "Message.java"), option + "/java/framework/utils/Message.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "ProcessUtil.java"), option + "/java/framework/utils/ProcessUtil.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "RSAUtil.java"), option + "/java/framework/utils/RSAUtil.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "ValidationUtil.java"), option + "/java/framework/utils/ValidationUtil.java", ctx);
            freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "WebUtils.java"), option + "/java/framework/utils/WebUtils.java", ctx);


            freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath() + File.separator + "ViewNameTranslator.java"), option + "/java/framework/freemarker/ViewNameTranslator.java", ctx);
            freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath() + File.separator + "Layout.java"), option + "/java/framework/freemarker/Layout.java", ctx);
            freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath() + File.separator + "Url.java"), option + "/java/framework/freemarker/Url.java", ctx);

            freeMarkerManager.outputTemp(new File(springmvc.getAbsolutePath() + File.separator + "GlobalHandlerInterceptor.java"), option + "/java/framework/springmvc/GlobalHandlerInterceptor.java", ctx);
            freeMarkerManager.outputTemp(new File(springmvc.getAbsolutePath() + File.separator + "GlobalObjectMapper.java"), option + "/java/framework/springmvc/GlobalObjectMapper.java", ctx);
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
    public void generateController(File root, Module db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("db", db);
            ctx.put("table", md.getTables());
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());

            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "AjaxController.java"), option + "/java/controller/AjaxController.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "GlobalController.java"), option + "/java/controller/GlobalController.ftl", ctx);

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
    public void generateResources(File root, Module db, DataBase dataBase, String option) {
        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();

            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            if (root.getAbsolutePath().contains("test")) {
                ctx.put("isTest", true);
            } else {
                ctx.put("isTest", false);
            }
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "spring.xml"), option + "/resources/spring.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "spring-mvc.xml"), option + "/resources/spring-mvc.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "spring-mybatis.xml"), option + "/resources/spring-mybatis.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "logback.xml"), option + "/resources/logback.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "jdbc.properties"), option + "/resources/jdbc.properties.ftl", ctx);

        } catch (Exception e) {

        }

        if (!root.getAbsolutePath().contains("test")) {
            File tableDir = new File(root.getAbsolutePath() + File.separator + md.getModuleName() + "_table");
            tableDir.mkdirs();
            File dbtool = new File(root.getAbsolutePath() + File.separator + "dbtool");
            dbtool.mkdirs();
            {
                XmlManager xmlManager = ManagerFactory.getXmlManager();
                ArrayList<Module> dbs = new ArrayList<>();
                dbs.add(db);
                xmlManager.saveAs(dbtool.getAbsolutePath(), dbs);
            }

            try {
                HashMap<String, Object> ctx = new HashMap<String, Object>();
                ctx.put("tool", Tool.class);
                ctx.put("dataBase", dataBase.toString());
                ctx.put("db", db);
                ctx.put("author", md.getAuthor());
                ctx.put("basePackage", md.getBasePackage());
                ctx.put("moduleName", md.getModuleName());
                ctx.put("dBmapper", dBmapper);
                ctx.put("date", new Date());

                for (Table table : md.getTables()) {
                    ctx.put("table", table);
                    freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath() + File.separator + table.getTableName() + ".sql"), option + "/resources/table.ftl", ctx);
                }
            } catch (Exception e) {

            }
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("dataBase", dataBase.toString());
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("db", db);
            ctx.put("dBmapper", dBmapper);

            freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath() + File.separator + "ALL_TABLE.sql"), option + "/resources/tableAll.ftl", ctx);
        }
    }

    public void generateTest(File root, Module db, DataBase dataBase, String option) {
        File module = new File(root.getAbsolutePath() + File.separator + md.getModuleName());
        module.mkdirs();

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("tool", tool);
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("date", new Date());
        for (Table table : md.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(module.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Test" + ".java"), option + "/test/test.ftl", ctx);
        }
    }

    /**
     * webapp文件夹及文件生成
     *
     * @param root
     * @param db
     * @param option
     */
    public void generateWebapp(File root, Module db, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());
        try {

            File static_ = new File(root.getAbsolutePath() + File.separator + "static");
            boolean mkdirs = static_.mkdirs();
            File css = new File(static_.getAbsolutePath() + File.separator + "css");
            boolean mkdirs1 = css.mkdirs();
            File dist = new File(static_.getAbsolutePath() + File.separator + "dist");
            boolean mkdirs5 = dist.mkdirs();
            File fonts = new File(static_.getAbsolutePath() + File.separator + "fonts");
            boolean mkdirs6 = fonts.mkdirs();
            File js = new File(static_.getAbsolutePath() + File.separator + "js");
            boolean mkdirs2 = js.mkdirs();
            File img = new File(static_.getAbsolutePath() + File.separator + "img");
            boolean mkdirs3 = img.mkdirs();

            File lib = new File(static_.getAbsolutePath() + File.separator + "lib");
            boolean mkdirs4 = lib.mkdirs();

            {//css文件
                freeMarkerManager.outputTemp(new File(css.getAbsolutePath() + File.separator + "base.css"), option + "/webapp/static/css/base.css", ctx);
            }
            {//dist文件

                Tool.outputResource(option + "/webapp/static/dist/lib.min.css", new File(dist.getAbsolutePath() + File.separator + "lib.min.css"));
                Tool.outputResource(option + "/webapp/static/dist/lib.min.js", new File(dist.getAbsolutePath() + File.separator + "lib.min.js"));


                Tool.outputResource(option + "/webapp/static/dist/fonts/element-icons.woff", new File(fonts.getAbsolutePath() + File.separator + "element-icons.woff"));
                Tool.outputResource(option + "/webapp/static/dist/fonts/w-e-icon.woff", new File(fonts.getAbsolutePath() + File.separator + "w-e-icon.woff"));

            }

            {//js文件
                freeMarkerManager.outputTemp(new File(js.getAbsolutePath() + File.separator + "services.js"), option + "/webapp/static/js/services.ftl", ctx);
            }
            {//img
                Tool.outputResource(option + "/webapp/static/img/favicon.ico", new File(img.getAbsolutePath() + File.separator + "favicon.ico"));
                Tool.outputResource(option + "/webapp/static/img/logo.png", new File(img.getAbsolutePath() + File.separator + "logo.png"));
            }

            File WEB_INF_DIR = new File(root.getAbsolutePath() + File.separator + "WEB-INF");
            WEB_INF_DIR.mkdirs();

            {//生成WEB-INF下的web.xml等文件
                freeMarkerManager.outputTemp(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "web.xml"), option + "/webapp/WEB-INF/web.ftl", ctx);
            }

            {//生成WEB-INF下的文件夹
                File views = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "views");
                views.mkdirs();
                Tool.outputResource(option + "/webapp/WEB-INF/views/index.ftl", new File(views.getAbsolutePath() + File.separator + "index.jsp"));

                File include = new File(views.getAbsolutePath() + File.separator + "include");
                include.mkdirs();
                Tool.outputResource(option + "/webapp/WEB-INF/views/include/top.ftl", new File(include.getAbsolutePath() + File.separator + "top.jsp"));
                Tool.outputResource(option + "/webapp/WEB-INF/views/include/foot.ftl", new File(include.getAbsolutePath() + File.separator + "foot.jsp"));

                File ftl = new File(root.getAbsolutePath() + File.separator + "WEB-INF" + File.separator + "ftl");
                ftl.mkdirs();
                File control = new File(ftl.getAbsolutePath() + File.separator + "control");
                control.mkdirs();
                File layout = new File(ftl.getAbsolutePath() + File.separator + "layout");
                layout.mkdirs();
                File screen = new File(ftl.getAbsolutePath() + File.separator + "screen");
                screen.mkdirs();
                Tool.outputResource(option + "/webapp/WEB-INF/ftl/control/header.ftl", new File(control.getAbsolutePath() + File.separator + "header.ftl"));
                Tool.outputResource(option + "/webapp/WEB-INF/ftl/control/footer.ftl", new File(control.getAbsolutePath() + File.separator + "footer.ftl"));
                Tool.outputResource(option + "/webapp/WEB-INF/ftl/control/macro.ftl", new File(control.getAbsolutePath() + File.separator + "macro.ftl"));
                Tool.outputResource(option + "/webapp/WEB-INF/ftl/layout/default.ftl", new File(layout.getAbsolutePath() + File.separator + "default.ftl"));
                Tool.outputResource(option + "/webapp/WEB-INF/ftl/screen/index.ftl", new File(screen.getAbsolutePath() + File.separator + "index.ftl"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
