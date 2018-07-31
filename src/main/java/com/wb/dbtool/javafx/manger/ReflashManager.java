package com.wb.dbtool.javafx.manger;

import com.wb.dbtool.javafx.JavaFxApplication;

public class ReflashManager extends Thread{
    private JavaFxApplication main;

    public ReflashManager(JavaFxApplication main) {
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
