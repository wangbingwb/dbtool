package com.wb.dbtool.ctrl;

import com.wb.dbtool.listener.GenerateOptionListener;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;

public class GenerateOptionController {

    private GenerateOptionListener listener;

    @FXML
    private CheckBox webx;
    @FXML
    private CheckBox springmvc;
    @FXML
    private CheckBox mybatis;
    @FXML
    private ToggleGroup type;
    @FXML
    private ToggleGroup db;
    @FXML
    private Button ok;
    @FXML
    private Button cancel;

    public String getDataBase() {
        RadioButton value = (RadioButton) db.selectedToggleProperty().getValue();
        String name = value.textProperty().getValue();
        return name.toUpperCase();
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
        RadioButton value = (RadioButton) type.selectedToggleProperty().getValue();
        String name = value.textProperty().getValue();
        System.out.println(name);
        return name;
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
}
