package com.wb.dbtool.po;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.enumeration.FieldType;

public class MybatisDBmapper extends AbstractDBmapper {

    public MybatisDBmapper(DataBase mDataBase) {
        super(mDataBase);
    }

    @Override
    String getDataBaseType(FieldType type, int lenght) {
        return null;
    }

    @Override
    String getFieldSql(Field field) {
        return null;
    }
}
