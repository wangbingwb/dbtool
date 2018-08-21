package com.wb.dbtool.javafx.po;

import com.wb.dbtool.javafx.enumeration.FieldType;
import com.wb.dbtool.javafx.tool.Tool;
import freemarker.template.utility.StringUtil;
import org.springframework.util.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
    private FieldType fieldType = FieldType.String_var50;
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


    private Boolean isSearch = false;

    private Boolean isSystem = false;

    public String getTestValue() {
        String value = "";
        if (fieldType.name().matches("String_\\d+")) {
            Pattern compile = Pattern.compile("String_(\\d+)");
            Matcher matcher = compile.matcher(fieldType.name());

            if (matcher.find()) {
                int len = Integer.parseInt(matcher.group(1));

                if (StringUtils.isEmpty(this.fieldComment)) {
                    StringBuilder sb = new StringBuilder("");
                    for (int i = 0; i < len; i++) {
                        sb.append("A");
                    }
                    value = sb.toString();
                } else {
                    value = "\"" + this.fieldComment.substring(0, this.fieldComment.length() > this.fieldLenght ? this.fieldLenght : this.fieldComment.length()) + "\"";
                }

            }
        } else if (fieldType.name().matches("String_var\\d+")) {
            Pattern compile = Pattern.compile("String_var(\\d+)");
            Matcher matcher = compile.matcher(fieldType.name());

            if (matcher.find()) {
                int len = Integer.parseInt(matcher.group(1));

                if (StringUtils.isEmpty(this.fieldComment)) {
                    StringBuilder sb = new StringBuilder("");
                    sb.append("\"");
                    sb.append("A");
                    sb.append("\"");
                    value = sb.toString();
                } else {
                    value = "\"" + this.fieldComment.substring(0, this.fieldComment.length() > this.fieldLenght ? this.fieldLenght : this.fieldComment.length()) + "\"";
                }

            }
        } else if (fieldType.name().equals("String_var")) {
            int len = fieldLenght;
            if (StringUtils.isEmpty(this.fieldComment)) {
                StringBuilder sb = new StringBuilder("");
                sb.append("\"");
                sb.append("A");
                sb.append("\"");
                value = sb.toString();
            } else {
                value = "\"" + this.fieldComment.substring(0, this.fieldComment.length() > this.fieldLenght ? this.fieldLenght : this.fieldComment.length()) + "\"";
            }

        } else if (fieldType.name().matches("Boolean")) {
            value = "true";
        } else if (fieldType.name().matches("Byte|Bytes|Short|Integer")) {
            value = "1";
        } else if (fieldType.name().matches("Long")) {
            value = "1L";
        } else if (fieldType.name().matches("Float")) {
            value = "1.0f";
        } else if (fieldType.name().matches("Double")) {
            value = "1.0";
        } else if (fieldType.name().matches("Character")) {
            value = "'A'";
        } else if (fieldType.name().matches("Date")) {
            value = "new Date()";
        } else if (fieldType.name().matches("Date")) {
            value = "new Date()";
        } else if (fieldType.name().matches("BigDecimal")) {
            value = "new BigDecimal()";
        } else if (fieldType.name().matches("String_super")) {
            value = "\"content\"";
        }
        return value;
    }

    public Boolean getIsSearch() {
        return isSearch;
    }

    public void setIsSearch(Boolean isSearch) {
        this.isSearch = isSearch;
    }

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
