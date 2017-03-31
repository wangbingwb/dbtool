package com.wb.dbtool.ctrl;

import com.wb.dbtool.enumeration.DataBase;
import com.wb.dbtool.listener.GenerateOptionListener;
import com.wb.dbtool.manger.DBmanger;
import com.wb.dbtool.manger.MangerFactory;
import com.wb.dbtool.tool.Dialog;
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
    private DBmanger dBmanger = MangerFactory.getdBmanger();

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
    public void showFileChooser(ActionEvent actionEvent){
        DirectoryChooser directoryChooser = new DirectoryChooser();
        Stage stage = new Stage();
        File file = directoryChooser.showDialog(stage);

        System.out.println(file.getAbsolutePath());

    }

    @FXML
    public void save(ActionEvent actionEvent){
        if (dBmanger.getPath() == null || "".equals(dBmanger.getPath())){
            DirectoryChooser directoryChooser = new DirectoryChooser();
            Stage stage = new Stage();
            File file = directoryChooser.showDialog(stage);

            dBmanger.setPath(file.getAbsolutePath());
            System.out.println(file.getAbsolutePath());
        }
        dBmanger.save();
        System.out.println("保存成功");
    }

    @FXML
    public void saveAs(ActionEvent actionEvent){
        DirectoryChooser directoryChooser = new DirectoryChooser();
        Stage stage = new Stage();
        File file = directoryChooser.showDialog(stage);

        dBmanger.setPath(file.getAbsolutePath());

        dBmanger.save();
    }

    @FXML
    public void showConnectInfo(ActionEvent actionEvent){
        Dialog.showDBConnectInput();
    }

    @FXML
    public void generate(ActionEvent actionEvent){
        dBmanger.save();
        if (dBmanger.doCheck()){
            DirectoryChooser directoryChooser = new DirectoryChooser();
            directoryChooser.setInitialDirectory(new File(dBmanger.getPath()));
            Stage stage = new Stage();
            File file = directoryChooser.showDialog(stage);

            if (file != null){
                //展示生成方式
                Dialog.showGenerateOption(new GenerateOptionListener() {
                    @Override
                    public void onGenerate(String option,DataBase dataBase) {
                        System.out.println(file.getAbsolutePath());
                        dBmanger.generate(file.getAbsolutePath(),option, dataBase);
                    }
                });
            }
        }
    }
}
