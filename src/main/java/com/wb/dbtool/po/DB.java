package com.wb.dbtool.po;

import java.util.ArrayList;
import java.util.List;

public class DB {

    public DB() {
    }

    public DB(String dbName) {
        this.dbName = dbName;
    }

    /**
     * 数据库用户名
     */
    private String dbUserName;

    /**
     * 数据库名
     */
    private String dbName;

    /**
     * 数据库注释
     */
    private String dbComment;

    /**
     * 数据库注释
     */
    private String dbprefix;

    /**
     * 表对象
     */
    private List<Table> tables = new ArrayList();

    private String basePackage;
    private String moduleName;

    public String getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public boolean putTable(Table table) {
        if (tables == null) {
            tables = new ArrayList<Table>();
        }
        tables.add(table);
        return true;
    }

    public String getDbprefix() {
        return dbprefix;
    }

    public void setDbprefix(String dbprefix) {
        this.dbprefix = dbprefix;
    }

    public List<Table> getTables() {
        return tables;
    }

    public void setTables(List<Table> tables) {
        this.tables = tables;
    }

    public String getDbUserName() {
        return dbUserName;
    }

    public void setDbUserName(String dbUserName) {
        this.dbUserName = dbUserName;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public String getDbComment() {
        return dbComment;
    }

    public void setDbComment(String dbComment) {
        this.dbComment = dbComment;
    }
}
