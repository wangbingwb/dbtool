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

        dBmapper = DBmanger.dBmapper;

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
        generateService(new File(src.getAbsolutePath() + File.separator + "svc"), db, option);
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

    public void generateService(File root, DB db, String option) {
        if (!root.exists()) {
            root.mkdirs();
        } else {
            File[] files = root.listFiles();
            for (File file : files) {
                file.delete();
            }
        }
        try {
            VelocityContext ctx = new VelocityContext();

            ctx.put("tool", Tool.class);
            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            ctx.put("yyyy-MM-dd", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

            for (Table table : db.getTables()) {
                ctx.put("table", table);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "Service" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/service/service.vm", "UTF-8"), ctx);
                outputVM(new File(root.getAbsolutePath() + File.separator + Tool.lineToClassName(table.getTableName()) + "ServiceImpl" + ".java"), velocityEngine.getTemplate("/templates/" + option + "/service/serviceImpl.vm", "UTF-8"), ctx);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
     * 生成POM.xml
     *
     * @param root
     * @param db
     */
    public void generateWebapp(File root, DB db, String option) {
        try {
            File file = new File(root.getAbsolutePath() + File.separator + "WEB-INF");
            file.mkdirs();

            VelocityContext ctx = new VelocityContext();

            ctx.put("basePackage", db.getBasePackage());
            ctx.put("moduleName", db.getModuleName());
            outputVM(new File(file.getAbsolutePath() + File.separator + "web.xml"), velocityEngine.getTemplate("/templates/" + option + "/webapp/WEB-INF/web.vm", "UTF-8"), ctx);
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
