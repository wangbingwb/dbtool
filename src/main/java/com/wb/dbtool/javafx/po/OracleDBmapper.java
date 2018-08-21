package com.wb.dbtool.javafx.po;

import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.enumeration.FieldType;

public class OracleDBmapper extends AbstractDBmapper {

    @Override
    public String getFieldSql(Field field) {
        StringBuffer sb = new StringBuffer("");
        sb.append("\"").append(field.getFieldName()).append("\" ");

        FieldType type = field.getFieldType();

        if (FieldType.Boolean.name().equals(type.name())) {
            sb.append("CHAR(1)");
        } else if (FieldType.Byte.name().equals(type.name())) {
            sb.append("NUMBER(3)");
        } else if (FieldType.Short.name().equals(type.name())) {
            sb.append("NUMBER(5)");
        } else if (FieldType.Integer.name().equals(type.name())) {
            sb.append("NUMBER(10)");
        } else if (FieldType.Long.name().equals(type.name())) {
            sb.append("NUMBER(19)");
        } else if (FieldType.Float.name().equals(type.name())) {
            sb.append("NUMBER");
        } else if (FieldType.Double.name().equals(type.name())) {
            sb.append("NUMBER");
        } else if (FieldType.Date.name().equals(type.name())) {
            sb.append("DATE");
        } else if (FieldType.Bytes.name().equals(type.name())) {
            sb.append("BLOB");
        } else if (FieldType.String_1.name().equals(type.name())) {
            sb.append("CHAR(1)");
        } else if (FieldType.String_10.name().equals(type.name())) {
            sb.append("CHAR(10)");
        } else if (FieldType.String_var.name().equals(type.name())) {
            Integer fieldLenght = field.getFieldLenght();
            sb.append("VARCHAR2(" + fieldLenght + ")");
        } else if (FieldType.String_var50.name().equals(type.name())) {
            sb.append("VARCHAR2(50)");
        } else if (FieldType.String_var100.name().equals(type.name())) {
            sb.append("VARCHAR2(100)");
        } else if (FieldType.String_var255.name().equals(type.name())) {
            sb.append("VARCHAR2(250)");
        } else if (FieldType.String_var500.name().equals(type.name())) {
            sb.append("VARCHAR2(500)");
        } else if (FieldType.String_var2500.name().equals(type.name())) {
            sb.append("VARCHAR2(2500)");
        } else if (FieldType.String_var4000.name().equals(type.name())) {
            sb.append("VARCHAR2(4000)");
        } else if (FieldType.String_super.name().equals(type.name())) {
            //Oracle中LONG最大支持2G字节
            sb.append("LONG");
        }

        if (field.getIsMust() && field.getIsSystem()) {
            sb.append(" NOT NULL");
        } else {
            sb.append(" NULL");
        }
        return sb.toString();
    }

    public OracleDBmapper(DataBase mDataBase) {
        super(mDataBase);
    }

    @Override
    public String getDataBaseType(FieldType type, int lenght) {
        if (FieldType.Boolean.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.Byte.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Short.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Integer.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Long.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Float.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Double.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Date.name().equals(type.name())) {
            return "TIMESTAMP";
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else if (FieldType.String_1.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_10.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_var.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var50.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var100.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var255.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var500.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var2500.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var4000.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_super.name().equals(type.name())) {
            //Oracle中LONG最大支持2G字节
            return "LONG";
        }
        return "";
    }

    @Override
    public String getDataBaseType(FieldType type) {
        if (FieldType.Boolean.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.Byte.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Short.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Integer.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Long.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Float.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Double.name().equals(type.name())) {
            return "NUMBER";
        } else if (FieldType.Date.name().equals(type.name())) {
            return "TIMESTAMP";
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else if (FieldType.String_1.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_10.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_var.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var50.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var255.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var500.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var2500.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var4000.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_super.name().equals(type.name())) {
            //Oracle中LONG最大支持2G字节
            return "LONG";
        }
        return "";
    }

    public FieldType getType(String type, int lenght, int precision, int scale) {
        if ("CHAR".equals(type) && lenght == 1) {
            return FieldType.String_1;
        } else if ("CHAR".equals(type) && lenght == 10) {
            return FieldType.String_10;
        } else if ("CHAR".equals(type)) {
            return FieldType.String_var;
        } else if ("VARCHAR".equals(type) && lenght == 50) {
            return FieldType.String_var50;
        } else if ("NVARCHAR".equals(type)) {
            return FieldType.String_var50;
        } else if ("VARCHAR2".equals(type) && lenght == 50) {
            return FieldType.String_var50;
        } else if ("VARCHAR2".equals(type) && lenght == 100) {
            return FieldType.String_var100;
        } else if ("VARCHAR2".equals(type) && lenght == 255) {
            return FieldType.String_var255;
        } else if ("VARCHAR2".equals(type) && lenght == 500) {
            return FieldType.String_var500;
        } else if ("VARCHAR2".equals(type) && lenght == 2500) {
            return FieldType.String_var2500;
        } else if ("VARCHAR2".equals(type) && lenght == 4000) {
            return FieldType.String_var4000;
        } else if ("VARCHAR2".equals(type)) {
            return FieldType.String_var;
        } else if ("NVARCHAR2".equals(type)) {
            return FieldType.String_var100;
        } else if ("CLOB".equals(type)) {
            return FieldType.String_var50;
        } else if ("NCLOB".equals(type)) {
            return FieldType.String_var50;
        } else if ("LONG".equals(type)) {
            return FieldType.String_super;
        } else if ("NUMBER".equals(type)) {
            if (precision > 18 && scale == 0) {
                return FieldType.Long;
            } else if (precision >= 10 && precision <= 18 && scale == 0) {
                return FieldType.Long;
            } else if (precision >= 1 && precision <= 9 && scale == 0) {
                return FieldType.Integer;
            } else if (scale > 0) {
                return FieldType.Double;
            } else {
                return FieldType.Long;
            }
        } else if ("DATE".equals(type)) {
            return FieldType.Date;
        } else if ("TIMESTAMP".equals(type)) {
            return FieldType.Date;
        }
        return FieldType.String_var50;
    }
}
