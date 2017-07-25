package com.wb.dbtool.service;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.manger.DBmanger;
import com.wb.dbtool.po.AbstractDBmapper;
import com.wb.dbtool.po.DB;
import com.wb.dbtool.po.Table;
import com.wb.dbtool.tool.Tool;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Callable;

/**
 * Created by 20201028 on 2017/6/23.
 */
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
            clear(module);
        }

        dBmapper = DBmanger.dBmapper;

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
        generateManager(new File(src.getAbsolutePath() + File.separator + "mgr"), db, option);
        generateRequset(new File(src.getAbsolutePath() + File.separator + "request"), db, option);
        generateResponse(new File(src.getAbsolutePath() + File.separator + "response"), db, option);
        generateBase(new File(src.getParentFile().getAbsolutePath() + File.separator + "framework"), db, option);
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
                Template t = velocityEngine.getTemplate("/templates/" + option + "/dao/mapperJava.vm", "UTF-8");
                VelocityContext ctx = new VelocityContext();

                ctx.put("tool", Tool.class);
                ctx.put("basePackage", db.getBasePackage());
                ctx.put("moduleName", db.getModuleName());
                ctx.put("table", table);
                ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

                File po = new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Mapper" + ".java");
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
                Template t = velocityEngine.getTemplate("/templates/" + option + "/mgr/manager.vm", "UTF-8");
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
                Template t = velocityEngine.getTemplate("/templates/" + option + "/mgr/managerImpl.vm", "UTF-8");
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
     * 生成Requset
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

            outputVM(new File(root.getAbsolutePath() + File.separator + "Error.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/Error.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Error.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/Error.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "ErrorType.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/ErrorType.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Response.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/Response.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "FindResponse.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/FindResponse.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Request.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/Request.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "UpdateRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/UpdateRequest.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "FindRequest.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/FindRequest.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Token.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/Token.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LocalData.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/LocalData.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "IDgenerator.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/IDgenerator.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "LogUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/LogUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "Message.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/Message.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "MapUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/MapUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "MD5Util.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/MD5Util.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "RSAUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/RSAUtil.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "WebUtils.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/WebUtils.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "DataFormatUtil.java"), velocityEngine.getTemplate("/templates/" + option + "/framework/DataFormatUtil.vm", "UTF-8"), ctx);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
     * 生成SpringMybatis
     *
     * @param root
     * @param db
     */
    public void generateSpringMybatis(File root, DB db, String option) {
        try {
            Template t = velocityEngine.getTemplate("/templates/" + option + "/spring-mybatis.vm", "UTF-8");
            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());

            outputVM(new File(root.getAbsolutePath() + File.separator + "spring-mybatis.xml"), velocityEngine.getTemplate("/templates/" + option + "/spring-mybatis.vm", "UTF-8"), ctx);
            outputVM(new File(root.getAbsolutePath() + File.separator + "logback.xml"), velocityEngine.getTemplate("/templates/" + option + "/logback.vm", "UTF-8"), ctx);
        } catch (Exception e) {

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
//                outputVM(new File(WEB_INF_DIR.getAbsolutePath() + File.separator + "logback.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/logback.vm", "UTF-8"), ctx);
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
}
