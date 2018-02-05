package com.wb.dbtool.ctrl;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

public class SdkInfoController {

    @FXML
    private TextField modulePath;
    @FXML
    private TextField sdkPath;
    @FXML
    private Button start;
    @FXML
    private Button cancel;

    public TextField getModulePath() {
        return modulePath;
    }

    public void setModulePath(TextField modulePath) {
        this.modulePath = modulePath;
    }

    public TextField getSdkPath() {
        return sdkPath;
    }

    public void setSdkPath(TextField sdkPath) {
        this.sdkPath = sdkPath;
    }

    public Button getStart() {
        return start;
    }

    public void setStart(Button start) {
        this.start = start;
    }

    public Button getCancel() {
        return cancel;
    }

    public void setCancel(Button cancel) {
        this.cancel = cancel;
    }
}
