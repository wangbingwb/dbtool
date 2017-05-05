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
            return "DATE";
        } else if (FieldType.Time.name().equals(type.name())) {
            return "DATE";
        } else if (FieldType.Binary.name().equals(type.name())) {
            return "BLOB";
        } else if (FieldType.String.name().equals(type.name())) {
            if (lenght <= 4000) {//Oracle中VARCHAR2最大支持4000字节
                return "VARCHAR2";
            } else {//Oracle中LONG最大支持2G字节
                return "LONG";
            }
        }
        return "";
    }

    public FieldType getJavaType(String type, int lenght, int precision, int scale) {
        if ("CHAR".equals(type)) {
            return FieldType.String;
        } else if ("NCHAR".equals(type)) {
            return FieldType.String;
        } else if ("VARCHAR".equals(type)) {
            return FieldType.String;
        } else if ("NVARCHAR".equals(type)) {
            return FieldType.String;
        } else if ("VARCHAR2".equals(type)) {
            return FieldType.String;
        } else if ("NVARCHAR2".equals(type)) {
            return FieldType.String;
        } else if ("CLOB".equals(type)) {
            return FieldType.String;
        } else if ("NCLOB".equals(type)) {
            return FieldType.String;
        } else if ("LONG".equals(type)) {
            return FieldType.String;
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
        }else if ("TIMESTAMP".equals(type)) {
            return FieldType.Date;
        }
        return null;
    }
}
