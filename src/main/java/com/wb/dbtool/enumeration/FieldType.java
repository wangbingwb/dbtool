package com.wb.dbtool.enumeration;

public enum FieldType {
    Boolean(0),
    Byte(0),
    Bytes(0),
    Short(0),
    Integer(0),
    Long(0),
    Float(0),
    Double(0),
    Character(0),
    String_10(10),
    String_20(20),
    String_var50(50),
    String_var100(100),
    String_var255(255),
    String_var500(500),
    String_var2500(2500),
    String_var4000(4000),
    String_super(0),
    Date(0),
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
            tryGetsimilar(str, 0);
        }
        if (fieldType == null) {
            return FieldType.String_var50;
        }
        return fieldType;
    }

    public static FieldType parse(String str, int length) {
        if (str == null) {
            return null;
        }
        FieldType fieldType = null;
        try {
            fieldType = FieldType.valueOf(str);
        } catch (IllegalArgumentException e) {
            fieldType = tryGetsimilar(str, length);
        }
        if (fieldType == null) {
            return FieldType.String_var50;
        }
        return fieldType;
    }

    public static FieldType tryGetsimilar(String str, int length) {
        if (str.contains("CHAR")) {
            return FieldType.String_var50;
        } else if (str.contains("NUMBER")) {

        } else if (str.contains("DATE")) {
            return FieldType.Date;
        } else if (str.contains("BLOB")) {
            return FieldType.Bytes;
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
        } else if (Date.name().equals(this.name())) {
            return "Date";
        }  else if (Bytes.name().equals(this.name())) {
            return "byte[]";
        } else if (BigDecimal.name().equals(this.name())) {
            return "BigDecimal";
        } else if (String_10.name().equals(this.name())) {
            return "String_10";
        } else if (String_20.name().equals(this.name())) {
            return "String_20";
        } else if (String_var50.name().equals(this.name())) {
            return "String_var50";
        } else if (String_var100.name().equals(this.name())) {
            return "String_var100";
        } else if (String_var255.name().equals(this.name())) {
            return "String_var255";
        } else if (String_var500.name().equals(this.name())) {
            return "String_var500";
        } else if (String_var2500.name().equals(this.name())) {
            return "String_var2500";
        } else if (String_var4000.name().equals(this.name())) {
            return "String_var4000";
        } else if (String_super.name().equals(this.name())) {
            return "String_super";
        } else {
            return "";
        }
    }

    public String javaType() {
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
        } else if (Date.name().equals(this.name())) {
            return "Date";
        } else if (Bytes.name().equals(this.name())) {
            return "byte[]";
        } else if (BigDecimal.name().equals(this.name())) {
            return "BigDecimal";
        } else if (String_10.name().equals(this.name())) {
            return "String";
        } else if (String_20.name().equals(this.name())) {
            return "String";
        } else if (String_var50.name().equals(this.name())) {
            return "String";
        } else if (String_var100.name().equals(this.name())) {
            return "String";
        } else if (String_var255.name().equals(this.name())) {
            return "String";
        } else if (String_var500.name().equals(this.name())) {
            return "String";
        } else if (String_var2500.name().equals(this.name())) {
            return "String";
        } else if (String_var4000.name().equals(this.name())) {
            return "String";
        } else if (String_super.name().equals(this.name())) {
            return "String";
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
            return "BIGINT";
        } else if (Float.name().equals(this.name())) {
            return "FLOAT";
        } else if (Double.name().equals(this.name())) {
            return "DOUBLE";
        } else if (Character.name().equals(this.name())) {
            return "CHAR";
        } else if (Date.name().equals(this.name())) {
            return "TIMESTAMP";
        } else if (Bytes.name().equals(this.name())) {
            return "BINARY";
        } else if (BigDecimal.name().equals(this.name())) {
            return "DECIMAL";
        } else if (String_10.name().equals(this.name())) {
            return "CHAR";
        } else if (String_20.name().equals(this.name())) {
            return "CHAR";
        } else if (String_var50.name().equals(this.name())) {
            return "VARCHAR";
        } else if (String_var100.name().equals(this.name())) {
            return "VARCHAR";
        } else if (String_var255.name().equals(this.name())) {
            return "VARCHAR";
        } else if (String_var500.name().equals(this.name())) {
            return "VARCHAR";
        } else if (String_var2500.name().equals(this.name())) {
            return "VARCHAR";
        } else if (String_var4000.name().equals(this.name())) {
            return "VARCHAR";
        } else if (String_super.name().equals(this.name())) {
            return "VARCHAR";
        } else {
            return "";
        }

    }
}
