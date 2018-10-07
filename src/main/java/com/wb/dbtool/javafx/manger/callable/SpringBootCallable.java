package com.wb.dbtool.javafx.manger.callable;

import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.manger.DBManager;
import com.wb.dbtool.javafx.manger.FreeMarkerManager;
import com.wb.dbtool.javafx.manger.ManagerFactory;
import com.wb.dbtool.javafx.manger.XmlManager;
import com.wb.dbtool.javafx.po.AbstractDBmapper;
import com.wb.dbtool.javafx.po.Module;
import com.wb.dbtool.javafx.po.Table;
import com.wb.dbtool.javafx.tool.Tool;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.Callable;

import static com.wb.dbtool.javafx.tool.Tool.clear;

public class SpringBootCallable implements Callable {

    private String root;
    private DataBase dataBase;
    private Module md;
    private String option;

    private FreeMarkerManager freeMarkerManager;

    public SpringBootCallable(String root, DataBase dataBase, Module md, String option) {
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

        {//生成java文件
            //生成Controller
            System.out.println("生成模块:controller");
            generateController(new File(src.getParentFile().getAbsolutePath() + File.separator + "controller"), md, dataBase, option);

            //module
            {
                System.out.println("生成模块:Entity");
                generateEntity(new File(src.getAbsolutePath() + File.separator + "ent"), md, dataBase, option);
                System.out.println("生成模块:Enums");
                generateEnums(new File(src.getAbsolutePath() + File.separator + "enums"), md, dataBase, option);
                System.out.println("生成模块:Mapper");
                generateMapper(new File(src.getAbsolutePath() + File.separator + "mpr"), md, dataBase, option);
                System.out.println("生成模块:Manager");
                generateManager(new File(src.getAbsolutePath() + File.separator + "mgr"), md, dataBase, option);
                System.out.println("生成模块:Requset");
                generateRequset(new File(src.getAbsolutePath() + File.separator + "req"), md, dataBase, option);
                System.out.println("生成模块:Response");
                generateResponse(new File(src.getAbsolutePath() + File.separator + "rsp"), md, dataBase, option);
            }

            //framework
            System.out.println("生成模块:framework");
            generateFramework(new File(src.getParentFile().getAbsolutePath() + File.separator + "framework"), md, dataBase, option);

            System.out.println("生成模块:Application");
            generateApplication(new File(src.getParentFile().getAbsolutePath()), md, dataBase, option);
        }

        {//生成resources文件
            System.out.println("生成模块:Resources");
            generateResources(resources, md, dataBase, option);
            System.out.println("生成模块:Static");
            generateStatic(resources, md, dataBase, option);
            System.out.println("生成模块:Templates");
            generateTemplates(resources, md, dataBase, option);
        }

        {//生成test
            System.out.println("生成模块:Test");
            generateTest(testSrc, md, dataBase, option);
        }
        System.out.println("finish");
        return true;
    }


    /**
     * 生成POM.xml
     *
     * @param root
     * @param md
     */
    public void generatePom(File root, Module md, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());

        File file = new File(root.getAbsolutePath() + File.separator + "pom.xml");

