package com.wb.dbtool.service;

import com.wb.dbtool.Main;
import com.wb.dbtool.manger.DBmanger;

public class ReflashService extends Thread{
    private Main main;

    public ReflashService(Main main) {
        this.main = main;
    }

    @Override
    public void run() {
        while (true){
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (DBmanger.isUpdate){
                main.invalidateLeft();
                DBmanger.isUpdate = false;
            }
        }
    }
}
