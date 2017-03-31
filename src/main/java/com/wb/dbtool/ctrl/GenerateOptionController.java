package com.wb.dbtool.ctrl;

import com.wb.dbtool.listener.GenerateOptionListener;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;

public class GenerateOptionController {

    private GenerateOptionListener listener;

    @FXML
    private CheckBox webx;
    @FXML
    private CheckBox springmvc;
    @FXML
    private CheckBox mybatis;

    private String type = "webx";
    private String dataBase = "ORACLE";

    @FXML
    private Button ok;
    @FXML
    private Button cancel;

    public String getDataBase() {
        return dataBase;
    }

    public void setDataBase(String dataBase) {
        this.dataBase = dataBase;
    }

    public GenerateOptionListener getListener() {
        return listener;
    }

    public void setListener(GenerateOptionListener listener) {
        this.listener = listener;
    }

    public CheckBox getWebx() {
        return webx;
    }

    public void setWebx(CheckBox webx) {
        this.webx = webx;
    }

    public CheckBox getSpringmvc() {
        return springmvc;
    }

    public void setSpringmvc(CheckBox springmvc) {
        this.springmvc = springmvc;
    }

    public CheckBox getMybatis() {
        return mybatis;
    }

    public void setMybatis(CheckBox mybatis) {
        this.mybatis = mybatis;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Button getOk() {
        return ok;
    }

    public void setOk(Button ok) {
        this.ok = ok;
    }

    public Button getCancel() {
        return cancel;
    }

    public void setCancel(Button cancel) {
        this.cancel = cancel;
    }

    @FXML
    public void select(ActionEvent event) {
        if (event.getTarget() instanceof CheckBox){
            webx.selectedProperty().set(false);
            springmvc.selectedProperty().set(false);
            mybatis.selectedProperty().set(false);

            if (webx == event.getTarget()){
                webx.selectedProperty().set(true);
                type = "webx";
            }else if (springmvc == event.getTarget()){
                springmvc.selectedProperty().set(true);
                type = "springmvc";
            }else if (mybatis == event.getTarget()){
                mybatis.selectedProperty().set(true);
                type = "mybatis";
            }
        }
    }
}
