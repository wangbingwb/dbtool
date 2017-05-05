package com.wb.dbtool.po;

import com.wb.dbtool.enumeration.FieldType;
import com.wb.dbtool.tool.Tool;

public class Field extends Table {

    public Field() {
    }

    public Field(String fieldName) {
        this.fieldName = fieldName;
    }

    /**
     * 字段名
     */
    private String fieldName;

    /**
     * 字段类型
     */
    private FieldType fieldType = FieldType.String;
    /**
     * 字段长度
     */
    private int fieldLenght = 0;

    /**
     * 字段注释
     */
    private String fieldComment = null;

    /**
     * 默认值
     */
    private String defaultValue = null;

    /**
     * 是否可为NULL
     */
    private Boolean isMust = false;

    /**
     * 是否是主键
     */
    private Boolean isPrimaryKey = false;
    /**
     * 是否作为查询条件
     */
    private Boolean isQuery = false;

    private Boolean isSystem = false;

    public Boolean getIsSystem() {
        return isSystem;
    }

    public void setIsSystem(Boolean isSystem) {
        this.isSystem = isSystem;
    }

    public String getterName() {
        return "get" + Tool.lineToClassName(this.fieldName);
    }

    public String setterName() {
        return "set" + Tool.lineToClassName(this.fieldName);
    }

    public Boolean getIsQuery() {
        return isQuery;
    }

    public void setIsQuery(Boolean isQuery) {
        this.isQuery = isQuery;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public FieldType getFieldType() {
        return fieldType;
    }

    public void setFieldType(FieldType fieldType) {
        this.fieldType = fieldType;
    }

    public Integer getFieldLenght() {
        return fieldLenght;
    }

    public void setFieldLenght(Integer fieldLenght) {
        this.fieldLenght = fieldLenght;
    }

    public String getFieldComment() {
        return fieldComment;
    }

    public void setFieldComment(String fieldComment) {
        this.fieldComment = fieldComment;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public Boolean getIsMust() {
        return isMust;
    }

    public void setIsMust(Boolean isMust) {
        this.isMust = isMust;
    }

    public Boolean getIsPrimaryKey() {
        return isPrimaryKey;
    }

    public void setIsPrimaryKey(Boolean isPrimaryKey) {
        this.isPrimaryKey = isPrimaryKey;
    }

    public String getFName() {
        return Tool.lineToFieldName(this.fieldName);
    }
}
