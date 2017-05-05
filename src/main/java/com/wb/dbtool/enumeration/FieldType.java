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
    Binary(2000),
    BigDecimal(0);

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
        if (str == null) {
            return null;
        }
        FieldType fieldType = null;
        try {
            fieldType = FieldType.valueOf(str);
        } catch (IllegalArgumentException e) {
            tryGetsimilar(str,0);
        }
        if (fieldType == null) {
            return FieldType.String;
        }
        return fieldType;
    }
    public static FieldType parse(String str,int length) {
        if (str == null) {
            return null;
        }
        FieldType fieldType = null;
        try {
            fieldType = FieldType.valueOf(str);
        } catch (IllegalArgumentException e) {
            fieldType = tryGetsimilar(str,length);
        }
        if (fieldType == null) {
            return FieldType.String;
        }
        return fieldType;
    }

    public static FieldType tryGetsimilar(String str,int length) {
        if (str.contains("CHAR")){
            return FieldType.String;
        }else if (str.contains("NUMBER")){

        }else if (str.contains("DATE")){
            return FieldType.Date;
        }else if (str.contains("BLOB")){
            return FieldType.Binary;
        }
        return null;
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
