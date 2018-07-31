package com.wb.dbtool.javafx.ctrl;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

public class ConnectInfoController {

    @FXML
    private ChoiceBox databaseType;
    @FXML
    private TextField driver;
    @FXML
    private TextField url;
    @FXML
    private TextField userName;
    @FXML
    private TextField password;

    @FXML
    private Button test;
    @FXML
    private Button load;
    @FXML
    private Button cancel;

    public ChoiceBox getDatabaseType() {
        return databaseType;
    }

    public void setDatabaseType(ChoiceBox databaseType) {
        this.databaseType = databaseType;
    }

    public TextField getUrl() {
        return url;
    }

    public void setUrl(TextField url) {
        this.url = url;
    }

    public TextField getUserName() {
        return userName;
    }

    public TextField getDriver() {
        return driver;
    }

    public void setDriver(TextField driver) {
        this.driver = driver;
    }

    public void setUserName(TextField userName) {
        this.userName = userName;
    }

    public TextField getPassword() {
        return password;
    }

    public void setPassword(TextField password) {
        this.password = password;
    }

    public Button getTest() {
        return test;
    }

    public void setTest(Button test) {
        this.test = test;
    }

    public Button getLoad() {
        return load;
    }

    public void setLoad(Button load) {
        this.load = load;
    }

    public Button getCancel() {
        return cancel;
    }

    public void setCancel(Button cancel) {
        this.cancel = cancel;
    }
}
