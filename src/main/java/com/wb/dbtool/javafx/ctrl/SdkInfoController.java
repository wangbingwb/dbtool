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

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
    private CheckBox All;
    @FXML
    private CheckBox create;
    @FXML
    private CheckBox delete;
    @FXML
    private CheckBox update;
    @FXML
    private CheckBox find;
    @FXML
    private CheckBox search;
    @FXML
    private CheckBox get;
    @FXML
    private CheckBox getAll;
    @FXML
    private TableView apis;
    @FXML
    private List<Api> data = new ArrayList<>();

    public List<Api> getData() {
        return data;
    }

    public CheckBox getSearch() {
        return search;
    }

    public CheckBox getAll() {
        return All;
    }

    public void setAll(CheckBox all) {
        All = all;
    }

    public void setSearch(CheckBox search) {
        this.search = search;
    }

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

    public void setData(List<Api> data) {
        this.data = data;
    }

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

    public CheckBox getGetAll() {
        return getAll;
    }

    public void setGetAll(CheckBox getAll) {
        this.getAll = getAll;
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
                api.setTargetRequest(req.getName().replace(".java", ""));

                //查找依赖ent
                List<String> entities = findEntities(req);
                for (String entity : entities) {
                    api.getDepEnt().add(entity);
                }
                //查找依赖enums
                List<String> enums = findEnums(req);
                for (String anEnum : enums) {
                    api.getDepEnum().add(anEnum);
                }
                //查找依赖req
                List<String> reqss = findReq(req);
                for (String string : reqss) {
                    api.getDepReq().add(string);
                }

                //找response
                File rsp = new File(moduleFile.getAbsolutePath() + File.separator + "rsp" + File.separator + req.getName().replace("Request", "Response"));
                if (rsp.exists()) {
                    api.setRsp(rsp);
                    api.setTargetResponse(rsp.getName().replace(".java", ""));

                    //查找依赖ent
                    List<String> entities_ = findEntities(rsp);
                    for (String entity : entities_) {
                        api.getDepEnt().add(entity);
                    }
                    //查找依赖enums
                    List<String> enums_ = findEnums(rsp);
                    for (String anEnum : enums_) {
                        api.getDepEnum().add(anEnum);
                    }
                    //查找依赖req
                    List<String> reqss_ = findReq(rsp);
                    for (String string : reqss_) {
                        api.getDepReq().add(string);
                    }
                }

                api.setMethod("api." + module + "." + Tool.camelToPoint(req.getName().replaceAll("Request\\.java", "")));

                api.setCheck(true);
                if (api.getRsp() == null || !api.getRsp().exists()) {
                    api.setError("响应不存在");
                    api.setCheck(false);
                }
                for (String s : api.getDepReq()) {
                    File en = new File(moduleFile.getAbsolutePath() + File.separator + "req" + File.separator + s + ".java");
                    if (!en.exists()) {
                        api.setError("依赖的" + s + "(Request)不存在、");
                        api.setCheck(false);
                    }
                }
                for (String s : api.getDepEnt()) {
                    File en = new File(moduleFile.getAbsolutePath() + File.separator + "ent" + File.separator + s + ".java");
                    if (!en.exists()) {
                        api.setError("依赖的" + s + "(Entity)不存在、");
                        api.setCheck(false);
                    }
                }
                for (String s : api.getDepEnum()) {
                    File en = new File(moduleFile.getAbsolutePath() + File.separator + "enums" + File.separator + s + ".java");
                    if (!en.exists()) {
                        api.setError("依赖的" + s + "(Enum)不存在、");
                        api.setCheck(false);
                    }
                }

//                System.out.println(MapperUtil.toJson(api));
                data.add(api);
                initData();
            }
            Dialog.stopPopup();
        }
    }

    public List<String> findEntities(File file) {
        ArrayList<String> strings = new ArrayList<>();
        InputStreamReader read = null;//考虑到编码格式
        try {
            read = new InputStreamReader(new FileInputStream(file), "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(read);
            String line = null;
            while ((line = bufferedReader.readLine()) != null) {
                //指定字符串判断处
                if (line.contains(".ent.")) {
                    Pattern compile = Pattern.compile(".*\\.ent\\.(.*);");

                    Matcher matcher = compile.matcher(line);

                    if (matcher.find()) {
                        String group = matcher.group(1);
                        strings.add(group);
//                        System.out.println(group);
                    }
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return strings;
    }

    public List<String> findEnums(File file) {
        ArrayList<String> strings = new ArrayList<>();
        InputStreamReader read = null;//考虑到编码格式
        try {
            read = new InputStreamReader(new FileInputStream(file), "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(read);
            String line = null;
            while ((line = bufferedReader.readLine()) != null) {
                //指定字符串判断处
                if (line.contains(".enums.")) {
                    Pattern compile = Pattern.compile(".*\\.enums\\.(.*);");

                    Matcher matcher = compile.matcher(line);

                    if (matcher.find()) {
                        String group = matcher.group(1);
                        strings.add(group);
//                        System.out.println(group);
                    }
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return strings;
    }

    public List<String> findReq(File file) {
        ArrayList<String> strings = new ArrayList<>();
        InputStreamReader read = null;//考虑到编码格式
        try {
            read = new InputStreamReader(new FileInputStream(file), "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(read);
            String line = null;
            Pattern compile = Pattern.compile(".*private\\s([a-zA-Z_]*Request)\\s[a-zA-Z_]*Request;.*");


            while ((line = bufferedReader.readLine()) != null) {
                //指定字符串判断处
                if (line.matches(".*private\\s([a-zA-Z_]*Request)\\s[a-zA-Z_]*Request;.*")) {
                    Matcher matcher = compile.matcher(line);

                    if (matcher.find()) {
                        String group = matcher.group(1);

                        strings.add(group);
                        System.out.println(group);
                    }
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return strings;
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
        columns.get(0).setCellValueFactory(new PropertyValueFactory("check"));
        columns.get(0).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                final DBCheckBoxTableCell checkBoxTableCell = new DBCheckBoxTableCell();
                DBCheckBoxTableCell.sCallback sCallback = checkBoxTableCell.new sCallback() {
                    @Override
                    public ObservableValue<Boolean> call(Integer param) {
                        super.call(param);
//                        if (data.get(param).isCheck()) {
//                            checkBoxTableCell.setInvalid(true);
//                        } else {
//                            checkBoxTableCell.setInvalid(false);
//                        }
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
        columns.get(1).setCellValueFactory(new PropertyValueFactory("error"));
        columns.get(1).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
//                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
//                    @Override
//                    public void handle(TableColumn.CellEditEvent event) {
//                        int row = event.getTablePosition().getRow();
//                        Api api = data.get(row);
//                        api.setReqName((String) event.getNewValue());
//                    }
//                });

                TextFieldTableCell textFieldTableCell = new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                    }
                };

                textFieldTableCell.setEditable(false);
                return textFieldTableCell;
            }
        });

        columns.get(2).setCellValueFactory(new PropertyValueFactory("targetRequest"));
        columns.get(2).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
//                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
//                    @Override
//                    public void handle(TableColumn.CellEditEvent event) {
//                        int row = event.getTablePosition().getRow();
//                        Api api = data.get(row);
//                        api.setTargetRequest((String) event.getNewValue());
//                    }
//                });
                TextFieldTableCell textFieldTableCell = new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                    }
                };
                textFieldTableCell.setEditable(false);
                return textFieldTableCell;
            }
        });
        columns.get(3).setCellValueFactory(new PropertyValueFactory("targetResponse"));
        columns.get(3).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
//                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
//                    @Override
//                    public void handle(TableColumn.CellEditEvent event) {
//                        int row = event.getTablePosition().getRow();
//                        Api api = data.get(row);
//                        api.setTargetResponse((String) event.getNewValue());
//                    }
//                });
                TextFieldTableCell textFieldTableCell = new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                    }
                };
                textFieldTableCell.setEditable(false);
                return textFieldTableCell;
            }
        });

        columns.get(4).setCellValueFactory(new PropertyValueFactory("method"));
        columns.get(4).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                TextFieldTableCell textFieldTableCell = new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                    }
                };
                textFieldTableCell.setEditable(false);
                return textFieldTableCell;
            }
        });
        ObservableList<Api> ObservableList = FXCollections.observableArrayList();
        ObservableList.addAll(data);
        apis.setItems(ObservableList);
    }
}
