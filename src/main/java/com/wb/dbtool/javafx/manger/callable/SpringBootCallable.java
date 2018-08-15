package com.wb.dbtool.javafx.manger.callable;

import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.manger.DBManager;
import com.wb.dbtool.javafx.manger.FreeMarkerManager;
import com.wb.dbtool.javafx.manger.ManagerFactory;
import com.wb.dbtool.javafx.manger.XmlManager;
import com.wb.dbtool.javafx.po.AbstractDBmapper;
import com.wb.dbtool.javafx.po.DB;
import com.wb.dbtool.javafx.po.Table;
import com.wb.dbtool.javafx.tool.Tool;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.Callable;

import static com.wb.dbtool.javafx.tool.Tool.clear;

public class SpringBootCallable implements Callable {

    private String root;
    private DataBase dataBase;
    private DB db;
    private String option;

    private FreeMarkerManager freeMarkerManager;

    public SpringBootCallable(String root, DataBase dataBase, DB db, String option) {
        this.root = root;
        this.dataBase = dataBase;
        this.db = db;
        this.option = option;
        this.freeMarkerManager = ManagerFactory.getFreeMarkerManager();
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
            generateController(new File(src.getParentFile().getAbsolutePath() + File.separator + "controller"), db, dataBase, option);

            //module
            {
                System.out.println("生成模块:Entity");
                generateEntity(new File(src.getAbsolutePath() + File.separator + "ent"), db, dataBase, option);
                System.out.println("生成模块:Enums");
                generateEnums(new File(src.getAbsolutePath() + File.separator + "enums"), db, dataBase, option);
                System.out.println("生成模块:Mapper");
                generateMapper(new File(src.getAbsolutePath() + File.separator + "mpr"), db, dataBase, option);
                System.out.println("生成模块:Manager");
                generateManager(new File(src.getAbsolutePath() + File.separator + "mgr"), db, dataBase, option);
                System.out.println("生成模块:Requset");
                generateRequset(new File(src.getAbsolutePath() + File.separator + "req"), db, dataBase, option);
                System.out.println("生成模块:Response");
                generateResponse(new File(src.getAbsolutePath() + File.separator + "rsp"), db, dataBase, option);
            }

            //framework
            System.out.println("生成模块:framework");
            generateFramework(new File(src.getParentFile().getAbsolutePath() + File.separator + "framework"), db, dataBase, option);

            System.out.println("生成模块:Application");
            generateApplication(new File(src.getParentFile().getAbsolutePath()), db, dataBase, option);
        }

        {//生成resources文件
            System.out.println("生成模块:Resources");
            generateResources(resources, db, dataBase, option);
            System.out.println("生成模块:Static");
            generateStatic(resources, db, dataBase, option);
            System.out.println("生成模块:Templates");
            generateTemplates(resources, db, dataBase, option);
        }

