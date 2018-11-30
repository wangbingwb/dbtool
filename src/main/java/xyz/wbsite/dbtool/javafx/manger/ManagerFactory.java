package xyz.wbsite.dbtool.javafx.manger;

import xyz.wbsite.dbtool.javafx.JavaFxApplication;

public class ManagerFactory {
    private static XmlManager xmlManager = null;
    private static ReflashManager reflashManager =null;
    private static ProjectManager dBManager;
    private static FreeMarkerManager freeMarkerManager;

    static {
        xmlManager = new XmlManager();
        dBManager = new ProjectManager();
        freeMarkerManager = new FreeMarkerManager();
    }

    public static ProjectManager getdBManager() {
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
