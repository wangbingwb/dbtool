package xyz.wbsite.dbtool.javafx.manger.callable;

import xyz.wbsite.dbtool.javafx.enumeration.DataBase;
import xyz.wbsite.dbtool.javafx.manger.FreeMarkerManager;
import xyz.wbsite.dbtool.javafx.manger.ManagerFactory;
import xyz.wbsite.dbtool.javafx.manger.ProjectManager;
import xyz.wbsite.dbtool.javafx.manger.XmlManager;
import xyz.wbsite.dbtool.javafx.po.AbstractDBmapper;
import xyz.wbsite.dbtool.javafx.po.Module;
import xyz.wbsite.dbtool.javafx.po.Project;
import xyz.wbsite.dbtool.javafx.po.Table;
import xyz.wbsite.dbtool.javafx.tool.Tool;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.Callable;

import static xyz.wbsite.dbtool.javafx.tool.Tool.clear;

public class SpringBootCallable implements Callable {

    private String root;
    private DataBase dataBase;
    private Project project;
    private String option;

    private FreeMarkerManager freeMarkerManager;

    public SpringBootCallable(String root, DataBase dataBase, Project project, String option) {
        this.root = root;
        this.dataBase = dataBase;
        this.project = project;
        this.option = option;
        this.freeMarkerManager = ManagerFactory.getFreeMarkerManager();
    }

    private AbstractDBmapper dBmapper;

