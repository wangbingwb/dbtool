package com.wb.dbtool.manger.callable;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.po.*;
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

public class TxCallable implements Callable {

    private String root;
    private DataBase dataBase;
    private DB db;
    private String option;

    private VelocityEngine velocityEngine;

    public TxCallable(String root, DataBase dataBase, DB db, String option) {
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

        if (DataBase.ORACLE.name().equals(dataBase.name())) {
            dBmapper = new OracleDBmapper(dataBase);
        } else if (DataBase.MYSQL.name().equals(dataBase.name())) {
            dBmapper = new MySqlDBmapper(dataBase);
        }

        generatePo(new File(module.getAbsolutePath() + File.separator + "po"), db, option);
        generateMapper(new File(module.getAbsolutePath() + File.separator + "mapper"), db, dataBase, option);
        generateSpringMybatis(new File(module.getAbsolutePath()), db, option);
        generatProperties(new File(module.getAbsolutePath()), db, option);
        generateTable(new File(module.getAbsolutePath()), db, option);

        return true;
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
                ctx.put("author", db.getAuthor());
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
                ctx.put("author", db.getAuthor());

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

}
