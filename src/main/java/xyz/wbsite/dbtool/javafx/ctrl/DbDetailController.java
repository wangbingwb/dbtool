package xyz.wbsite.dbtool.javafx.ctrl;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class DbDetailController {

    @FXML
    private TextField moduleComment;
    @FXML
    private TextField modulePrefix;
    @FXML
    private TextField moduleName;

    public TextField getModuleName() {
        return moduleName;
    }

    public void setModuleName(TextField moduleName) {
        this.moduleName = moduleName;
    }

    public TextField getModuleComment() {
        return moduleComment;
    }

    public void setModuleComment(TextField moduleComment) {
        this.moduleComment = moduleComment;
    }

    public TextField getModulePrefix() {
        return modulePrefix;
    }

    public void setModulePrefix(TextField modulePrefix) {
        this.modulePrefix = modulePrefix;
    }
}
