package com.wb.dbtool.service;

import com.wb.dbtool.Main;

public class ServiceFactory {
    private static XmlService xmlService = null;
    private static ReflashService reflashService =null;

    static {
        xmlService = new XmlService();
    }

    public static XmlService getXmlService() {
        return xmlService;
    }

    public static ReflashService getReflashService(Main main) {
        if (reflashService == null){
            reflashService = new ReflashService(main);
        }
        return reflashService;
    }
}
