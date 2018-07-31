package com.wb.dbtool.javafx.manger;

import com.wb.dbtool.javafx.JavaFxApplication;

public class ManagerFactory {
    private static XmlManager xmlManager = null;
    private static ReflashManager reflashManager =null;
    private static DBManager dBManager;
    private static FreeMarkerManager freeMarkerManager;

    static {
        xmlManager = new XmlManager();
        dBManager = new DBManager();
        freeMarkerManager = new FreeMarkerManager();
    }

    public static DBManager getdBManager() {
        return dBManager;
    }

    public static FreeMarkerManager getFreeMarkerManager() {
        return freeMarkerManager;
    }


    public static XmlManager getXmlManager() {
        return xmlManager;
    }

    public static ReflashManager getReflashManager(JavaFxApplication main) {
        if (reflashManager == null){
            reflashManager = new ReflashManager(main);
        }
        return reflashManager;
    }
}
