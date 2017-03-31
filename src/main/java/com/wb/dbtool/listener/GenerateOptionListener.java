package com.wb.dbtool.listener;

import com.wb.dbtool.enumeration.DataBase;

public interface GenerateOptionListener {
    void onGenerate(String option,DataBase dataBase);
}
