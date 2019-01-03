package xyz.wbsite.dbtool.javafx.po;

import javafx.scene.control.TreeItem;
import xyz.wbsite.dbtool.javafx.tool.Tool;

import java.util.ArrayList;
import java.util.List;

public class Table extends TreeItem {
    private Module dBhandle;

    public Table() {
    }

    public Table(String tableName) {
        this.tableName = tableName;
        setValue(tableName);
        setExpanded(true);
    }

    public Table(String tableName, String tableComment) {
        this.tableName = tableName;
        this.tableComment = tableComment;
    }

    /**
     * 对象名
     */
    private String tableName;

    /**
     * 对象注释
     */
    private String tableComment;

    private Boolean create = true;
    private Boolean delete = true;
    private Boolean update = true;
    private Boolean find = true;
    private Boolean get = true;
    private Boolean search = false;
    private Boolean getAll = false;

    /**
     * 对象字段
     */
    private List<Field> fields = new ArrayList();

    public boolean has(String type) {
        for (Field field : fields) {
            if (field.getFieldType().name().equals(type) && !field.getIsSystem()) {
                return true;
            }
        }
        return false;
    }

    public String getImport() {
        StringBuilder sb = new StringBuilder("");
        if (has("Date")) {
            sb.append("import java.util.Date;\n");
        }
        if (has("BigDecimal")) {
            sb.append("import java.math.BigDecimal;\n");
        }

        return sb.toString();
    }

    public boolean putField(Field field) {
        if (fields == null) {
            fields = new ArrayList<Field>();
        }
        fields.add(field);
        return true;
    }

    public boolean putFirstField(Field field) {
        if (fields == null) {
            fields = new ArrayList<Field>();
        }
        fields.add(0, field);
        return true;
    }

    public String getCName() {
        return Tool.lineToClassName(this.tableName);
    }

    public String getFName() {
        return Tool.lineToFieldName(this.tableName);
    }

    public String getLName() {
        return Tool.lineToLPoint(this.tableName);
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
        setValue(tableName);
    }

    public String getTableComment() {
        return tableComment;
    }

    public void setTableComment(String tableComment) {
        this.tableComment = tableComment!=null?tableComment:"";
    }

    public List<Field> getFields() {
        return fields;
    }

    public void setFields(List<Field> fields) {
        this.fields = fields;
    }

    public Module getdBhandle() {
        return dBhandle;
    }

    public void setdBhandle(Module dBhandle) {
        this.dBhandle = dBhandle;
    }

    public Boolean getCreate() {
        return create;
    }

    public void setCreate(Boolean create) {
        this.create = create;
    }

    public Boolean getDelete() {
        return delete;
    }

    public void setDelete(Boolean delete) {
        this.delete = delete;
    }

    public Boolean getUpdate() {
        return update;
    }

    public void setUpdate(Boolean update) {
        this.update = update;
    }

    public Boolean getFind() {
        return find;
    }

    public void setFind(Boolean find) {
        this.find = find;
    }

    public Boolean getGet() {
        return get;
    }

    public void setGet(Boolean get) {
        this.get = get;
    }

    public Boolean getSearch() {
        return search;
    }

    public void setSearch(Boolean search) {
        this.search = search;
    }

    public Boolean getGetAll() {
        return getAll;
    }

    public void setGetAll(Boolean getAll) {
        this.getAll = getAll;
    }
}
