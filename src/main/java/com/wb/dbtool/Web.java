package com.wb.dbtool;

import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.concurrent.Worker;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebErrorEvent;
import javafx.scene.web.WebEvent;
import javafx.scene.web.WebView;
import javafx.stage.Stage;
import netscape.javascript.JSObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.net.URL;

public class Web extends Application {
    private Stage stage;

    @Override
    public void start(Stage primaryStage) throws Exception {
        BorderPane borderPane = new BorderPane();
        borderPane.setPrefWidth(700);
        borderPane.setPrefHeight(500);
        primaryStage.setScene(new Scene(borderPane));
        stage = primaryStage;

        WebView webView = new WebView();
        borderPane.setCenter(webView);
        final WebEngine engine = webView.getEngine();
        engine.setJavaScriptEnabled(true);
        JSObject win = (JSObject) engine.executeScript("window");
        WebEngin webEngin = new WebEngin();
        win.setMember("webEngin",webEngin);

        File file = new File(getClass().getResource("../../../web/index.html").getPath());

        StringBuffer stringBuffer = new StringBuffer("");
        BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
        String s = null;
        while ((s = bufferedReader.readLine() )!= null){
            stringBuffer.append(s);
//            System.out.println(s);
        }

        engine.loadContent(stringBuffer.toString());

        /**
         * 设置标题栏为当前访问页面的标题。
         */
        engine.getLoadWorker().stateProperty().addListener(new ChangeListener<Worker.State>() {
            @Override
            public void changed(ObservableValue<? extends Worker.State> observable, Worker.State oldValue, Worker.State newValue) {
                if (newValue == Worker.State.SUCCEEDED) {
                    stage.setTitle(engine.getTitle());
                }
            }
        });

        /**
         * 测试能否获得javascript上面的交互内容。
         * 可以自己写一个包含window.alert("neirong")的html进行测试。
         * 返回的是neirong
         */
        engine.setOnAlert(new EventHandler<WebEvent<String>>() {

            @Override
            public void handle(WebEvent<String> event) {
                System.out.println(event.getData());
            }
        });

        primaryStage.show();
    }

    @Override
    public void init() throws Exception {
        super.init();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
