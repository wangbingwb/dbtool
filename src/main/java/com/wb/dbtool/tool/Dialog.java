package com.wb.dbtool.tool;

import com.wb.dbtool.Main;
import com.wb.dbtool.ctrl.ConnectInfoController;
import com.wb.dbtool.ctrl.GenerateOptionController;
import com.wb.dbtool.ctrl.MainController;
import com.wb.dbtool.ctrl.SdkInfoController;
import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.listener.GenerateOptionListener;
import com.wb.dbtool.manger.DBManager;
import com.wb.dbtool.manger.ManagerFactory;
import com.wb.dbtool.po.DB;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.InputMethodEvent;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Dialog {

    private static Stage popup;

    public static void showTimedDialog(final long time, String message) {
        popup = new Stage();
        popup.setAlwaysOnTop(true);
        popup.initModality(Modality.APPLICATION_MODAL);
        final Button closeBtn = new Button("知道了");
        closeBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                popup.close();
            }
        });

        VBox root = new VBox();
        root.setPadding(new Insets(20));
        root.setAlignment(Pos.BASELINE_CENTER);
        root.setSpacing(20);
        root.getChildren().addAll(new Label(message), closeBtn);
        Scene scene = new Scene(root);
        popup.setScene(scene);
        popup.setTitle("提示信息");
        popup.show();

        Thread thread = new Thread() {
            @Override
            public void run() {
                try {
                    Thread.sleep(time);
                    if (popup.isShowing()) {
                        Platform.runLater(new Runnable() {
                            @Override
                            public void run() {
                                popup.close();
                            }
                        });
                    }
                } catch (Exception exp) {
                    exp.printStackTrace();
                }
            }
        };
        thread.setDaemon(true);
        thread.start();
    }

    public static void showConfirmDialog(String message) {
        popup = new Stage();
        popup.setAlwaysOnTop(true);
        popup.initModality(Modality.APPLICATION_MODAL);
        final Button closeBtn = new Button("确认");
        closeBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                popup.close();
            }
        });

        VBox root = new VBox();
        root.setPadding(new Insets(20));
        root.setAlignment(Pos.BASELINE_CENTER);
        root.setSpacing(20);
        Label label = new Label(message);
        root.getChildren().addAll(label, closeBtn);
        Scene scene = new Scene(root);
        popup.setScene(scene);
        popup.setTitle("提示信息");
        popup.show();
    }

    public static void showError(String message) {
        Platform.runLater(new Runnable() {
            public void run() {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("错误");
                alert.setHeaderText("");
                alert.setContentText(message);
                alert.showAndWait();
            }
        });
    }

    public static void showSuccess(String message) {
        Platform.runLater(new Runnable() {
            public void run() {
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("消息");
                alert.setHeaderText("");
                alert.setContentText(message);
                alert.showAndWait();
            }
        });
    }

    public static void showProgress(String message) {
        if (popup != null) {
            popup.close();
        }
        popup = new Stage();
        popup.setAlwaysOnTop(true);
        popup.initModality(Modality.APPLICATION_MODAL);

        ProgressIndicator indicator = new ProgressIndicator();
        indicator.setPrefSize(30, 30);

        VBox root = new VBox();
        root.setPadding(new Insets(50, 80, 50, 80));
        root.setAlignment(Pos.BASELINE_CENTER);
        root.setSpacing(20);

        Label label = new Label(message);
        root.getChildren().addAll(indicator, label);
        Scene scene = new Scene(root);

        popup.setOnCloseRequest(new EventHandler<WindowEvent>() {
            @Override
            public void handle(WindowEvent event) {
                event.consume();
            }
        });
        popup.setScene(scene);
        popup.setTitle("提示");
        popup.show();
    }

    public static void stopPopup() {
        if (popup != null) {
            Platform.runLater(new Runnable() {
                @Override
                public void run() {
                    popup.close();
                }
            });
        }
    }

    public static void showGenerateOption(GenerateOptionListener listener) {
        FXMLLoader dbdetailloader = new FXMLLoader(Main.class.getResource("../../../fxml/generateOption.fxml"));
        try {
            dbdetailloader.load();
        } catch (IOException e) {
            return;
        }
        Parent root = dbdetailloader.getRoot();
        GenerateOptionController controller = dbdetailloader.getController();
        controller.setListener(listener);
        controller.getCancel().setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                stopPopup();
            }
        });
        controller.getOk().setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                listener.onGenerate(controller.getType(), DataBase.valueOf(controller.getDataBase().toUpperCase()));
            }
        });

        popup = new Stage();
        popup.setAlwaysOnTop(true);
        popup.initModality(Modality.APPLICATION_MODAL);

        Scene scene = new Scene(root);

        popup.setOnCloseRequest(new EventHandler<WindowEvent>() {
            @Override
            public void handle(WindowEvent event) {
                stopPopup();
            }
        });
        popup.setScene(scene);
        popup.setTitle("配置");
        popup.show();
    }

    public static void showDBConnectInput() {
        Stage stage = new Stage();
        stage.setAlwaysOnTop(true);
        stage.initModality(Modality.APPLICATION_MODAL);

        FXMLLoader dbdetailloader = new FXMLLoader(Main.class.getResource("../../../fxml/connectInfo.fxml"));
        try {
            dbdetailloader.load();
            Parent root = dbdetailloader.getRoot();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.setTitle("连接信息");

            ConnectInfoController controller = dbdetailloader.getController();

            ChoiceBox databaseType = controller.getDatabaseType();
            ObservableList<String> data = FXCollections.observableArrayList();
            data.add("Orcale");
            data.add("Mysql");
            databaseType.setItems(data);
            databaseType.setValue("Orcale");
            databaseType.setOnAction(new EventHandler<ActionEvent>() {
                @Override
                public void handle(ActionEvent event) {
                    String value = (String) databaseType.getValue();

                    if ("Orcale".equals(value)) {
                        controller.getDriver().setText("oracle.jdbc.OracleDriver");
                        controller.getUrl().setText("jdbc:oracle:thin:@127.0.0.1:1521:orcl");
                    } else if ("Mysql".equals(value)) {
                        controller.getDriver().setText("com.mysql.jdbc.Driver");
                        controller.getUrl().setText("jdbc:mysql://127.0.0.1:3306/tableName");
                    }
                }
            });

            TextField driver = controller.getDriver();
            driver.setText(Info.orcle.driver);
            TextField url = controller.getUrl();
            url.setText(Info.orcle.url);

            Button test = controller.getTest();
            test.setOnAction(new EventHandler<ActionEvent>() {
                @Override
                public void handle(ActionEvent event) {
                    String type = (String) controller.getDatabaseType().getValue();
                    String driver = controller.getDriver().getText();
                    String url = controller.getUrl().getText();
                    String userName = controller.getUserName().getText();
                    String password = controller.getPassword().getText();

                    Map<String, String> map = new HashMap<String, String>();
                    map.put("type", type);
                    map.put("url", url);
                    map.put("username", userName);
                    map.put("password", password);
                    map.put("driverClassName", driver);
                    boolean b = DBManager.testConnect(map);
                    if (b) {
                        Dialog.showConfirmDialog("连接成功!");
                    } else {
                        Dialog.showConfirmDialog("连接失败!");
                    }
                }
            });
            Button load = controller.getLoad();
            load.setOnAction(new EventHandler<ActionEvent>() {
                @Override
                public void handle(ActionEvent event) {
                    String type = (String) controller.getDatabaseType().getValue();
                    String driver = controller.getDriver().getText();
                    String url = controller.getUrl().getText();
                    String userName = controller.getUserName().getText();
                    String password = controller.getPassword().getText();

                    if (driver == null || driver.equals("")) {
                        Dialog.showConfirmDialog("驱动名称不能为空!");
                        return;
                    } else if (url == null || url.equals("")) {
                        Dialog.showConfirmDialog("连接不能为空!");
                        return;
                    } else if (userName == null || userName.equals("")) {
                        Dialog.showConfirmDialog("用户名不能为空!");
                        return;
                    } else if (password == null || password.equals("")) {
                        Dialog.showConfirmDialog("密码不能为空!");
                        return;
                    }

                    for (DB db : ManagerFactory.getdBManager().getDbs()) {
                        if (db.getDbName().equals(userName)) {
                            Dialog.showConfirmDialog("已经存的数据库!");
                            return;
                        }
                    }

                    Map<String, String> map = new HashMap<String, String>();
                    map.put("type", type);
                    map.put("url", url);
                    map.put("username", userName);
                    map.put("password", password);
                    map.put("driverClassName", driver);

                    Dialog.showProgress("加载中,请稍等...");
                    new Thread() {
                        @Override
                        public void run() {
                            if (popup.isShowing() && DBManager.loadDb(map)) {
                                Platform.runLater(new Runnable() {
                                    @Override
                                    public void run() {
                                        Dialog.stopPopup();
                                        stage.close();
                                    }
                                });
                            }
                        }
                    }.start();
                }
            });
            Button cancel = controller.getCancel();
            cancel.setOnAction(new EventHandler<ActionEvent>() {
                @Override
                public void handle(ActionEvent event) {
                    stage.close();
                }
            });

            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void showSDKinfo() {
        Stage stage = new Stage();
        stage.setAlwaysOnTop(true);
        stage.initModality(Modality.APPLICATION_MODAL);

        FXMLLoader dbdetailloader = new FXMLLoader(Main.class.getResource("../../../fxml/sdkInfo.fxml"));
        try {
            dbdetailloader.load();
            Parent root = dbdetailloader.getRoot();
            Scene scene = new Scene(root);

            stage.setScene(scene);
            stage.setTitle("连接信息");

            SdkInfoController controller = dbdetailloader.getController();
            TextField modulePath = controller.getModulePath();
            TextField sdkPath = controller.getSdkPath();
            sdkPath.requestFocus();
            modulePath.setOnInputMethodTextChanged(new EventHandler<InputMethodEvent>() {
                @Override
                public void handle(InputMethodEvent event) {
                    System.out.println();

                }
            });

            DBManager dBmanger = ManagerFactory.getdBManager();
            String path = dBmanger.getPath();

            File file = new File(path);
            File[] files = file.listFiles();
            s:
            for (File f : files) {
                if (!f.getName().contains(".")) {
                    File modul = findModul(f);
                    if (modul == null){
                        modulePath.setText("");
                        sdkPath.setText("");
                    }else {
                        modulePath.setText(modul.getAbsolutePath());
                        sdkPath.setText(f.getAbsolutePath()+"-SDK");
                        break s;
                    }

                }
            }

            Button start = controller.getStart();
            start.setOnAction(new EventHandler<ActionEvent>() {
                @Override
                public void handle(ActionEvent event) {
                    String module =  controller.getModulePath().getText();
                    String sdk = controller.getSdkPath().getText();

                    if (new File(module).exists()){
                        Dialog.showProgress("生成中...");
                        dBmanger.generateSDK(new File(module), new File(sdk));
                        Dialog.stopPopup();
                        Platform.runLater(new Runnable() {
                            @Override
                            public void run() {
                                stage.close();
                            }
                        });
                    }else {
                        Dialog.showConfirmDialog("项目不存在!");
                    }
                }
            });

            Button cancel = controller.getCancel();
            cancel.setOnAction(new EventHandler<ActionEvent>() {
                @Override
                public void handle(ActionEvent event) {
                    stage.close();
                }
            });

            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static boolean hasChild(File file,String child){
        if (file == null || child == null || "".equals(child) || file.listFiles() == null){
            return false;
        }

        for (File f : file.listFiles()) {
            if (f.getName().equals(child)){
                return true;
            }
        }

        return false;
    }

    private static File findModul(File file){
        if (file == null){
            return null;
        }else if (hasChild(file,"ent")&& hasChild(file,"req")&& hasChild(file,"rsp")){
            return file;
        }

        if (file.listFiles() != null){
            for (File f : file.listFiles()) {
                File modul = findModul(f);
                if (modul != null){
                    return modul;
                }
            }
        }

        return null;
    }
}
