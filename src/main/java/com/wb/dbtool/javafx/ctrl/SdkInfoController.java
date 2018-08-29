package com.wb.dbtool.javafx.ctrl;

import com.wb.dbtool.javafx.customview.DBCheckBoxTableCell;
import com.wb.dbtool.javafx.po.Api;
import com.wb.dbtool.javafx.po.Field;
import com.wb.dbtool.javafx.tool.Dialog;
import com.wb.dbtool.javafx.tool.Tool;
import com.wb.dbtool.web.framework.utils.MapperUtil;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.util.Callback;
import javafx.util.converter.DefaultStringConverter;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class SdkInfoController {

    @FXML
    private TextField modulePath;
    @FXML
    private TextField sdkPath;
    @FXML
    private Button start;
    @FXML
    private Button cancel;
    @FXML
    private TableView apis;
    @FXML
    private List<Api> data = new ArrayList<>();

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

    public TableView getApis() {
        return apis;
    }

    public void setApis(TableView apis) {
        this.apis = apis;
    }

    public void load() {
        File moduleFile = new File(modulePath.getText());
        String module = moduleFile.getName();

        if (moduleFile.exists()) {
            data.clear();
            File reqs = new File(moduleFile.getAbsolutePath() + File.separator + "req");

            if (!reqs.exists()) {
                return;
            }

            Dialog.showProgress("扫描API...");
            for (File req : reqs.listFiles()) {
                Api api = new Api();
                api.setReq(req);
                api.setReqName(req.getName().replace(".java",""));

                //找response
                File rsp = new File(moduleFile.getAbsolutePath() + File.separator + "rsp" + File.separator + req.getName().replace("Request", "Response"));
                if (rsp.exists()) {
                    api.setRsp(rsp);
                    api.setRspName(rsp.getName().replace(".java", ""));
                }

                api.setMethod("api." + module + "." + Tool.camelToPoint(req.getName().replaceAll("Request\\.java", "")));
                System.out.println(MapperUtil.toJson(api));

                if (api.getRsp()!=null && api.getRsp().exists()){
                    api.setCheck(true);
                }

                data.add(api);
                initData();
            }
            Dialog.stopPopup();
        }
    }

    public void initData() {
        apis.setEditable(true);
        apis.setSortPolicy(new Callback<TableView, Boolean>() {
            @Override
            public Boolean call(TableView param) {
                //禁止点击列头排序
                return false;
            }
        });
        ObservableList<TableColumn> columns = apis.getColumns();
        columns.get(0).setCellValueFactory(new PropertyValueFactory("isQuery"));
        columns.get(0).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                final DBCheckBoxTableCell checkBoxTableCell = new DBCheckBoxTableCell();
                DBCheckBoxTableCell.sCallback sCallback = checkBoxTableCell.new sCallback() {
                    @Override
                    public ObservableValue<Boolean> call(Integer param) {
                        super.call(param);
                        if (data.get(param).isCheck()) {
                            checkBoxTableCell.setInvalid(true);
                        } else {
                            checkBoxTableCell.setInvalid(false);
                        }
                        if (data.get(param).isCheck()) {
                            return new SimpleBooleanProperty(true);
                        } else {
                            return new SimpleBooleanProperty(false);
                        }
                    }
                };
                checkBoxTableCell.setSelectedStateCallback(sCallback);
                checkBoxTableCell.setOnChangeListener(new ChangeListener<Boolean>() {
                    @Override
                    public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                        int param1 = checkBoxTableCell.getParam();
                        Api api = data.get(param1);
                        api.setCheck(newValue);
                    }
                });
                return checkBoxTableCell;
            }
        });
        columns.get(1).setCellValueFactory(new PropertyValueFactory("reqName"));
        columns.get(1).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Api api = data.get(row);
                        api.setReqName((String) event.getNewValue());
                    }
                });
                return new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                    }
                };
            }
        });
        columns.get(2).setCellValueFactory(new PropertyValueFactory("rspName"));
        columns.get(2).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Api api = data.get(row);
                        api.setReqName((String) event.getNewValue());
                    }
                });
                return new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                    }
                };
            }
        });
        columns.get(3).setCellValueFactory(new PropertyValueFactory("method"));
        columns.get(3).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Api api = data.get(row);
                        api.setReqName((String) event.getNewValue());
                    }
                });
                return new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                    }
                };
            }
        });

        ObservableList<Api> ObservableList = FXCollections.observableArrayList();
        ObservableList.addAll(data);
        apis.setItems(ObservableList);
    }
}
