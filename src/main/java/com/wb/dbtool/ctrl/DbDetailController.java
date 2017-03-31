package com.wb.dbtool.ctrl;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class DbDetailController {

    @FXML
    private TextField dbname;
    @FXML
    private TextField dbcomment;
    @FXML
    private TextField basePackage;
    @FXML
    private TextField moduleName;

    public TextField getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(TextField basePackage) {
        this.basePackage = basePackage;
    }

    public TextField getModuleName() {
        return moduleName;
    }

    public void setModuleName(TextField moduleName) {
        this.moduleName = moduleName;
    }

    public TextField getDbname() {
        return dbname;
    }

    public void setDbname(TextField dbname) {
        this.dbname = dbname;
    }

    public TextField getDbcomment() {
        return dbcomment;
    }

    public void setDbcomment(TextField dbcomment) {
        this.dbcomment = dbcomment;
    }
}
