package xyz.wbsite.dbtool.javafx.ctrl;

import javafx.fxml.FXML;
import javafx.scene.control.CheckBox;
import javafx.scene.control.TextField;

public class TableDetailController {

    @FXML
    private TextField tablename;
    @FXML
    private TextField tablecomment;

    @FXML
    private CheckBox create;
    @FXML
    private CheckBox delete;
    @FXML
    private CheckBox update;
    @FXML
    private CheckBox find;
    @FXML
    private CheckBox get;
    @FXML
    private CheckBox search;
    @FXML
    private CheckBox getAll;

    public CheckBox getCreate() {
        return create;
    }

    public void setCreate(CheckBox create) {
        this.create = create;
    }

    public CheckBox getDelete() {
        return delete;
    }

    public void setDelete(CheckBox delete) {
        this.delete = delete;
    }

    public CheckBox getUpdate() {
        return update;
    }

    public void setUpdate(CheckBox update) {
        this.update = update;
    }

    public CheckBox getFind() {
        return find;
    }

    public void setFind(CheckBox find) {
        this.find = find;
    }

    public CheckBox getGet() {
        return get;
    }

    public void setGet(CheckBox get) {
        this.get = get;
    }

    public CheckBox getSearch() {
        return search;
    }

    public void setSearch(CheckBox search) {
        this.search = search;
    }

    public CheckBox getGetAll() {
        return getAll;
    }

    public void setGetAll(CheckBox getAll) {
        this.getAll = getAll;
    }

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
