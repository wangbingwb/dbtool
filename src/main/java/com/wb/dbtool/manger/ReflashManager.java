package com.wb.dbtool.manger;

import com.wb.dbtool.Main;

public class ReflashManager extends Thread{
    private Main main;

    public ReflashManager(Main main) {
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
            if (DBManager.isUpdate){
                main.invalidateLeft();
                DBManager.isUpdate = false;
            }
        }
    }
}
