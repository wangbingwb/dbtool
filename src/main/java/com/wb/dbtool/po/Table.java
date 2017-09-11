package com.wb.dbtool.po;

import com.wb.dbtool.tool.Tool;

import java.util.ArrayList;
import java.util.List;

public class Table extends DB {

    private DB dBhandle;

    public Table() {
    }

    public Table(String tableName) {
        this.tableName = tableName;
    }

    public Table(String tableName, String tableComment) {
        this.tableName = tableName;
        this.tableComment = tableComment;
    }

    /**
     * 表名
     */
    private String tableName;

    /**
     * 表注释
     */
    private String tableComment;

    /**
     * 表字段
     */
    private List<Field> fields = new ArrayList();

    public boolean has(String type) {
        for (Field field : fields) {
            if (field.getFieldType().name().equals(type)) {
                return true;
            }
        }
        return false;
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
    }

    public String getTableComment() {
        return tableComment;
    }

    public void setTableComment(String tableComment) {
        this.tableComment = tableComment;
    }

    public List<Field> getFields() {
        return fields;
    }

    public void setFields(List<Field> fields) {
        this.fields = fields;
    }

    public DB getdBhandle() {
        return dBhandle;
    }

    public void setdBhandle(DB dBhandle) {
        this.dBhandle = dBhandle;
    }
}
