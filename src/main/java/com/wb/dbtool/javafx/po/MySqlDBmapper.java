package com.wb.dbtool.javafx.po;

import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.enumeration.FieldType;

public class MySqlDBmapper extends AbstractDBmapper {

    public MySqlDBmapper(DataBase mDataBase) {
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
        } else if (FieldType.String_1.name().equals(type.name())) {
            return "CAHR";
        } else if (FieldType.String_5.name().equals(type.name())) {
            return "CAHR";
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
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else {
            return "";
        }
    }

    @Override
    public String getFieldSql(Field field) {
        StringBuffer sb = new StringBuffer("");
        sb.append("`").append(field.getFieldName()).append("` ");

        FieldType type = field.getFieldType();

        if (FieldType.Boolean.name().equals(type.name())) {
            sb.append("TINYINT(1)");
        } else if (FieldType.Byte.name().equals(type.name())) {
            sb.append("TINYINT(3)");
        } else if (FieldType.Short.name().equals(type.name())) {
            sb.append("SMALLINT(5)");
        } else if (FieldType.Integer.name().equals(type.name())) {
            sb.append("INTEGER(10)");
        } else if (FieldType.Long.name().equals(type.name())) {
            sb.append("BIGINT(20)");
        } else if (FieldType.Float.name().equals(type.name())) {
            sb.append("FLOAT");
        } else if (FieldType.Double.name().equals(type.name())) {
            sb.append("DOUBLE");
        } else if (FieldType.Date.name().equals(type.name())) {
            sb.append("DATETIME");
        } else if (FieldType.Bytes.name().equals(type.name())) {
            sb.append("BLOB");
        } else if (FieldType.String_1.name().equals(type.name())) {
            sb.append("CHAR(1)");
        } else if (FieldType.String_5.name().equals(type.name())) {
            sb.append("CHAR(5)");
        } else if (FieldType.String_10.name().equals(type.name())) {
            sb.append("CHAR(10)");
        } else if (FieldType.String_20.name().equals(type.name())) {
            sb.append("CHAR(20)");
        } else if (FieldType.String_var50.name().equals(type.name())) {
            sb.append("VARCHAR(50)");
        }  else if (FieldType.String_var100.name().equals(type.name())) {
            sb.append("VARCHAR(100)");
        } else if (FieldType.String_var255.name().equals(type.name())) {
            sb.append("VARCHAR(250)");
        } else if (FieldType.String_var500.name().equals(type.name())) {
            sb.append("VARCHAR(500)");
        } else if (FieldType.String_var2500.name().equals(type.name())) {
            sb.append("VARCHAR(2500)");
        } else if (FieldType.String_var4000.name().equals(type.name())) {
            sb.append("VARCHAR(4000)");
        } else if (FieldType.String_super.name().equals(type.name())) {
            sb.append("TEXT");
        }

        if (!field.getIsSystem() && field.getIsMust() && (field.getDefaultValue() == null || field.getDefaultValue().toUpperCase().equals("NULL"))){
            sb.append(" NOT NULL");
        }else if(!field.getIsSystem() && field.getIsMust() && field.getDefaultValue() != null && !field.getDefaultValue().toUpperCase().equals("NULL")){
            if (field.getFieldType().name().contains("String")){//默认字符
                sb.append(" NOT NULL").append(" DEFAULT '"+field.getDefaultValue()+"'");
            }else {//不是字符就是数字，目前只考虑两张情况
                sb.append(" NOT NULL").append(" DEFAULT "+field.getDefaultValue()+"");
            }
        }else if (field.getIsSystem() && field.getFieldName().equals("ID")){
            sb.append(" NOT NULL");
        }else if (field.getIsSystem() && field.getFieldName().equals("ROW_VERSION")){
            sb.append(" NOT NULL").append(" DEFAULT 0");
        }else if (field.getIsSystem() && field.getFieldName().equals("IS_DELETED")){
            sb.append(" NOT NULL").append(" DEFAULT 0");
        }else if (field.getIsSystem() && field.getFieldName().equals("CREATE_BY")){
            sb.append(" NOT NULL");
        }else if (field.getIsSystem() && field.getFieldName().equals("CREATE_TIME")){
            sb.append(" NOT NULL");
        }else if (field.getIsSystem() && field.getFieldName().equals("LAST_UPDATE_BY")){
            sb.append(" DEFAULT NULL");
        }else if (field.getIsSystem() && field.getFieldName().equals("LAST_UPDATE_TIME")){
            sb.append(" DEFAULT NULL");
        }

        if (field.getFieldComment() != null){
            sb.append(" COMMENT '"+field.getFieldComment()+"'");
        }
        return sb.toString();
    }

    @Override
    DataBase getDataBase() {
        return super.getDataBase();
    }

    @Override
    public String getDataBaseType(FieldType type) {
        if (FieldType.Boolean.name().equals(type.name())) {
            return "TINYINT";
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
        } else if (FieldType.String_1.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_5.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_10.name().equals(type.name())) {
            return "CHAR";
        } else if (FieldType.String_20.name().equals(type.name())) {
            return "CHAR";
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
            return "DATETIME";
        } else if (FieldType.Bytes.name().equals(type.name())) {
            return "BLOB";
        } else {
            return "";
        }
    }

    @Override
    public FieldType getType(String type, int lenght, int precision, int scale) {
        if ("bigint".equals(type)) {
            return FieldType.Long;
        } else if ("varchar".equals(type) && lenght <= 50) {
            return FieldType.String_var50;
        } else if ("varchar".equals(type) && lenght <= 100) {
            return FieldType.String_var100;
        } else if ("varchar".equals(type) && lenght <= 255) {
            return FieldType.String_var255;
        } else if ("varchar".equals(type) && lenght <= 500) {
            return FieldType.String_var500;
        } else if ("varchar".equals(type) && lenght <= 2500) {
            return FieldType.String_var2500;
        } else if ("varchar".equals(type) && lenght <= 4000) {
            return FieldType.String_var4000;
        } else if ("date".equals(type)) {
            return FieldType.Date;
        } else if ("datetime".equals(type)) {
            return FieldType.Date;
        } else if ("timestamp".equals(type)) {
            return FieldType.Date;
        } else if ("char".equals(type) && lenght <= 10) {
            return FieldType.String_10;
        } else if ("char".equals(type) && lenght <= 20) {
            return FieldType.String_20;
        } else if ("tinyint".equals(type)) {
            return FieldType.Integer;
        } else if ("smallint".equals(type)) {
            return FieldType.Integer;
        } else if ("mediumint".equals(type)) {
            return FieldType.Integer;
        } else if ("int".equals(type)) {
            return FieldType.Integer;
        } else if ("bigint".equals(type)) {
            return FieldType.Long;
        } else if ("float".equals(type)) {
            return FieldType.Float;
        } else if ("double".equals(type)) {
            return FieldType.Double;
        }
        return null;
    }
}
