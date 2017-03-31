package com.wb.dbtool.enumeration;

public enum FieldType {
    Boolean(1),
    Byte(1),
    Short(2),
    Integer(4),
    Long(8),
    Float(4),
    Double(8),
    Character(2),
    String(255),
    Date(0),
    Time(0),
    Binary(2000);

    private int defaultLength;

    public int getDefaultLength() {
        return defaultLength;
    }

    public void setDefaultLength(int defaultLength) {
        this.defaultLength = defaultLength;
    }

    FieldType(int defaultLength) {
        this.defaultLength = defaultLength;
    }

    public static FieldType parse(String str) {
        FieldType fieldType = FieldType.valueOf(str);
        if (fieldType != null) {
            return fieldType;
        }
        return FieldType.String;
    }

    @Override
    public String toString() {
        if (Boolean.name().equals(this.name())) {
            return "boolean";
        } else if (Byte.name().equals(this.name())) {
            return "byte";
        } else if (Short.name().equals(this.name())) {
            return "short";
        } else if (Integer.name().equals(this.name())) {
            return "int";
        } else if (Long.name().equals(this.name())) {
            return "long";
        } else if (Float.name().equals(this.name())) {
            return "float";
        } else if (Double.name().equals(this.name())) {
            return "double";
        } else if (Character.name().equals(this.name())) {
            return "char";
        } else if (String.name().equals(this.name())) {
            return "String";
        } else if (Date.name().equals(this.name())) {
            return "Date";
        } else if (Time.name().equals(this.name())) {
            return "Date";
        } else if (Binary.name().equals(this.name())) {
            return "byte[]";
        } else {
            return "";
        }
    }

    public String jdbcType() {
        if (Boolean.name().equals(this.name())) {
            return "BIT";
        } else if (Byte.name().equals(this.name())) {
            return "TINYINT";
        } else if (Short.name().equals(this.name())) {
            return "SMALLINT";
        } else if (Integer.name().equals(this.name())) {
            return "INTEGER";
        } else if (Long.name().equals(this.name())) {
            return "NUMERIC";
        } else if (Float.name().equals(this.name())) {
            return "REAL";
        } else if (Double.name().equals(this.name())) {
            return "FLOAT";
        } else if (Character.name().equals(this.name())) {
            return "VARCHAR";
        } else if (String.name().equals(this.name())) {
            return "VARCHAR";
        } else if (Date.name().equals(this.name())) {
            return "DATE";
        } else if (Time.name().equals(this.name())) {
            return "DATE";
        } else if (Binary.name().equals(this.name())) {
            return "BINARY";
        } else {
            return "";
        }
    }
}
