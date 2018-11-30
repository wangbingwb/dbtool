package xyz.wbsite.dbtool.javafx.manger;

import xyz.wbsite.dbtool.javafx.JavaFxApplication;

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
            if (ProjectManager.isUpdate){
                main.loadingProjectTree();
                ProjectManager.isUpdate = false;
            }
        }
    }
}