        {//生成test
            System.out.println("生成模块:Test");
            generateTest(testSrc, db, dataBase, option);
        }
        return true;
    }


    /**
     * 生成POM.xml
     *
     * @param root
     * @param db
     */
    public void generatePom(File root, DB db, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());

        File file = new File(root.getAbsolutePath() + File.separator + "pom.xml");

        freeMarkerManager.outputTemp(file, option + "/pom.ftl", ctx);
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
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("db", db);
        ctx.put("table", db.getTables());
        ctx.put("author", db.getAuthor());
        ctx.put("date", new Date());

        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "AjaxController.java"), option + "/java/controller/AjaxController.ftl", ctx);
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "GlobalController.java"), option + "/java/controller/GlobalController.ftl", ctx);
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
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("table", table);
            ctx.put("author", db.getAuthor());
            ctx.put("date", new Date());

            File file = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + ".java");

            freeMarkerManager.outputTemp(file, option + "/java/ent/entity.ftl", ctx);
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

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("tool", Tool.class);
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("author", db.getAuthor());
        ctx.put("date", new Date());

        File file = new File(root.getAbsolutePath() + File.separator + "Type.java");

        freeMarkerManager.outputTemp(file, option + "/java/enums/Type.ftl", ctx);
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
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("author", db.getAuthor());
        ctx.put("date", new Date());

        for (Table table : db.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".java"), option + "/java/mpr/mapperJava.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".xml"), option + "/java/mpr/mapper.ftl", ctx);
        }
    }

    public void generateManager(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("tool", Tool.class);
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("author", db.getAuthor());
        ctx.put("date", new Date());

        for (Table table : db.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Manager" + ".java"), option + "/java/mgr/manager.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "ManagerImpl" + ".java"), option + "/java/mgr/managerImpl.ftl", ctx);
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

            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("author", db.getAuthor());
            ctx.put("date", new Date());

            for (Table table : db.getTables()) {
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
    public void generateResponse(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }

        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("author", db.getAuthor());
            ctx.put("date", new Date());

            for (Table table : db.getTables()) {
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
     * 生成framework类
     *
     * @param root
     * @param db
     */
    public void generateFramework(File root, DB db, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        try {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("timestamp", new Date().getTime());

            File base = new File(root.getAbsolutePath() + File.separator + "base");
            base.mkdirs();
            File config = new File(root.getAbsolutePath() + File.separator + "config");
            config.mkdirs();
            File freemarker = new File(root.getAbsolutePath() + File.separator + "freemarker");
            freemarker.mkdirs();
            File security = new File(root.getAbsolutePath() + File.separator + "security");
            security.mkdirs();
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
            freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath() + File.separator + "Url.java"), option + "/java/framework/freemarker/Url.java", ctx);

            //security
            freeMarkerManager.outputTemp(new File(security.getAbsolutePath() + File.separator + "DAccessDecisionManager.java"), option + "/java/framework/security/DAccessDecisionManager.java", ctx);
            freeMarkerManager.outputTemp(new File(security.getAbsolutePath() + File.separator + "DFilterInvocationSecurityMetadataSource.java"), option + "/java/framework/security/DFilterInvocationSecurityMetadataSource.java", ctx);
            freeMarkerManager.outputTemp(new File(security.getAbsolutePath() + File.separator + "DSecurityContextRepository.java"), option + "/java/framework/security/DSecurityContextRepository.java", ctx);

            //springmvc
            freeMarkerManager.outputTemp(new File(springmvc.getAbsolutePath() + File.separator + "GlobalHandlerInterceptor.java"), option + "/java/framework/springmvc/GlobalHandlerInterceptor.java", ctx);
            freeMarkerManager.outputTemp(new File(springmvc.getAbsolutePath() + File.separator + "GlobalObjectMapper.java"), option + "/java/framework/springmvc/GlobalObjectMapper.java", ctx);
            freeMarkerManager.outputTemp(new File(springmvc.getAbsolutePath() + File.separator + "DFilterSecurityInterceptor.java"), option + "/java/framework/springmvc/DFilterSecurityInterceptor.java", ctx);

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
    public void generateApplication(File root, DB db, DataBase dataBase, String option) {

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("timestamp", new Date().getTime());

//        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "Application.java"), option + "/java/Application.ftl", ctx);
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "Application.java"), option + "/java/Application.ftl", ctx);
    }

    /**
     * 生成properties
     *
     * @param root
     * @param db
     */
    public void generateResources(File root, DB db, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("tool", Tool.class);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("db", db);
        ctx.put("author", db.getAuthor());
        ctx.put("dBmapper", dBmapper);
        ctx.put("date", new Date());
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "application-dev.properties"), option + "/resources/application-dev.properties", ctx);
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath() + File.separator + "application-prod.properties"), option + "/resources/application-prod.properties", ctx);
        Tool.outputResource(option + "/resources/banner.txt", new File(root.getAbsolutePath() + File.separator + "banner.txt"));
        Tool.outputResource(option + "/resources/logback-config.xml", new File(root.getAbsolutePath() + File.separator + "logback-config.xml"));

        File tableDir = new File(root.getAbsolutePath() + File.separator + db.getModuleName() + "_table");
        tableDir.mkdirs();
        File dbtool = new File(root.getAbsolutePath() + File.separator + "dbtool");
        dbtool.mkdirs();
        {
            XmlManager xmlManager = ManagerFactory.getXmlManager();
            ArrayList<DB> dbs = new ArrayList<>();
            dbs.add(db);
            xmlManager.saveAs(dbtool.getAbsolutePath(), dbs);
        }

        for (Table table : db.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath() + File.separator + table.getTableName() + ".sql"), option + "/resources/table.ftl", ctx);
        }
        freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath() + File.separator + "ALL_TABLE.sql"), option + "/resources/tableAll.ftl", ctx);
    }

    /**
     * 生成static
     *
     * @param root
     * @param db
     */
    public void generateStatic(File root, DB db, DataBase dataBase, String option) {

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", db.getBasePackage());
        ctx.put("moduleName", db.getModuleName());
        ctx.put("tool", Tool.class);
        ctx.put("db", db);
        ctx.put("author", db.getAuthor());
        ctx.put("date", new Date());
        try {

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
                freeMarkerManager.outputTemp(new File(js.getAbsolutePath() + File.separator + "services.js"), option + "/resources/static/js/services.ftl", ctx);
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
                Tool.outputResource(option + "/resources/static/dist/fonts/ionicons.svg", new File(fonts.getAbsolutePath() + File.separator + "ionicons.svg"));
                Tool.outputResource(option + "/resources/static/dist/fonts/ionicons.ttf", new File(fonts.getAbsolutePath() + File.separator + "ionicons.ttf"));
                Tool.outputResource(option + "/resources/static/dist/fonts/ionicons.woff", new File(fonts.getAbsolutePath() + File.separator + "ionicons.woff"));
                Tool.outputResource(option + "/resources/static/dist/fonts/w-e-icon.woff", new File(fonts.getAbsolutePath() + File.separator + "w-e-icon.woff"));

            }


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 生成static
     *
     * @param root
     * @param db
     */
    public void generateTemplates(File root, DB db, DataBase dataBase, String option) {
        {//生成
            File templates = new File(root.getAbsolutePath() + File.separator + "templates");
            templates.mkdirs();

            File control = new File(templates.getAbsolutePath() + File.separator + "control");
            control.mkdirs();
            File layout = new File(templates.getAbsolutePath() + File.separator + "layout");
            layout.mkdirs();
            File screen = new File(templates.getAbsolutePath() + File.separator + "screen");
            screen.mkdirs();
            Tool.outputResource(option + "/resources/templates/control/header.ftl", new File(control.getAbsolutePath() + File.separator + "header.ftl"));
            Tool.outputResource(option + "/resources/templates/control/footer.ftl", new File(control.getAbsolutePath() + File.separator + "footer.ftl"));
            Tool.outputResource(option + "/resources/templates/control/macro.ftl", new File(control.getAbsolutePath() + File.separator + "macro.ftl"));
            Tool.outputResource(option + "/resources/templates/layout/default.ftl", new File(layout.getAbsolutePath() + File.separator + "default.ftl"));
            Tool.outputResource(option + "/resources/templates/layout/wap.ftl", new File(layout.getAbsolutePath() + File.separator + "wap.ftl"));
            Tool.outputResource(option + "/resources/templates/screen/index.ftl", new File(screen.getAbsolutePath() + File.separator + "index.ftl"));
            Tool.outputResource(option + "/resources/templates/403.ftl", new File(templates.getAbsolutePath() + File.separator + "403.ftl"));
            Tool.outputResource(option + "/resources/templates/404.ftl", new File(templates.getAbsolutePath() + File.separator + "404.ftl"));
            Tool.outputResource(option + "/resources/templates/500.ftl", new File(templates.getAbsolutePath() + File.separator + "500.ftl"));
        }
    }

    public void generateTest(File root, DB db, DataBase dataBase, String option) {

        File config = new File(root.getAbsolutePath() + File.separator + "config");
        config.mkdirs();
        File module = new File(root.getAbsolutePath() + File.separator + db.getModuleName());
        module.mkdirs();

        {

            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("author", db.getAuthor());
            ctx.put("date", new Date());
            freeMarkerManager.outputTemp(new File(config.getAbsolutePath() + File.separator + "TestConfig" + ".java"), option + "/test/TestConfig.ftl", ctx);
        }

        for (Table table : db.getTables()) {
            HashMap<String, Object> ctx = new HashMap<String, Object>();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("table", table);
            ctx.put("author", db.getAuthor());
            ctx.put("date", new Date());

            freeMarkerManager.outputTemp(new File(module.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Test" + ".java"), option + "/test/test.ftl", ctx);
        }
    }
}
