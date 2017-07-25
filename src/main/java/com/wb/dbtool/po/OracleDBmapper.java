package com.wb.dbtool.po;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.enumeration.FieldType;

public class OracleDBmapper extends AbstractDBmapper {

    @Override
    public String getFieldSql(Field field) {
        StringBuffer sb = new StringBuffer("");
        sb.append("\"").append(field.getFieldName()).append("\" ");

        String type = getDataBaseType(field.getFieldType(), field.getFieldLenght());
        sb.append(type);
        if ("VARCHAR2".equals(type)) {
            sb.append("(" + field.getFieldLenght() + " BYTE) ");
        } else if ("DATE".equals(type)) {
            sb.append(" ");
        } else if ("TIMESTAMP".equals(type)) {
            sb.append(" ");
        } else {
            sb.append("(" + field.getFieldLenght() + ") ");
        }

        if (field.getIsMust() && field.getIsSystem()) {
            sb.append("NOT NULL");
        } else {
            sb.append("NULL");
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
        } else if (FieldType.Time.name().equals(type.name())) {
            return "TIMESTAMP";
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else if (FieldType.String_10.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_20.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_var50.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var250.name().equals(type.name())) {
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
        } else if (FieldType.Time.name().equals(type.name())) {
            return "TIMESTAMP";
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else if (FieldType.String_10.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_20.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_var50.name().equals(type.name())) {
            return "VARCHAR2";
        } else if (FieldType.String_var250.name().equals(type.name())) {
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

    public FieldType getJavaType(String type, int lenght, int precision, int scale) {
        if ("CHAR".equals(type) && lenght == 10) {
            return FieldType.String_10;
        } else if ("NCHAR".equals(type) && lenght ==20) {
            return FieldType.String_20;
        } else if ("VARCHAR".equals(type) && lenght ==50) {
            return FieldType.String_var50;
        } else if ("NVARCHAR".equals(type)) {
            return FieldType.String_var50;
        } else if ("VARCHAR2".equals(type)) {
            return FieldType.String_var50;
        } else if ("NVARCHAR2".equals(type)) {
            return FieldType.String_var50;
        } else if ("CLOB".equals(type)) {
            return FieldType.String_var50;
        } else if ("NCLOB".equals(type)) {
            return FieldType.String_var50;
        } else if ("LONG".equals(type)) {
            return FieldType.String_super;
        } else if ("NUMBER".equals(type)) {
            if (precision > 18 && scale == 0) {
                return FieldType.BigDecimal;
            } else if (precision >= 10 && precision <= 18 && scale == 0) {
                return FieldType.Long;
            } else if (precision >= 1 && precision <= 9 && scale == 0) {
                return FieldType.Integer;
            } else if (scale > 0) {
                return FieldType.Double;
            }
        } else if ("DATE".equals(type)) {
            return FieldType.Date;
        } else if ("TIMESTAMP".equals(type)) {
            return FieldType.Date;
        }
        return null;
    }
}
