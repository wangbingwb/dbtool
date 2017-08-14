package com.wb.dbtool;

import com.alibaba.fastjson.JSONObject;
import com.wb.dbtool.manger.DBManager;
import com.wb.dbtool.manger.ManagerFactory;
import com.wb.dbtool.po.DB;

import java.util.List;

public class WebEngin {

    private DBManager dBmanger;
    private List<DB> dbs;

    public WebEngin() {
        dBmanger = ManagerFactory.getdBManager();
        dBmanger.invalidate();
        dbs = dBmanger.getDbs();

    }

    public String getDbs() {
        String s = JSONObject.toJSONString(dbs);
        System.out.println(s);
        return s;
    }

}
