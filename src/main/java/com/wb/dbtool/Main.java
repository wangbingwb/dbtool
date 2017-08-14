package com.wb.dbtool;

import com.wb.dbtool.ctrl.DbDetailController;
import com.wb.dbtool.ctrl.MainController;
import com.wb.dbtool.ctrl.TableDetailController;
import com.wb.dbtool.customview.DBCheckBoxTableCell;
import com.wb.dbtool.enumeration.FieldType;
import com.wb.dbtool.manger.DBManager;
import com.wb.dbtool.po.DB;
import com.wb.dbtool.po.Field;
import com.wb.dbtool.po.Table;
import com.wb.dbtool.manger.ManagerFactory;
import javafx.application.Application;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.ChoiceBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.control.cell.TextFieldTreeCell;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.Callback;
import javafx.util.converter.DefaultStringConverter;
import javafx.util.converter.IntegerStringConverter;

import java.util.Iterator;
import java.util.List;

public class Main extends Application {

    private DBManager dBmanger = ManagerFactory.getdBManger();
    private TreeView dbtree = null;
    private Pane detail = null;
    private TableView feilds = null;
    private Button add = null;
    private Button sub = null;
    private CheckBox addSysFields = null;
    private MEventHandler mEventHandler = new MEventHandler();
    private FXMLLoader mainloader;
    private FXMLLoader dbdetailloader;
    private FXMLLoader tabledetailloader;
    private MainController mainController;
    private DbDetailController dbDetailController;
    private TableDetailController tableDetailController;
    private DB currentDB;
    private Table currentTable;
    private ContextMenu all_right_menu;
    private ContextMenu db_right_menu;
    private ContextMenu table_right_menu;
    private XEventHandler xEventHandler = new XEventHandler();

    @Override
    public void start(Stage primaryStage) throws Exception {

        BorderPane root = mainloader.getRoot();

        invalidateLeft();

        primaryStage.setTitle("DBtool");
        primaryStage.setScene(new Scene(root, 700, 500));
        primaryStage.show();

        primaryStage.setOnCloseRequest(new EventHandler<WindowEvent>() {
            @Override
            public void handle(WindowEvent event) {
                primaryStage.close();
                System.exit(0);
            }
        });

    }

