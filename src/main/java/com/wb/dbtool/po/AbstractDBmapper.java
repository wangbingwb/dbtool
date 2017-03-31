package com.wb.dbtool.po;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.enumeration.FieldType;

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

    abstract String getDataBaseType(FieldType type,int lenght);
    abstract String getFieldSql(Field field);
}
