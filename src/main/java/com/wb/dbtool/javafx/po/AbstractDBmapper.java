package com.wb.dbtool.javafx.po;

import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.enumeration.FieldType;

public abstract class AbstractDBmapper {
    DataBase mDataBase = null;

    private AbstractDBmapper(){

    }

    public AbstractDBmapper(DataBase mDataBase) {
        this.mDataBase = mDataBase;
    }

    DataBase getDataBase(){
        return mDataBase;
    }

    public abstract String getDataBaseType(FieldType type,int lenght);
    public abstract String getDataBaseType(FieldType type);
    abstract String getFieldSql(Field field);
    public abstract FieldType getType(String type, int lenght, int precision, int scale);
}
