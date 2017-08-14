package com.wb.dbtool.manger;

import com.wb.dbtool.Main;

public class ManagerFactory {
    private static XmlManager xmlManager = null;
    private static ReflashManager reflashManager =null;
    private static DBManager dBManger;

    static {
        xmlManager = new XmlManager();
        dBManger = new DBManager();
    }

    public static DBManager getdBManger() {
        return dBManger;
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