    public Boolean call() throws Exception {
        dBmapper = ProjectManager.dBmapper;

        // 创建项目文件夹
        File projectDir = new File(root + File.separator + project.getProjectName());
        if (!projectDir.exists()) {
            projectDir.mkdir();
        } else {
            clear(projectDir);
        }

        // 生成POM
        generatePom(projectDir, project, dataBase, option);

        // 生成Maven-java及域名目录
        String basePackage = project.getProjectBasePackage();
        String[] split = basePackage.split("\\.");
        StringBuffer stringBuffer = new StringBuffer(projectDir.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("java");
        for (String s : split) {
            stringBuffer.append(File.separator).append(s);
        }
        File src = new File(stringBuffer.toString());
        if (!src.exists()) {
            src.mkdirs();
        }

        // 生成资源目录
        stringBuffer = new StringBuffer(projectDir.getAbsolutePath() + File.separator + "src" + File.separator + "main");
        stringBuffer.append(File.separator).append("resources");
        File resources = new File(stringBuffer.toString());
        if (!resources.exists()) {
            resources.mkdirs();
        }

        // 生成单元测试java目录
        stringBuffer = new StringBuffer(projectDir.getAbsolutePath());
        stringBuffer.append(File.separator).append("src").append(File.separator).append("test").append(File.separator).append("java");
        for (String s : split) {
            stringBuffer.append(File.separator).append(s);
        }
        File testSrc = new File(stringBuffer.toString());
        if (!testSrc.exists()) {
            testSrc.mkdirs();
        }

        // 生成单元测试resources目录
        stringBuffer = new StringBuffer(projectDir.getAbsolutePath());
        stringBuffer.append(File.separator).append("src").append(File.separator).append("test").append(File.separator).append("resources");
        File testResources = new File(stringBuffer.toString());
        if (!testResources.exists()) {
            testResources.mkdirs();
        }

        {//生成java文件
            //生成Controller
            System.out.println("生成模块:action");
            generateController(new File(src.getAbsolutePath(), "action"), project, dataBase, option);

            //module
            {
                for (Module module : project.getModules()) {
                    module.setProjectAuthor(project.getProjectAuthor());
                    module.setProjectBasePackage(project.getProjectBasePackage());
                    module.setProjectName(project.getProjectName());

                    File modulePath = new File(src.getAbsolutePath(), module.getModuleName());
                    modulePath.mkdirs();

                    System.out.println("生成模块:Entity");
                    generateEntity(new File(modulePath.getAbsolutePath(), "ent"), module, dataBase, option);
                    System.out.println("生成模块:Enums");
                    generateEnums(new File(modulePath.getAbsolutePath(), "enums"), module, dataBase, option);
                    System.out.println("生成模块:Mapper");
                    generateMapper(new File(modulePath.getAbsolutePath(), "mpr"), module, dataBase, option);
                    System.out.println("生成模块:Manager");
                    generateManager(new File(modulePath.getAbsolutePath(), "mgr"), module, dataBase, option);
                    System.out.println("生成模块:Requset");
                    generateRequset(new File(modulePath.getAbsolutePath(), "req"), module, dataBase, option);
                    System.out.println("生成模块:Response");
                    generateResponse(new File(modulePath.getAbsolutePath(), "rsp"), module, dataBase, option);
                }
            }

            //framework
            System.out.println("生成模块:framework");
            generateFramework(new File(src.getAbsolutePath(), "framework"), project, dataBase, option);

            System.out.println("生成模块:Application");
            generateApplication(new File(src.getAbsolutePath()), project, dataBase, option);
        }

        {//生成resources文件
            System.out.println("生成模块:Resources");
            generateResources(resources, project, dataBase, option);
            for (Module module : project.getModules()) {
                generateResourcesSQL(resources, module, dataBase, option);
            }
            System.out.println("生成模块:Static");
            generateStatic(resources, project, dataBase, option);
            System.out.println("生成模块:Templates");
            generateTemplates(resources, project, dataBase, option);
        }

        {//生成test
            System.out.println("生成模块:Test");
            generateTest(testSrc, project, dataBase, option);
            generateTestResources(testResources, project, dataBase, option);
        }
        System.out.println("finish");
        return true;
    }


    /**
     * 生成POM.xml
     *
     * @param root
     * @param project
     */
    public void generatePom(File root, Project project, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("projectName", project.getProjectName());
        ctx.put("basePackage", project.getProjectBasePackage());
        ctx.put("dataBase", dataBase.toString());

        File file = new File(root.getAbsolutePath(), "pom.xml");

        freeMarkerManager.outputTemp(file, option + "/pom.ftl", ctx);
    }


    /**
     * 生成Controller类
     *
     * @param root
     * @param project
     */
    public void generateController(File root, Project project, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", project.getProjectBasePackage());
        ctx.put("author", project.getProjectAuthor());
        ctx.put("date", new Date());
        ctx.put("modules", project.getModules());

        File control = new File(root.getAbsolutePath(), "control");
        control.mkdirs();
        freeMarkerManager.outputTemp(new File(control.getAbsolutePath(), "Footer.java"), option + "/java/action/control/Footer.java", ctx);
        freeMarkerManager.outputTemp(new File(control.getAbsolutePath(), "Header.java"), option + "/java/action/control/Header.java", ctx);

        File screen = new File(root.getAbsolutePath(), "screen");
        screen.mkdirs();
        freeMarkerManager.outputTemp(new File(screen.getAbsolutePath(), "Index.java"), option + "/java/action/screen/Index.java", ctx);

        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "GlobalController.java"), option + "/java/action/GlobalController.ftl", ctx);

        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "AjaxController.java"), option + "/java/action/AjaxController.ftl", ctx);
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
            ctx.put("basePackage", md.getProjectBasePackage());
            ctx.put("moduleName", md.getModuleName());
            ctx.put("table", table);
            ctx.put("author", md.getProjectAuthor());
            ctx.put("date", new Date());

            File file = new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + ".java");

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
        ctx.put("basePackage", md.getProjectBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getProjectAuthor());
        ctx.put("date", new Date());

        File file = new File(root.getAbsolutePath(), "Type.java");

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
        ctx.put("basePackage", md.getProjectBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getProjectAuthor());
        ctx.put("date", new Date());

        for (Table table : md.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "Mapper" + ".java"), option + "/java/mpr/mapperJava.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "Mapper" + ".xml"), option + "/java/mpr/mapper.ftl", ctx);
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
        ctx.put("basePackage", md.getProjectBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getProjectAuthor());
        ctx.put("date", new Date());

        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "ApiManager" + ".java"), option + "/java/mgr/ApiManager.java", ctx);
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "ApiManagerImpl" + ".java"), option + "/java/mgr/ApiManagerImpl.java", ctx);

        for (Table table : md.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "Manager" + ".java"), option + "/java/mgr/manager.ftl", ctx);
            freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "ManagerImpl" + ".java"), option + "/java/mgr/managerImpl.ftl", ctx);
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
        ctx.put("basePackage", md.getProjectBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getProjectAuthor());
        ctx.put("date", new Date());
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "ApiExampleRequest" + ".java"), option + "/java/req/ApiExampleRequest.java", ctx);

        for (Table table : md.getTables()) {
            ctx.put("table", table);

            if (table.getCreate() != null && table.getCreate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "CreateRequest" + ".java"), option + "/java/req/createRequestClass.ftl", ctx);
            }

            if (table.getDelete() != null && table.getDelete()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "DeleteRequest" + ".java"), option + "/java/req/deleteRequestClass.ftl", ctx);
            }

            if (table.getUpdate() != null && table.getUpdate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "UpdateRequest" + ".java"), option + "/java/req/updateRequestClass.ftl", ctx);
            }

            if (table.getFind() != null && table.getFind()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "FindRequest" + ".java"), option + "/java/req/findRequestClass.ftl", ctx);
            }

            if (table.getGet() != null && table.getGet()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "GetRequest" + ".java"), option + "/java/req/getRequestClass.ftl", ctx);
            }

            if (table.getSearch() != null && table.getSearch()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "SearchRequest" + ".java"), option + "/java/req/searchRequestClass.ftl", ctx);
            }
            if (table.getGetAll() != null && table.getGetAll()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "GetAllRequest" + ".java"), option + "/java/req/getAllRequestClass.ftl", ctx);
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
        ctx.put("basePackage", md.getProjectBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("author", md.getProjectAuthor());
        ctx.put("date", new Date());
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "ApiExampleResponse" + ".java"), option + "/java/rsp/ApiExampleResponse.java", ctx);

        for (Table table : md.getTables()) {
            ctx.put("table", table);

            if (table.getCreate() != null && table.getCreate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "CreateResponse" + ".java"), option + "/java/rsp/createResponseClass.ftl", ctx);
            }

            if (table.getDelete() != null && table.getDelete()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "DeleteResponse" + ".java"), option + "/java/rsp/deleteResponseClass.ftl", ctx);
            }

            if (table.getUpdate() != null && table.getUpdate()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "UpdateResponse" + ".java"), option + "/java/rsp/updateResponseClass.ftl", ctx);
            }

            if (table.getFind() != null && table.getFind()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "FindResponse" + ".java"), option + "/java/rsp/findResponseClass.ftl", ctx);
            }

            if (table.getGet() != null && table.getGet()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "GetResponse" + ".java"), option + "/java/rsp/getResponseClass.ftl", ctx);
            }

            if (table.getSearch() != null && table.getSearch()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "SearchResponse" + ".java"), option + "/java/rsp/searchResponseClass.ftl", ctx);
            }
            if (table.getGetAll() != null && table.getGetAll()) {
                freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "GetAllResponse" + ".java"), option + "/java/rsp/getAllResponseClass.ftl", ctx);
            }
        }
    }

    /**
     * 生成framework类
     *
     * @param root
     * @param project
     */
    public void generateFramework(File root, Project project, DataBase dataBase, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            clear(root);
        }
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", project.getProjectBasePackage());
        ctx.put("moduleName", project.getProjectName());
        ctx.put("timestamp", new Date().getTime());

        File base = new File(root.getAbsolutePath(), "base");
        base.mkdirs();
        File config = new File(root.getAbsolutePath(), "config");
        config.mkdirs();
        File freemarker = new File(root.getAbsolutePath(), "freemarker");
        freemarker.mkdirs();
        File springmvc = new File(root.getAbsolutePath(), "springmvc");
        springmvc.mkdirs();
        File utils = new File(root.getAbsolutePath(), "utils");
        utils.mkdirs();

        //base
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseEntity.java"), option + "/java/framework/base/BaseEntity.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseFindRequest.java"), option + "/java/framework/base/BaseFindRequest.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseFindResponse.java"), option + "/java/framework/base/BaseFindResponse.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseGetAllRequest.java"), option + "/java/framework/base/BaseGetAllRequest.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseRequest.java"), option + "/java/framework/base/BaseRequest.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseResponse.java"), option + "/java/framework/base/BaseResponse.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseSearchRequest.java"), option + "/java/framework/base/BaseSearchRequest.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "BaseUpdateRequest.java"), option + "/java/framework/base/BaseUpdateRequest.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "Control.java"), option + "/java/framework/base/Control.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "Error.java"), option + "/java/framework/base/Error.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "ErrorType.java"), option + "/java/framework/base/ErrorType.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "FileUploadResponse.java"), option + "/java/framework/base/FileUploadResponse.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "Screen.java"), option + "/java/framework/base/Screen.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "SortType.java"), option + "/java/framework/base/SortType.java", ctx);
        freeMarkerManager.outputTemp(new File(base.getAbsolutePath(), "Token.java"), option + "/java/framework/base/Token.java", ctx);

        //config
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath(), "BeanDefinitionRegistryConfig.java"), option + "/java/framework/config/BeanDefinitionRegistryConfig.java", ctx);
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath(), "SecurityConfig.java"), option + "/java/framework/config/SecurityConfig.java", ctx);
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath(), "TaskConfig.java"), option + "/java/framework/config/TaskConfig.java", ctx);
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath(), "ThreadPoolConfig.java"), option + "/java/framework/config/ThreadPoolConfig.java", ctx);
        freeMarkerManager.outputTemp(new File(config.getAbsolutePath(), "WebMvcConfig.java"), option + "/java/framework/config/WebMvcConfig.java", ctx);

        //freemarker
        freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath(), "ViewNameTranslator.java"), option + "/java/framework/freemarker/ViewNameTranslator.java", ctx);
        freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath(), "Layout.java"), option + "/java/framework/freemarker/Layout.java", ctx);
        freeMarkerManager.outputTemp(new File(freemarker.getAbsolutePath(), "Uri.java"), option + "/java/framework/freemarker/Uri.java", ctx);

        //springmvc
        freeMarkerManager.outputTemp(new File(springmvc.getAbsolutePath(), "GlobalHandlerInterceptor.java"), option + "/java/framework/springmvc/GlobalHandlerInterceptor.java", ctx);

        //uitls
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "Base64Util.java"), option + "/java/framework/utils/Base64Util.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "AESUtil.java"), option + "/java/framework/utils/AESUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "CookieUtil.java"), option + "/java/framework/utils/CookieUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "LogUtil.java"), option + "/java/framework/utils/LogUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "MapperUtil.java"), option + "/java/framework/utils/MapperUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "MD5Util.java"), option + "/java/framework/utils/MD5Util.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "ProcessUtil.java"), option + "/java/framework/utils/ProcessUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "RSAUtil.java"), option + "/java/framework/utils/RSAUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "ValidationUtil.java"), option + "/java/framework/utils/ValidationUtil.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "WebUtils.java"), option + "/java/framework/utils/WebUtils.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "LocalData.java"), option + "/java/framework/utils/LocalData.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "IDgenerator.java"), option + "/java/framework/utils/IDgenerator.java", ctx);
        freeMarkerManager.outputTemp(new File(utils.getAbsolutePath(), "Message.java"), option + "/java/framework/utils/Message.java", ctx);
    }

    /**
     * 生成base类
     *
     * @param root
     * @param project
     */
    public void generateApplication(File root, Project project, DataBase dataBase, String option) {

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", project.getProjectBasePackage());
        ctx.put("moduleName", project.getProjectName());
        ctx.put("timestamp", new Date().getTime());

        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "Application.java"), option + "/java/Application.ftl", ctx);
    }

    /**
     * 生成properties
     *
     * @param root
     * @param project
     */
    public void generateResources(File root, Project project, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("basePackage", project.getProjectBasePackage());
        ctx.put("tool", Tool.class);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("author", project.getProjectAuthor());
        ctx.put("dBmapper", dBmapper);
        ctx.put("date", new Date());
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "application-dev.properties"), option + "/resources/application-dev.ftl", ctx);
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "application-prod.properties"), option + "/resources/application-prod.ftl", ctx);
        Tool.outputResource(option + "/resources/banner.txt", new File(root.getAbsolutePath(), "banner.txt"));
        Tool.outputResource(option + "/resources/logback-config.xml", new File(root.getAbsolutePath(), "logback-config.xml"));

        File lib = new File(root.getAbsolutePath(), "lib");
        lib.mkdirs();
        Tool.outputResource(option + "/resources/lib/ojdbc7.jar", new File(lib.getAbsolutePath(), "ojdbc7.jar"));

        File dbtool = new File(root.getAbsolutePath(), "dbtool");
        dbtool.mkdirs();
        {
            XmlManager xmlManager = ManagerFactory.getXmlManager();
            xmlManager.saveAs(dbtool.getAbsolutePath(), project);
        }
    }

    /**
     * 生成properties
     *
     * @param root
     * @param md
     */
    public void generateResourcesSQL(File root, Module md, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("basePackage", md.getProjectBasePackage());
        ctx.put("moduleName", md.getModuleName());
        ctx.put("tool", Tool.class);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("db", md);
        ctx.put("author", md.getProjectAuthor());
        ctx.put("dBmapper", dBmapper);
        ctx.put("date", new Date());

        File tableDir = new File(root.getAbsolutePath(), md.getModuleName() + "_table");
        tableDir.mkdirs();

        for (Table table : md.getTables()) {
            ctx.put("table", table);
            freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath(), table.getTableName() + ".sql"), option + "/resources/table.ftl", ctx);
        }
        freeMarkerManager.outputTemp(new File(tableDir.getAbsolutePath(), "ALL_TABLE.sql"), option + "/resources/tableAll.ftl", ctx);
    }

    public void generateTestResources(File root, Project project, DataBase dataBase, String option) {
        HashMap<String, Object> ctx = new HashMap<String, Object>();

        ctx.put("basePackage", project.getProjectBasePackage());
        ctx.put("moduleName", project.getProjectName());
        ctx.put("tool", Tool.class);
        ctx.put("dataBase", dataBase.toString());
        ctx.put("author", project.getProjectAuthor());
        ctx.put("dBmapper", dBmapper);
        ctx.put("date", new Date());
        freeMarkerManager.outputTemp(new File(root.getAbsolutePath(), "application.properties"), option + "/test/application.properties", ctx);
        Tool.outputResource(option + "/test/logback-config.xml", new File(root.getAbsolutePath(), "logback-config.xml"));
    }

    /**
     * 生成static
     *
     * @param root
     * @param project
     */
    public void generateStatic(File root, Project project, DataBase dataBase, String option) {

        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("basePackage", project.getProjectBasePackage());
        ctx.put("tool", Tool.class);
        ctx.put("author", project.getProjectAuthor());
        ctx.put("date", new Date());
        ctx.put("modules", project.getModules());

        File static_ = new File(root.getAbsolutePath(), "static");
        boolean mkdirs = static_.mkdirs();
        File css = new File(static_.getAbsolutePath(), "css");
        boolean mkdirs1 = css.mkdirs();
        File js = new File(static_.getAbsolutePath(), "js");
        boolean mkdirs2 = js.mkdirs();
        File img = new File(static_.getAbsolutePath(), "img");
        boolean mkdirs3 = img.mkdirs();

        File dist = new File(static_.getAbsolutePath(), "dist");
        boolean mkdirs4 = dist.mkdirs();

        {//css文件
            freeMarkerManager.outputTemp(new File(css.getAbsolutePath(), "base.css"), option + "/resources/static/css/base.css", ctx);
        }

        {//js文件
            freeMarkerManager.outputTemp(new File(js.getAbsolutePath(), "ajax.js"), option + "/resources/static/js/ajax.ftl", ctx);
        }
        {//img
            Tool.outputResource(option + "/resources/static/img/favicon.ico", new File(img.getAbsolutePath(), "favicon.ico"));
            Tool.outputResource(option + "/resources/static/img/logo.png", new File(img.getAbsolutePath(), "logo.png"));
        }

        {//dist文件

            Tool.outputResource(option + "/resources/static/dist/lib.min.css", new File(dist.getAbsolutePath(), "lib.min.css"));
            Tool.outputResource(option + "/resources/static/dist/lib.min.js", new File(dist.getAbsolutePath(), "lib.min.js"));


            File fonts = new File(dist.getAbsolutePath(), "fonts");
            fonts.mkdirs();

            Tool.outputResource(option + "/resources/static/dist/fonts/element-icons.woff", new File(fonts.getAbsolutePath(), "element-icons.woff"));
            Tool.outputResource(option + "/resources/static/dist/fonts/w-e-icon.woff", new File(fonts.getAbsolutePath(), "w-e-icon.woff"));

        }
    }

    /**
     * 生成static
     *
     * @param root
     * @param project
     */
    public void generateTemplates(File root, Project project, DataBase dataBase, String option) {
        {//生成
            File templates = new File(root.getAbsolutePath(), "templates");
            templates.mkdirs();

            File control = new File(templates.getAbsolutePath(), "control");
            control.mkdirs();
            File layout = new File(templates.getAbsolutePath(), "layout");
            layout.mkdirs();
            File screen = new File(templates.getAbsolutePath(), "screen");
            screen.mkdirs();
            Tool.outputResource(option + "/resources/templates/control/nav.ftl", new File(control.getAbsolutePath(), "nav.ftl"));
            Tool.outputResource(option + "/resources/templates/control/header.ftl", new File(control.getAbsolutePath(), "header.ftl"));
            Tool.outputResource(option + "/resources/templates/control/footer.ftl", new File(control.getAbsolutePath(), "footer.ftl"));
            Tool.outputResource(option + "/resources/templates/control/macro.ftl", new File(control.getAbsolutePath(), "macro.ftl"));
            Tool.outputResource(option + "/resources/templates/layout/default.ftl", new File(layout.getAbsolutePath(), "default.ftl"));
            Tool.outputResource(option + "/resources/templates/layout/wap.ftl", new File(layout.getAbsolutePath(), "wap.ftl"));
            Tool.outputResource(option + "/resources/templates/screen/demo.ftl", new File(screen.getAbsolutePath(), "demo.ftl"));
            Tool.outputResource(option + "/resources/templates/screen/index.ftl", new File(screen.getAbsolutePath(), "index.ftl"));
            Tool.outputResource(option + "/resources/templates/403.ftl", new File(templates.getAbsolutePath(), "403.ftl"));
            Tool.outputResource(option + "/resources/templates/404.ftl", new File(templates.getAbsolutePath(), "404.ftl"));
            Tool.outputResource(option + "/resources/templates/500.ftl", new File(templates.getAbsolutePath(), "500.ftl"));
        }
    }

    public void generateTest(File root, Project project, DataBase dataBase, String option) {

        File config = new File(root.getAbsolutePath(), "config");
        config.mkdirs();

        {
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", Tool.class);
            ctx.put("basePackage", project.getProjectBasePackage());
            ctx.put("moduleName", project.getProjectName());
            ctx.put("author", project.getProjectAuthor());
            ctx.put("date", new Date());
            freeMarkerManager.outputTemp(new File(config.getAbsolutePath(), "TestConfig" + ".java"), option + "/test/TestConfig.ftl", ctx);
        }

        for (Module md : project.getModules()) {
            File module = new File(root.getAbsolutePath(), md.getModuleName());
            module.mkdirs();

            for (Table table : md.getTables()) {
                HashMap<String, Object> ctx = new HashMap<String, Object>();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", md.getProjectBasePackage());
                ctx.put("moduleName", md.getModuleName());
                ctx.put("table", table);
                ctx.put("author", md.getProjectAuthor());
                ctx.put("date", new Date());

                freeMarkerManager.outputTemp(new File(module.getAbsolutePath(), Tool.lineToClassName(table.getTableName()) + "Test" + ".java"), option + "/test/test.ftl", ctx);
            }
        }

    }
}
