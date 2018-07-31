package com.wb.dbtool.javafx.ctrl;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class TableDetailController {

    @FXML
    private TextField tablename;
    @FXML
    private TextField tablecomment;

    public TextField getTablename() {
        return tablename;
    }

    public void setTablename(TextField tablename) {
        this.tablename = tablename;
    }

    public TextField getTablecomment() {
        return tablecomment;
    }

    public void setTablecomment(TextField tablecomment) {
        this.tablecomment = tablecomment;
    }
}
