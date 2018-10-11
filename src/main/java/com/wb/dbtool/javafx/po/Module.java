package com.wb.dbtool.javafx.po;

import java.util.ArrayList;
import java.util.List;

public class Module {

    public Module() {
    }

    public Module(String dbName) {
        this.dbName = dbName;
    }


    private String dbUserName;

    /**
     * 模块名
     */
    private String dbName;

    /**
     * 模块注释
     */
    private String dbComment;

    /**
     * 模块前缀
     */
    private String dbprefix;

    /**
     * 作者
     */
    private String author;

    /**
     * 对象
     */
    private List<Table> tables = new ArrayList();

    private String basePackage;
    private String moduleName;
    private boolean hasSysFields;
    private boolean isExpanded = true;

    public boolean isExpanded() {
        return isExpanded;
    }

    public void setIsExpanded(boolean isExpanded) {
        this.isExpanded = isExpanded;
    }

    public boolean isHasSysFields() {
        return hasSysFields;
    }

    public void setHasSysFields(boolean hasSysFields) {
        this.hasSysFields = hasSysFields;
    }

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
