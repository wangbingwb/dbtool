package com.wb.dbtool;

import com.wb.dbtool.javafx.JavaFxApplication;
import com.wb.dbtool.web.WebApplication;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {

    public static void main(String[] args) {
        ExecutorService executorService = Executors.newFixedThreadPool(2);
        executorService.execute(new Runnable() {
            @Override
            public void run() {
                JavaFxApplication.main(args);
            }
        });
//
//        executorService.execute(new Runnable() {
//            @Override
//            public void run() {
//                WebApplication.main(args);
//            }
//        });

    }
}
