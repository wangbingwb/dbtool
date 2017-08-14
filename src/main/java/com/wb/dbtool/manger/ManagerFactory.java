package com.wb.dbtool.manger;

import com.wb.dbtool.Main;

public class ManagerFactory {
    private static XmlManager xmlManager = null;
    private static ReflashManager reflashManager =null;
    private static DBManager dBManager;

    static {
        xmlManager = new XmlManager();
        dBManager = new DBManager();
    }

    public static DBManager getdBManager() {
        return dBManager;
    }


    public static XmlManager getXmlManager() {
        return xmlManager;
    }

    public static ReflashManager getReflashManager(Main main) {
        if (reflashManager == null){
            reflashManager = new ReflashManager(main);
        }
        return reflashManager;
    }
}
