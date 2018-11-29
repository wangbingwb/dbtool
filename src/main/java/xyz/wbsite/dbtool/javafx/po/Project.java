package xyz.wbsite.dbtool.javafx.po;

import java.util.ArrayList;
import java.util.List;

public class Project {

    public Project() {
    }

    public Project(String projectName) {
        this.projectName = projectName;
    }

    private String projectName;
    private String projectBasePackage;
    private String projectAuthor;

    /**
     * 对象
     */
    private List<Module> modules = new ArrayList();


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
