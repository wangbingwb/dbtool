package com.wb.dbtool.manger;

public class MangerFactory {
    private static DBmanger dBmanger;

    static {
        dBmanger = new DBmanger();
    }

    public static DBmanger getdBmanger() {
        return dBmanger;
    }
}
