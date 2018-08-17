package com.wb.dbtool.javafx.ctrl;

import com.wb.dbtool.javafx.JavaFxApplication;
import com.wb.dbtool.javafx.enumeration.DataBase;
import com.wb.dbtool.javafx.listener.GenerateOptionListener;
import com.wb.dbtool.javafx.manger.DBManager;
import com.wb.dbtool.javafx.manger.ManagerFactory;
import com.wb.dbtool.javafx.tool.Dialog;
import com.wb.dbtool.web.framework.utils.LogUtil;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TableView;
import javafx.scene.control.TreeView;
import javafx.scene.layout.Pane;
import javafx.stage.DirectoryChooser;
import javafx.stage.Stage;

import java.io.File;

public class MainController {
    private DBManager dBmanger = ManagerFactory.getdBManager();

    @FXML
    private TreeView dbtree;
    @FXML
    private Pane detail;
    @FXML
    private TableView feilds;
    @FXML
    private Button add;
    @FXML
    private Button sub;
    @FXML
    private CheckBox addSysFields;

    private JavaFxApplication main;

    public DBManager getdBmanger() {
        return dBmanger;
    }

    public void setdBmanger(DBManager dBmanger) {
        this.dBmanger = dBmanger;
    }

    public JavaFxApplication getMain() {
        return main;
    }

    public void setMain(JavaFxApplication main) {
        this.main = main;
    }

    public Button getAdd() {
        return add;
    }

    public void setAdd(Button add) {
        this.add = add;
    }

    public Button getSub() {
        return sub;
    }

    public CheckBox getAddSysFields() {
        return addSysFields;
    }

    public void setAddSysFields(CheckBox addSysFields) {
        this.addSysFields = addSysFields;
    }

    public void setSub(Button sub) {
        this.sub = sub;
    }

    public TableView getFeilds() {
        return feilds;
    }

    public void setFeilds(TableView feilds) {
        this.feilds = feilds;
    }

    public TreeView getDbtree() {
        return dbtree;
    }

    public void setDbtree(TreeView dbtree) {
        this.dbtree = dbtree;
    }

    public Pane getDetail() {
        return detail;
    }

    public void setDetail(Pane detail) {
        this.detail = detail;
    }

    @FXML
    public void showFileChooser(ActionEvent actionEvent) {
        DirectoryChooser directoryChooser = new DirectoryChooser();
        Stage stage = new Stage();
        File file = directoryChooser.showDialog(stage);

        dBmanger.setPath(file.getAbsolutePath());
        dBmanger.invalidate();
        main.invalidateLeft();

        System.out.println(file.getAbsolutePath());

    }

    public boolean doSave(ActionEvent actionEvent) {
        if (dBmanger.getPath() == null || "".equals(dBmanger.getPath())) {
            DirectoryChooser directoryChooser = new DirectoryChooser();
            Stage stage = new Stage();
            File file = directoryChooser.showDialog(stage);

            if (file == null) {

                return false;
            }
            dBmanger.setPath(file.getAbsolutePath());
            System.out.println(file.getAbsolutePath());
        }
        dBmanger.save();
        System.out.println("自动保存成功");
        return true;
    }

    @FXML
    public void save(ActionEvent actionEvent) {
        doSave(actionEvent);
    }

    @FXML
    public void saveAs(ActionEvent actionEvent) {
        DirectoryChooser directoryChooser = new DirectoryChooser();
        Stage stage = new Stage();
        File file = directoryChooser.showDialog(stage);

        if (file != null) {
            dBmanger.setPath(file.getAbsolutePath());
            dBmanger.save();
        }
    }

    @FXML
    public void showConnectInfo(ActionEvent actionEvent) {
        Dialog.showDBConnectInput();
    }

    @FXML
    public void generate(ActionEvent actionEvent) {
        if (!this.doSave(null)) {
            return;
        }
        if (dBmanger.doCheck()) {
            DirectoryChooser directoryChooser = new DirectoryChooser();
            directoryChooser.setInitialDirectory(new File(dBmanger.getPath()));
            Stage stage = new Stage();
            File file = directoryChooser.showDialog(stage);

            if (file != null) {
                //展示生成方式
                Dialog.showGenerateOption(new GenerateOptionListener() {
                    @Override
                    public void onGenerate(String option, DataBase dataBase) {
                        System.out.println("生成目录:"+file.getAbsolutePath());
                        dBmanger.generate(file.getAbsolutePath(), option, dataBase);
                    }
                });
            }
        }
    }

    @FXML
    public void generateSDK(ActionEvent actionEvent) {
        if (!this.doSave(null)) {
            return;
        }
        if (dBmanger.doCheck()) {

            Dialog.showSDKinfo();

//            DirectoryChooser directoryChooser = new DirectoryChooser();
//            directoryChooser.setInitialDirectory(new File(dBmanger.getPath()));
//            Stage stage = new Stage();
//            File file = directoryChooser.showDialog(stage);
//
//            if (file != null) {
//                dBmanger.generateSDK(file);
//            }
        }
    }
}
