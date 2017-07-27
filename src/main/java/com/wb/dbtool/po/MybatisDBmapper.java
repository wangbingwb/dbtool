package com.wb.dbtool.po;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.enumeration.FieldType;

public class MybatisDBmapper extends AbstractDBmapper {

    public MybatisDBmapper(DataBase mDataBase) {
        super(mDataBase);
    }

    @Override
    public String getDataBaseType(FieldType type, int lenght) {
        if (FieldType.Boolean.name().equals(type.name())) {
            return "BIT";
        } else if (FieldType.Byte.name().equals(type.name())) {
            return "TINYINT";
        } else if (FieldType.Short.name().equals(type.name())) {
            return "SMALLINT";
        } else if (FieldType.Integer.name().equals(type.name())) {
            return "INTEGER";
        } else if (FieldType.Long.name().equals(type.name())) {
            return "NUMERIC";
        } else if (FieldType.Float.name().equals(type.name())) {
            return "REAL";
        } else if (FieldType.Double.name().equals(type.name())) {
            return "FLOAT";
        } else if (FieldType.Character.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_10.name().equals(type.name())) {
            return "CAHR";
        } else if (FieldType.String_20.name().equals(type.name())) {
            return "CAHR";
        } else if (FieldType.String_var50.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var100.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var255.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var500.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var2500.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var4000.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.Date.name().equals(type.name())) {
            return "DATE";
        } else if (FieldType.Time.name().equals(type.name())) {
            return "DATE";
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else {
            return "";
        }
    }

    @Override
    String getFieldSql(Field field) {
        return null;
    }

    @Override
    DataBase getDataBase() {
        return super.getDataBase();
    }

    @Override
    public String getDataBaseType(FieldType type) {
        if (FieldType.Boolean.name().equals(type.name())) {
            return "BIT";
        } else if (FieldType.Byte.name().equals(type.name())) {
            return "TINYINT";
        } else if (FieldType.Short.name().equals(type.name())) {
            return "SMALLINT";
        } else if (FieldType.Integer.name().equals(type.name())) {
            return "INTEGER";
        } else if (FieldType.Long.name().equals(type.name())) {
            return "NUMERIC";
        } else if (FieldType.Float.name().equals(type.name())) {
            return "REAL";
        } else if (FieldType.Double.name().equals(type.name())) {
            return "FLOAT";
        } else if (FieldType.Character.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_10.name().equals(type.name())) {
            return "CAHR";
        } else if (FieldType.String_20.name().equals(type.name())) {
            return "CAHR";
        } else if (FieldType.String_var50.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var100.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var255.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var500.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var2500.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.String_var4000.name().equals(type.name())) {
            return "VARCHAR";
        } else if (FieldType.Date.name().equals(type.name())) {
            return "DATE";
        } else if (FieldType.Time.name().equals(type.name())) {
            return "DATE";
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else {
            return "";
        }
    }

    @Override
    public FieldType getJavaType(String type, int lenght, int precision, int scale) {

        return null;
    }
}
