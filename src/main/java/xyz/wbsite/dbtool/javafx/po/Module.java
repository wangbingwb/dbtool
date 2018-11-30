package xyz.wbsite.dbtool.javafx.po;

import java.util.ArrayList;
import java.util.List;

public class Module extends Project{

    public Module() {
    }

    public Module(String moduleName) {
        this.moduleName = moduleName;
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
        this.modulePrefix = modulePrefix;
    }
}
