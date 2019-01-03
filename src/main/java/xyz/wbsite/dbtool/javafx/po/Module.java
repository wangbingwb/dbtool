package xyz.wbsite.dbtool.javafx.po;

import javafx.scene.control.TreeItem;

import java.util.ArrayList;
import java.util.List;

public class Module extends TreeItem {
    public Module() {
    }

    public Module(String moduleName) {
        this.moduleName = moduleName;
        setValue(moduleName);
        setExpanded(true);
    }

    /**
     * 模块注释
     */
    private String moduleComment;

    /**
     * 模块前缀
     */
    private String modulePrefix;

    /**
     * 对象
     */
    private List<Table> tables = new ArrayList();

    private String moduleName;
    private boolean hasSysFields;
    private String projectName;
    private String projectBasePackage;
    private String projectAuthor;

    public boolean isHasSysFields() {
        return hasSysFields;
    }

    public void setHasSysFields(boolean hasSysFields) {
        this.hasSysFields = hasSysFields;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
        this.setValue(moduleName);
    }

    public boolean putTable(Table table) {
        if (tables == null) {
            tables = new ArrayList<Table>();
        }
        tables.add(table);
        return true;
    }

    public List<Table> getTables() {
        return tables;
    }

    public void setTables(List<Table> tables) {
        this.tables = tables;
    }

    public String getModuleComment() {
        return moduleComment;
    }

    public void setModuleComment(String moduleComment) {
        this.moduleComment = moduleComment;
    }

    public String getModulePrefix() {
        return modulePrefix;
    }

    public void setModulePrefix(String modulePrefix) {
        this.modulePrefix = modulePrefix!=null?modulePrefix:"";
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectBasePackage() {
        return projectBasePackage;
    }

    public void setProjectBasePackage(String projectBasePackage) {
        this.projectBasePackage = projectBasePackage;
    }

    public String getProjectAuthor() {
        return projectAuthor;
    }

    public void setProjectAuthor(String projectAuthor) {
        this.projectAuthor = projectAuthor;
    }
}