    @Override
    public void init() throws Exception {

        mainloader = new FXMLLoader(getClass().getResource("../../../fxml/main.fxml"));
        mainloader.load();
        mainController = mainloader.getController();
        mainController.setMain(this);
        dbtree = mainController.getDbtree();
        detail = mainController.getDetail();
        feilds = mainController.getFeilds();
        feilds.setEditable(true);
        feilds.setSortPolicy(new Callback<TableView, Boolean>() {
            @Override
            public Boolean call(TableView param) {
                //禁止点击列头排序
                return false;
            }
        });
        add = mainController.getAdd();
        add.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                addField();
            }
        });
        sub = mainController.getSub();
        sub.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                subField();
            }
        });

        addSysFields = mainController.getAddSysFields();
        addSysFields.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                checkSysFields();
            }
        });

        ContextMenu con = new ContextMenu(new MenuItem("新增"), new MenuItem("删除"), new MenuItem("调整↑"), new MenuItem("调整↓"));
        con.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                MenuItem target = (MenuItem) event.getTarget();
                int index = feilds.getSelectionModel().getSelectedIndex();
                List<Field> fields = currentTable.getFields();

                if ("新增".equals(target.getText())) {
                    addField();
                }

                if (index != -1) {
                    switch (target.getText()) {
                        case "删除":
                            subField();
                            break;
                        case "调整↑":
                            if (index > 0) {
                                fields.add(index - 1, fields.get(index));
                                fields.add(index + 1, fields.get(index));
                                fields.remove(index);
                                fields.remove(index + 1);
                            }
                            break;
                        case "调整↓":
                            if (index < fields.size() - 1) {
                                fields.add(index, fields.get(index + 1));
                                fields.add(index + 2, fields.get(index + 1));
                                fields.remove(index + 1);
                                fields.remove(index + 2);
                            }
                            break;
                    }
                    loadingTable();
                    feilds.getSelectionModel().clearSelection();
                }
            }
        });
        feilds.setContextMenu(con);

        all_right_menu = new ContextMenu(new MenuItem("新建库"), new MenuItem("删除库"), new MenuItem("新建表"), new MenuItem("删除表"));
        db_right_menu = new ContextMenu(new MenuItem("新建库"), new MenuItem("删除库"));
        table_right_menu = new ContextMenu(new MenuItem("新建表"), new MenuItem("删除表"));
        all_right_menu.setOnAction(xEventHandler);
        db_right_menu.setOnAction(xEventHandler);
        table_right_menu.setOnAction(xEventHandler);

        dbdetailloader = new FXMLLoader(getClass().getResource("../../../fxml/dbdetail.fxml"));
        dbdetailloader.load();
        dbDetailController = dbdetailloader.getController();
        tabledetailloader = new FXMLLoader(getClass().getResource("../../../fxml/tabledetail.fxml"));
        tabledetailloader.load();
        tableDetailController = tabledetailloader.getController();

        dbtree.setRoot(new TreeItem());
        dbtree.setShowRoot(false);
        dbtree.setEditable(true);
        dbtree.setDisable(false);
        dbtree.setCellFactory(new Callback<TreeView, TreeCell>() {
            @Override
            public TreeCell call(TreeView param) {
                return new TextFieldTreeCell(new DefaultStringConverter());
            }
        });
        dbtree.setOnEditCommit(new YEventHandler());
        dbtree.addEventHandler(MouseEvent.MOUSE_CLICKED, new MEventHandler());

        ManagerFactory.getReflashManager(this).start();

        checkSysFields();
        super.init();
    }

    private void checkSysFields() {
        if (currentDB != null) {
            boolean selected = addSysFields.isSelected();
            removeSysFields(currentDB);
            if (selected) {
                bitchInsertSysFields(currentDB);
            }
            loadingTable();
        }
    }

    private void removeSysFields() {
        for (DB db : dBmanger.getDbs()) {
            for (Table table : db.getTables()) {
                Iterator<Field> iterator = table.getFields().iterator();
                while (iterator.hasNext()) {
                    Field next = iterator.next();
                    if (next.getIsSystem()) {
                        iterator.remove();
                    }
                }
            }
        }
    }

    private void removeSysFields(DB db) {
        db.setHasSysFields(false);
        for (Table table : db.getTables()) {
            Iterator<Field> iterator = table.getFields().iterator();
            while (iterator.hasNext()) {
                Field next = iterator.next();
                if (next.getIsSystem()) {
                    iterator.remove();
                }
            }
        }
    }

    private void insertSysFields(Table table) {
        Field id = new Field("ID");
        id.setIsSystem(true);
        id.setIsMust(true);
        id.setIsPrimaryKey(true);
        id.setFieldType(FieldType.Long);
        id.setFieldLenght(19);
        id.setFieldComment("主键");

        Field row_version = new Field("ROW_VERSION");
        row_version.setIsSystem(true);
        row_version.setIsMust(true);
        row_version.setFieldType(FieldType.Long);
        row_version.setFieldLenght(19);
        row_version.setFieldComment("行版本");

        Field is_deleted = new Field("IS_DELETED");
        is_deleted.setIsSystem(true);
        is_deleted.setIsMust(true);
        is_deleted.setFieldType(FieldType.Boolean);
        is_deleted.setFieldLenght(1);
        is_deleted.setFieldComment("是否已删除");

        Field created_by = new Field("CREATED_BY");
        created_by.setIsSystem(true);
        created_by.setIsMust(true);
        created_by.setFieldType(FieldType.Long);
        created_by.setFieldLenght(19);
        created_by.setFieldComment("创建用户");

        Field creation_time = new Field("CREATION_TIME");
        creation_time.setIsSystem(true);
        creation_time.setIsMust(true);
        creation_time.setFieldType(FieldType.Date);
        creation_time.setFieldComment("创建时间");

        Field last_updated_by = new Field("LAST_UPDATED_BY");
        last_updated_by.setIsSystem(true);
        last_updated_by.setFieldType(FieldType.Long);
        last_updated_by.setFieldLenght(19);
        last_updated_by.setFieldComment("最后更新用户");

        Field last_update_time = new Field("LAST_UPDATE_TIME");
        last_update_time.setIsSystem(true);
        last_update_time.setFieldType(FieldType.Date);
        last_update_time.setFieldComment("最后更新时间");

        table.putFirstField(id);
        table.putField(row_version);
        table.putField(is_deleted);
        table.putField(created_by);
        table.putField(creation_time);
        table.putField(last_updated_by);
        table.putField(last_update_time);
    }

    private void bitchInsertSysFields() {
        for (DB db : dBmanger.getDbs()) {
            db.getTables().forEach(this::insertSysFields);
        }
    }

    private void bitchInsertSysFields(DB db) {
        db.setHasSysFields(true);
        db.getTables().forEach(this::insertSysFields);
    }

    private void addField() {
        if (currentTable != null) {
            List<Field> fields = currentTable.getFields();
            String fieldName = dBmanger.getNewFieldName(fields);
            System.out.println("新增字段-" + fieldName + "成功!");
            feilds.getSelectionModel().select(fields.size() - 1);
            loadingTable();
        }
    }

    private void subField() {
        if (currentTable != null) {
            int selectedIndex = feilds.getSelectionModel().getSelectedIndex();
            if (selectedIndex > -1 && !currentTable.getFields().get(selectedIndex).getIsSystem()) {
                currentTable.getFields().remove(selectedIndex);
                feilds.getSelectionModel().clearSelection();
                loadingTable();
            }

        }
    }

    public void invalidateLeft() {
        loadingDBTree(dBmanger.getDbs());
    }

    private void loadingDBTree(List<DB> dbs) {
        int selectedIndex = dbtree.getSelectionModel().getSelectedIndex();
        int focusedIndex = dbtree.getFocusModel().getFocusedIndex();
        TreeItem root = dbtree.getRoot();
        root.getChildren().clear();
        for (DB db : dbs) {
            TreeItem<String> treeItem = new TreeItem<>(db.getDbName());
            treeItem.setExpanded(true);
            for (Table table : db.getTables()) {
                TreeItem<String> item = new TreeItem<>(table.getTableName());
                item.setExpanded(true);
                treeItem.getChildren().add(item);
            }
            root.getChildren().add(treeItem);
        }

        dbtree.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                TreeItem treeItem = (TreeItem) dbtree.getFocusModel().getFocusedItem();
                int level = getLevel(treeItem);
                if (level == -1) {
                    dbtree.setContextMenu(db_right_menu);
                } else if (level == 0) {
                    dbtree.setContextMenu(all_right_menu);
                } else if (level == 1) {
                    dbtree.setContextMenu(table_right_menu);
                }
            }
        });

        dbtree.getSelectionModel().select(selectedIndex);
        dbtree.getFocusModel().focus(focusedIndex);
    }

    private int getLevel(TreeItem treeItem) {
        if (treeItem == null)
            return -1;
        TreeItem root = dbtree.getRoot();
        int level = 0;
        if (treeItem.getParent() == null) {
            level = -1;
            return level;
        }
        if (treeItem.getParent() == root) {
            level = 0;
        } else if (treeItem.getParent().getParent() == root) {
            level = 1;
        }
        return level;
    }

    private class MEventHandler implements EventHandler<MouseEvent> {

        @Override
        public void handle(MouseEvent event) {
            TreeItem treeItem = (TreeItem) dbtree.getSelectionModel().getSelectedItem();
            if (treeItem == null)
                return;

            TreeItem root = dbtree.getRoot();

            int level = getLevel(treeItem);

            switch (level) {
                case 0: {//查看库对象
                    DB db = dBmanger.findDBByDBName((String) treeItem.getValue());
                    currentDB = db;

                    loadingDb();
                }
                break;
                case 1: {//查看表对象
                    TreeItem parent = treeItem.getParent();
                    DB db = dBmanger.findDBByDBName((String) parent.getValue());
                    currentTable = dBmanger.findTableByTableName(db, (String) treeItem.getValue());
                    loadingTable();
                    break;
                }
                default:
                    break;
            }

        }
    }

    private void loadingDb() {
        if (currentDB != null) {
            addSysFields.setSelected(currentDB.isHasSysFields());
        }

        GridPane gridPane = dbdetailloader.getRoot();
        dbDetailController.getDbname().setText(currentDB.getDbName());
        dbDetailController.getDbcomment().setText(currentDB.getDbComment());
        dbDetailController.getDbprefix().setText(currentDB.getDbprefix());
        dbDetailController.getBasePackage().setText(currentDB.getBasePackage());
        dbDetailController.getModuleName().setText(currentDB.getModuleName());
        dbDetailController.getAuthor().setText(currentDB.getAuthor());
        dbDetailController.getDbname().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentDB != null) {
                    currentDB.setDbName(newValue);
                    invalidateLeft();
                }
            }
        });
        dbDetailController.getDbcomment().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentDB != null) {
                    currentDB.setDbComment(newValue);
                }
            }
        });
        dbDetailController.getDbprefix().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentDB != null) {
                    currentDB.setDbprefix(newValue);
                }
            }
        });
        dbDetailController.getBasePackage().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentDB != null) {
                    currentDB.setBasePackage(newValue);
                }
            }
        });
        dbDetailController.getModuleName().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentDB != null) {
                    currentDB.setModuleName(newValue);
                }
            }
        });
        dbDetailController.getAuthor().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentDB != null) {
                    currentDB.setAuthor(newValue);
                }
            }
        });

        if (gridPane != null) {
            detail.getChildren().clear();
            detail.getChildren().add(gridPane);
        }
        feilds.getItems().clear();
    }

    /**
     * 加载表信息
     */
    private void loadingTable() {
        if (currentDB != null) {
            addSysFields.setSelected(currentDB.isHasSysFields());
        }else if (currentTable != null && currentTable.getdBhandle()!=null){
            addSysFields.setSelected(currentTable.getdBhandle().isHasSysFields());
        }
        GridPane gridPane = tabledetailloader.getRoot();
        if (currentTable != null) {
            tableDetailController.getTablename().setText(currentTable.getTableName());
            tableDetailController.getTablecomment().setText(currentTable.getTableComment());

        }
        tableDetailController.getTablename().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentTable != null) {
                    currentTable.setTableName(newValue);
                    invalidateLeft();
                }
            }
        });
        tableDetailController.getTablecomment().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentTable != null) {
                    currentTable.setTableComment(newValue);
                }
            }
        });
        if (gridPane != null) {
            detail.getChildren().clear();
            detail.getChildren().add(gridPane);
        }
        ObservableList<TableColumn> columns = feilds.getColumns();
        columns.get(0).setCellValueFactory(new PropertyValueFactory<Field, String>("fieldName"));
        columns.get(0).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {

                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Field field = currentTable.getFields().get(row);
                        field.setFieldName((String) event.getNewValue());
                    }
                });

                return new TextFieldTableCell(new DefaultStringConverter()) {

                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                        if (currentTable != null) {
                            int index = this.getTableRow().getIndex();
                            if (index >= 0 && index <= currentTable.getFields().size() - 1) {
                                Field field = currentTable.getFields().get(index);
                                if (field.getIsSystem()) {
                                    ignoreField(this);
                                    this.setDisable(true);
                                } else {
                                    recoveryField(this);
                                    this.setDisable(false);
                                }
                            }
                        }
                    }
                };
            }
        });

        columns.get(1).setCellValueFactory(new PropertyValueFactory("fieldType"));
        columns.get(1).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                ObservableList<FieldType> objects = FXCollections.observableArrayList();

                Class clz = FieldType.class;
                for (Object obj : clz.getEnumConstants()) {
                    if (obj instanceof FieldType) {
                        objects.add((FieldType) obj);
                    }
                }
                ChoiceBoxTableCell choiceBoxTableCell = new ChoiceBoxTableCell(objects) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                        if (currentTable != null) {
                            int index = this.getTableRow().getIndex();
                            if (index >= 0 && index <= currentTable.getFields().size() - 1) {
                                Field field = currentTable.getFields().get(index);
                                FieldType fieldType = field.getFieldType();
                                if (fieldType.getDefaultLength() != field.getFieldLenght()) {
                                    field.setFieldLenght(fieldType.getDefaultLength());
                                    feilds.refresh();
                                }

                                if (field.getIsSystem()) {
                                    ignoreField(this);
                                    this.setDisable(true);
                                } else {
                                    recoveryField(this);
                                    this.setDisable(false);
                                }
                            }
                        }
                    }
                };

                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Field field = currentTable.getFields().get(row);
                        field.setFieldType((FieldType) event.getNewValue());
                    }
                });
                return choiceBoxTableCell;
            }
        });
        columns.get(2).setCellValueFactory(new PropertyValueFactory("fieldLenght"));
        columns.get(2).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Field field = currentTable.getFields().get(row);
                        try {
                            field.setFieldLenght((Integer) event.getNewValue());
                        } catch (Exception e) {
                            e.printStackTrace();

                        }
                    }
                });
                TextFieldTableCell textFieldTableCell = new TextFieldTableCell(new IntegerStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                        if (currentTable != null) {
                            int index = this.getTableRow().getIndex();
                            if (index >= 0 && index <= currentTable.getFields().size() - 1) {
                                Field field = currentTable.getFields().get(index);
                                if (field.getIsSystem()) {
                                    ignoreField(this);
                                    this.setDisable(true);
                                } else {
                                    recoveryField(this);
                                    this.setDisable(false);
                                }
                            }
                        }
                    }
                };
                return textFieldTableCell;
            }
        });
        columns.get(3).setCellValueFactory(new PropertyValueFactory("defaultValue"));
        columns.get(3).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Field field = currentTable.getFields().get(row);
                        field.setDefaultValue((String) event.getNewValue());
                    }
                });
                return new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                        if (currentTable != null) {
                            int index = this.getTableRow().getIndex();
                            if (index >= 0 && index <= currentTable.getFields().size() - 1) {
                                Field field = currentTable.getFields().get(index);
                                if (field.getIsSystem()) {
                                    ignoreField(this);
                                    this.setDisable(true);
                                } else {
                                    recoveryField(this);
                                    this.setDisable(false);
                                }
                            }
                        }
                    }
                };
            }
        });

        columns.get(4).setCellValueFactory(new PropertyValueFactory("isPrimaryKey"));
        columns.get(4).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                DBCheckBoxTableCell checkBoxTableCell = new DBCheckBoxTableCell();

                DBCheckBoxTableCell.sCallback sCallback = checkBoxTableCell.new sCallback() {
                    @Override
                    public ObservableValue<Boolean> call(Integer param) {
                        super.call(param);
                        List<Field> fields = currentTable.getFields();

                        if (fields.get(param).getIsSystem()) {
                            checkBoxTableCell.setInvalid(true);
                        } else {
                            checkBoxTableCell.setInvalid(false);
                        }
                        if (fields.get(param).getIsPrimaryKey()) {
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
                        Field field = currentTable.getFields().get(param1);
                        field.setIsPrimaryKey(newValue);
                    }
                });
                return checkBoxTableCell;
            }
        });
        columns.get(5).setCellValueFactory(new PropertyValueFactory("isMust"));
        columns.get(5).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                final DBCheckBoxTableCell checkBoxTableCell = new DBCheckBoxTableCell();
                DBCheckBoxTableCell.sCallback sCallback = checkBoxTableCell.new sCallback() {
                    @Override
                    public ObservableValue<Boolean> call(Integer param) {
                        super.call(param);
                        List<Field> fields = currentTable.getFields();
                        if (fields.get(param).getIsSystem()) {
                            checkBoxTableCell.setInvalid(true);
                        } else {
                            checkBoxTableCell.setInvalid(false);
                        }
                        if (fields.get(param).getIsMust()) {
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
                        Field field = currentTable.getFields().get(param1);
                        field.setIsMust(newValue);
                    }
                });
                return checkBoxTableCell;
            }
        });
        columns.get(6).setCellValueFactory(new PropertyValueFactory("isQuery"));
        columns.get(6).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {
                final DBCheckBoxTableCell checkBoxTableCell = new DBCheckBoxTableCell();
                DBCheckBoxTableCell.sCallback sCallback = checkBoxTableCell.new sCallback() {
                    @Override
                    public ObservableValue<Boolean> call(Integer param) {
                        super.call(param);
                        List<Field> fields = currentTable.getFields();
                        if (fields.get(param).getIsSystem()) {
                            checkBoxTableCell.setInvalid(true);
                        } else {
                            checkBoxTableCell.setInvalid(false);
                        }
                        if (fields.get(param).getIsQuery()) {
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
                        Field field = currentTable.getFields().get(param1);
                        field.setIsQuery(newValue);
                    }
                });
                return checkBoxTableCell;
            }
        });
        columns.get(7).setCellValueFactory(new PropertyValueFactory("fieldComment"));
        columns.get(7).setCellFactory(new Callback<TableColumn, TableCell>() {
            @Override
            public TableCell call(TableColumn param) {

                param.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>() {
                    @Override
                    public void handle(TableColumn.CellEditEvent event) {
                        int row = event.getTablePosition().getRow();
                        Field field = currentTable.getFields().get(row);
                        field.setFieldComment((String) event.getNewValue());
                    }
                });
                return new TextFieldTableCell(new DefaultStringConverter()) {
                    @Override
                    public void updateItem(Object item, boolean empty) {
                        super.updateItem(item, empty);
                        if (currentTable != null) {
                            int index = this.getTableRow().getIndex();
                            if (index >= 0 && index <= currentTable.getFields().size() - 1) {
                                Field field = currentTable.getFields().get(index);
                                if (field.getIsSystem()) {
                                    ignoreField(this);
                                    this.setDisable(true);
                                }
                            }
                        }
                    }
                };
            }
        });

        ObservableList<Field> data = null;
        if (currentTable != null) {
            List<Field> fields = currentTable.getFields();
            data = FXCollections.observableArrayList();
            data.addAll(fields);
        }

        feilds.setItems(data);
    }

    void ignoreField(TableCell tableCell) {
        tableCell.setTextFill(Color.gray(0.8));
    }

    void recoveryField(TableCell tableCell) {
        tableCell.setTextFill(Color.BLACK);
    }

    /**
     * 双击目录树编辑处理器
     */
    private class YEventHandler implements EventHandler<TreeView.EditEvent> {

        @Override
        public void handle(TreeView.EditEvent event) {
            TreeItem treeItem = event.getTreeItem();
            TreeItem root = dbtree.getRoot();
            int level = 0;
            if (treeItem.getParent() == root) {
                level = 0;
            } else if (treeItem.getParent().getParent() == root) {
                level = 1;
            }

            System.out.println("原值:" + event.getOldValue());
            System.out.println("现值:" + event.getNewValue());

            switch (level) {
                case 0: {//编辑库对象
                    DB db = dBmanger.findDBByDBName((String) event.getOldValue());
                    db.setDbName((String) event.getNewValue());
                    loadingDb();
                }
                break;
                case 1: {//编辑表对象
                    TreeItem parent = treeItem.getParent();
                    DB db = dBmanger.findDBByDBName((String) parent.getValue());
                    Table table = dBmanger.findTableByTableName(db, (String) event.getOldValue());
                    if (table != null) {
                        table.setTableName((String) event.getNewValue());
                        loadingTable();
                    }
                    break;
                }
                default:
                    break;
            }
        }
    }

    /**
     * 目录树右击菜单处理器
     */
    private class XEventHandler implements EventHandler {

        @Override
        public void handle(Event event) {
            MenuItem target = (MenuItem) event.getTarget();

            String text = target.getText();
            TreeItem root = dbtree.getRoot();
            TreeItem focusedItem = (TreeItem) dbtree.getSelectionModel().getSelectedItem();
            if (text != null && focusedItem != null) {
                switch (text) {

                    case "新建库":
                        root.getChildren().add(new TreeItem<>(dBmanger.getNewDBName()));
                        break;
                    case "删除库":
                        if (focusedItem != null && focusedItem.getParent() == root) {
                            boolean b = dBmanger.removeDBByDBName((String) focusedItem.getValue());
                            if (b) {
                                System.out.println("删除库" + focusedItem.getValue() + "成功!");
                                invalidateLeft();
                            }
                        }
                        break;
                    case "新建表":
                        int level = 0;
                        if (focusedItem != null && focusedItem.getParent() == root) {
                            level = 0;
                        } else if (focusedItem != null && focusedItem.getParent().getParent() == root) {
                            level = 1;
                        }
                        System.out.println("当前右击对象：" + focusedItem.getValue());
                        switch (level) {
                            case 0: {//对库对象右击
                                System.out.println("库名:" + focusedItem.getValue());
                                DB db = dBmanger.findDBByDBName((String) focusedItem.getValue());
                                Table newTableName = dBmanger.getNewTableName(db);
                                if (addSysFields.isSelected()) {
                                    insertSysFields(newTableName);
                                }
                                focusedItem.getChildren().add(new TreeItem<>(newTableName.getTableName()));
                            }
                            break;
                            case 1: {//对表对象右击
                                TreeItem parent = focusedItem.getParent();
                                System.out.println("库名:" + parent.getValue());
                                DB db = dBmanger.findDBByDBName((String) parent.getValue());
                                Table newTableName = dBmanger.getNewTableName(db);
                                if (addSysFields.isSelected()) {
                                    insertSysFields(newTableName);
                                }
                                parent.getChildren().add(new TreeItem<>(newTableName.getTableName()));
                                break;
                            }
                            default:
                                break;
                        }
                        break;
                    case "删除表":
                        level = 0;
                        if (focusedItem != null && focusedItem.getParent() == root) {
                            level = 0;
                        } else if (focusedItem != null && focusedItem.getParent().getParent() == root) {
                            level = 1;
                        }
                        System.out.println("当前右击对象：" + focusedItem.getValue());
                        switch (level) {
                            case 0: {//对库对象右击
                                System.out.println("库名:" + focusedItem.getValue());
                                DB db = dBmanger.findDBByDBName((String) focusedItem.getValue());
                                Table newTableName = dBmanger.getNewTableName(db);
                                if (addSysFields.isSelected()) {
                                    insertSysFields(newTableName);
                                }
                                focusedItem.getChildren().add(new TreeItem<>(newTableName.getTableName()));
                            }
                            break;
                            case 1: {//对表对象右击
                                TreeItem parent = focusedItem.getParent();
                                System.out.println("库名:" + parent.getValue());
                                DB db = dBmanger.findDBByDBName((String) parent.getValue());

                                for (Table table : db.getTables()) {
                                    if (table.getTableName().equals(focusedItem.getValue())) {
                                        db.getTables().remove(table);
                                        System.out.println("移除'" + focusedItem.getValue() + "'表成功!");
                                        break;
                                    }
                                }
                                invalidateLeft();
                                break;
                            }
                            default:
                                break;
                        }
                    default:
                }
            } else if (text != null && focusedItem == null) {
                switch (text) {
                    case "新建库":
                        root.getChildren().add(new TreeItem<>(dBmanger.getNewDBName()));
                        break;
                    default:
                        break;
                }
            }
        }
    }

    private void updateDbTree(List<DB> dbs) {
        TreeItem root = dbtree.getRoot();
        for (DB db : dbs) {
            TreeItem<String> treeItem = new TreeItem<>(db.getDbName());
            treeItem.setExpanded(true);
            for (Table table : db.getTables()) {
                TreeItem<String> tree = new TreeItem<>(table.getTableName());
                treeItem.getChildren().add(tree);
            }
            root.getChildren().add(treeItem);
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}
