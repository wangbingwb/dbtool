package xyz.wbsite.dbtool.javafx.ctrl;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class ProjectDetailController {

    @FXML
    private TextField projectName;
    @FXML
    private TextField projectBasePackage;
    @FXML
    private TextField projectAuthor;


    public TextField getProjectName() {
        return projectName;
    }

    public void setProjectName(TextField projectName) {
        this.projectName = projectName;
    }

    public TextField getProjectBasePackage() {
        return projectBasePackage;
    }

    public void setProjectBasePackage(TextField projectBasePackage) {
        this.projectBasePackage = projectBasePackage;
    }

    public TextField getProjectAuthor() {
        return projectAuthor;
    }

    public void setProjectAuthor(TextField projectAuthor) {
        this.projectAuthor = projectAuthor;
    }
}