        freeMarkerManager.outputTemp(file, option + "/pom.ftl", ctx);
    }


    /**
     * 生成Controller类
     *
     * @param root
     * @param md
     */
    public void generateController(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("db", md);
        ctx.put("table", md.getTables());
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());

        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "AjaxController.java"), option + "/java/controller/AjaxController.ftl", ctx);
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "GlobalController.java"), option + "/java/controller/GlobalController.ftl", ctx);
    }

    /**
     * 生成entity
     *
     * @param root
     * @param md
     */
    public void generateEntity(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        for (Table table : md.getTables()) {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("table", table);
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());

            File file = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + ".java");

            freeMarkerManager.outputTemp(file, option + "/java/ent/entity.ftl", ctx);
        }
    }

    /**
     * 生成Enums
     *
     * @param root
     * @param md
     */
    public void generateEnums(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("tool", Tool.class);
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());

        File file = new File(root.getAbsolutePath() + File.separator + "Type.java");

        freeMarkerManager.outputTemp(file, option + "/java/enums/Type.ftl", ctx);
    }

    /**
     * 生成Mapper
     *
     * @param root
     * @param md
     */
    public void generateMapper(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("tool", Tool.class);
        ctx.put("db", md);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());

        for (Table table : md.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".java"), option + "/java/mpr/mapperJava.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".xml"), option + "/java/mpr/mapper.ftl", ctx);
        }
    }

    public void generateManager(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
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

    }

    /**
     * 生成Requset
     *
     * @param root
     * @param md
     */
    public void generateRequset(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("tool", Tool.class);
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());

        for (Table table : md.getTables()) {
            ctx.put("table", table);

            if (table.getCreate() != null && table.getCreate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateRequest" + ".java"), option + "/java/req/createRequestClass.ftl", ctx);
            }

            if (table.getDelete() != null && table.getDelete()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteRequest" + ".java"), option + "/java/req/deleteRequestClass.ftl", ctx);
            }

            if (table.getUpdate() != null && table.getUpdate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateRequest" + ".java"), option + "/java/req/updateRequestClass.ftl", ctx);
            }

            if (table.getFind() != null && table.getFind()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindRequest" + ".java"), option + "/java/req/findRequestClass.ftl", ctx);
            }

            if (table.getGet() != null && table.getGet()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetRequest" + ".java"), option + "/java/req/getRequestClass.ftl", ctx);
            }

            if (table.getSearch() != null && table.getSearch()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchRequest" + ".java"), option + "/java/req/searchRequestClass.ftl", ctx);
            }
            if (table.getGetAll() != null && table.getGetAll()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllRequest" + ".java"), option + "/java/req/getAllRequestClass.ftl", ctx);
            }
        }
    }

    /**
     * 生成一般文件
     *
     * @param root
     * @param md
     */
    public void generateResponse(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("tool", Tool.class);
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());

        for (Table table : md.getTables()) {
            ctx.put("table", table);

            if (table.getCreate() != null && table.getCreate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "CreateResponse" + ".java"), option + "/java/rsp/createResponseClass.ftl", ctx);
            }

            if (table.getDelete() != null && table.getDelete()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "DeleteResponse" + ".java"), option + "/java/rsp/deleteResponseClass.ftl", ctx);
            }

            if (table.getUpdate() != null && table.getUpdate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "UpdateResponse" + ".java"), option + "/java/rsp/updateResponseClass.ftl", ctx);
            }

            if (table.getFind() != null && table.getFind()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "FindResponse" + ".java"), option + "/java/rsp/findResponseClass.ftl", ctx);
            }

            if (table.getGet() != null && table.getGet()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetResponse" + ".java"), option + "/java/rsp/getResponseClass.ftl", ctx);
            }

            if (table.getSearch() != null && table.getSearch()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "SearchResponse" + ".java"), option + "/java/rsp/searchResponseClass.ftl", ctx);
            }
            if (table.getGetAll() != null && table.getGetAll()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "GetAllResponse" + ".java"), option + "/java/rsp/getAllResponseClass.ftl", ctx);
            }
        }
    }

    /**
     * 生成framework类
     *
     * @param root
     * @param md
     */
    public void generateFramework(File root, Module md, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("timestamp", new Date().getTime());

        File base = new File(root.getAbsolutePath() + File.separator + "base");
        base.mkdirs();
        File config = new File(root.getAbsolutePath() + File.separator + "config");
        config.mkdirs();
        File freemarker = new File(root.getAbsolutePath() + File.separator + "freemarker");
        freemarker.mkdirs();
        File springmvc = new File(root.getAbsolutePath() + File.separator + "springmvc");
        springmvc.mkdirs();
        File utils = new File(root.getAbsolutePath() + File.separator + "utils");
        utils.mkdirs();

        //base
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
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "FileUploadResponse.java"), option + "/java/framework/base/FileUploadResponse.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "SortType.java"), option + "/java/framework/base/SortType.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath() + File.separator + "Token.java"), option + "/java/framework/base/Token.java", ctx);

        //config
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath() + File.separator + "SecurityConfig.java"), option + "/java/framework/config/SecurityConfig.java", ctx);
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath() + File.separator + "TaskConfig.java"), option + "/java/framework/config/TaskConfig.java", ctx);
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath() + File.separator + "ThreadPoolConfig.java"), option + "/java/framework/config/ThreadPoolConfig.java", ctx);
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath() + File.separator + "WebMvcConfig.java"), option + "/java/framework/config/WebMvcConfig.java", ctx);

        //freemarker
        freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath() + File.separator + "ViewNameTranslator.java"), option + "/java/framework/freemarker/ViewNameTranslator.java", ctx);
        freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath() + File.separator + "Layout.java"), option + "/java/framework/freemarker/Layout.java", ctx);
        freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath() + File.separator + "Uri.java"), option + "/java/framework/freemarker/Uri.java", ctx);

        //springmvc
        freeMarkerManager.outputTemp(new File(springmvc.getAbsolutePath() + File.separator + "GlobalHandlerInterceptor.java"), option + "/java/framework/springmvc/GlobalHandlerInterceptor.java", ctx);

        //uitls
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "Base64Util.java"), option + "/java/framework/utils/Base64Util.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "AESUtil.java"), option + "/java/framework/utils/AESUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "CookieUtil.java"), option + "/java/framework/utils/CookieUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "LogUtil.java"), option + "/java/framework/utils/LogUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "MapperUtil.java"), option + "/java/framework/utils/MapperUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "MD5Util.java"), option + "/java/framework/utils/MD5Util.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "ProcessUtil.java"), option + "/java/framework/utils/ProcessUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "RSAUtil.java"), option + "/java/framework/utils/RSAUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "ValidationUtil.java"), option + "/java/framework/utils/ValidationUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "WebUtils.java"), option + "/java/framework/utils/WebUtils.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "LocalData.java"), option + "/java/framework/utils/LocalData.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "IDgenerator.java"), option + "/java/framework/utils/IDgenerator.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath() + File.separator + "Message.java"), option + "/java/framework/utils/Message.java", ctx);
    }

    /**
     * 生成base类
     *
     * @param root
     * @param md
     */
    public void generateApplication(File root, Module md, DataBase dataBase, String option) {

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("timestamp", new Date().getTime());

        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "Application.java"), option + "/java/Application.ftl", ctx);
    }

    /**
     * 生成properties
     *
     * @param root
     * @param md
     */
    public void generateResources(File root, Module md, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("tool", Tool.class);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("db", md);
        ctx.put("author", md.getAuthor());
        ctx.put("dBmapper", dBmapper);
        ctx.put("date", new Date());
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "application-dev.properties"), option + "/resources/application-dev.properties", ctx);
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "application-prod.properties"), option + "/resources/application-prod.properties", ctx);
        Tool.outputResource(option + "/resources/banner.txt", new File(root.getAbsolutePath() + File.separator + "banner.txt"));
        Tool.outputResource(option + "/resources/logback-config.xml", new File(root.getAbsolutePath() + File.separator + "logback-config.xml"));

        File tableDir = new File(root.getAbsolutePath() + File.separator + md.getModuleName() + "_table");
        tableDir.mkdirs();
        File dbtool = new File(root.getAbsolutePath() + File.separator + "dbtool");
        dbtool.mkdirs();
        {
            XmlManager xmlManager = ManagerFactory.getXmlManager();
            ArrayList<Module> dbs = new ArrayList<>();
            dbs.add(md);
            xmlManager.saveAs(dbtool.getAbsolutePath(), dbs);
        }

        for (Table table : md.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath() + File.separator + table.getTableName() + ".sql"), option + "/resources/table.ftl", ctx);
        }
        freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath() + File.separator + "ALL_TABLE.sql"), option + "/resources/tableAll.ftl", ctx);
    }

    /**
     * 生成static
     *
     * @param root
     * @param md
     */
    public void generateStatic(File root, Module md, DataBase dataBase, String option) {

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", md.getBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("tool", Tool.class);
        ctx.put("db", md);
        ctx.put("author", md.getAuthor());
        ctx.put("date", new Date());

        File static_ = new File(root.getAbsolutePath() + File.separator + "static");
        boolean mkdirs = static_.mkdirs();
        File css = new File(static_.getAbsolutePath() + File.separator + "css");
        boolean mkdirs1 = css.mkdirs();
        File js = new File(static_.getAbsolutePath() + File.separator + "js");
        boolean mkdirs2 = js.mkdirs();
        File img = new File(static_.getAbsolutePath() + File.separator + "img");
        boolean mkdirs3 = img.mkdirs();

        File dist = new File(static_.getAbsolutePath() + File.separator + "dist");
        boolean mkdirs4 = dist.mkdirs();

        {//css文件
            freeMarkerManager.outputTemp(new File(css.getAbsolutePath() + File.separator + "base.css"), option + "/resources/static/css/base.css", ctx);
        }

        {//js文件
            freeMarkerManager.outputTemp(new File(js.getAbsolutePath() + File.separator + "ajax.js"), option + "/resources/static/js/ajax.ftl", ctx);
        }
        {//img
            Tool.outputResource(option + "/resources/static/img/favicon.ico", new File(img.getAbsolutePath() + File.separator + "favicon.ico"));
            Tool.outputResource(option + "/resources/static/img/logo.png", new File(img.getAbsolutePath() + File.separator + "logo.png"));
        }

        {//dist文件

            Tool.outputResource(option + "/resources/static/dist/lib.min.css", new File(dist.getAbsolutePath() + File.separator + "lib.min.css"));
            Tool.outputResource(option + "/resources/static/dist/lib.min.js", new File(dist.getAbsolutePath() + File.separator + "lib.min.js"));


            File fonts = new File(dist.getAbsolutePath() + File.separator + "fonts");
            fonts.mkdirs();

            Tool.outputResource(option + "/resources/static/dist/fonts/element-icons.woff", new File(fonts.getAbsolutePath() + File.separator + "element-icons.woff"));
            Tool.outputResource(option + "/resources/static/dist/fonts/w-e-icon.woff", new File(fonts.getAbsolutePath() + File.separator + "w-e-icon.woff"));

        }
    }

    /**
     * 生成static
     *
     * @param root
     * @param md
     */
    public void generateTemplates(File root, Module md, DataBase dataBase, String option) {
        {//生成
            File templates = new File(root.getAbsolutePath() + File.separator + "templates");
            templates.mkdirs();

            File control = new File(templates.getAbsolutePath() + File.separator + "control");
            control.mkdirs();
            File layout = new File(templates.getAbsolutePath() + File.separator + "layout");
            layout.mkdirs();
            File screen = new File(templates.getAbsolutePath() + File.separator + "screen");
            screen.mkdirs();
            Tool.outputResource(option + "/resources/templates/control/nav.ftl", new File(control.getAbsolutePath() + File.separator + "nav.ftl"));
            Tool.outputResource(option + "/resources/templates/control/header.ftl", new File(control.getAbsolutePath() + File.separator + "header.ftl"));
            Tool.outputResource(option + "/resources/templates/control/footer.ftl", new File(control.getAbsolutePath() + File.separator + "footer.ftl"));
            Tool.outputResource(option + "/resources/templates/control/macro.ftl", new File(control.getAbsolutePath() + File.separator + "macro.ftl"));
            Tool.outputResource(option + "/resources/templates/layout/default.ftl", new File(layout.getAbsolutePath() + File.separator + "default.ftl"));
            Tool.outputResource(option + "/resources/templates/layout/wap.ftl", new File(layout.getAbsolutePath() + File.separator + "wap.ftl"));
            Tool.outputResource(option + "/resources/templates/screen/demo.ftl", new File(screen.getAbsolutePath() + File.separator + "demo.ftl"));
            Tool.outputResource(option + "/resources/templates/screen/index.ftl", new File(screen.getAbsolutePath() + File.separator + "index.ftl"));
            Tool.outputResource(option + "/resources/templates/403.ftl", new File(templates.getAbsolutePath() + File.separator + "403.ftl"));
            Tool.outputResource(option + "/resources/templates/404.ftl", new File(templates.getAbsolutePath() + File.separator + "404.ftl"));
            Tool.outputResource(option + "/resources/templates/500.ftl", new File(templates.getAbsolutePath() + File.separator + "500.ftl"));
        }
    }

    public void generateTest(File root, Module md, DataBase dataBase, String option) {

        File config = new File(root.getAbsolutePath() + File.separator + "config");
        config.mkdirs();
        File module = new File(root.getAbsolutePath() + File.separator + md.getModuleName());
        module.mkdirs();

        {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());
            freeMarkerManager.outputTemp(new File(config.getAbsolutePath() + File.separator + "TestConfig" + ".java"), option + "/test/TestConfig.ftl", ctx);
        }

        for (Table table : md.getTables()) {
            HashMap<String, Object> ctx = new HashMap<String, Object>();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", md.getBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("table", table);
            ctx.put("author", md.getAuthor());
            ctx.put("date", new Date());

            freeMarkerManager.outputTemp(new File(module.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Test" + ".java"), option + "/test/test.ftl", ctx);
        }
    }
}
