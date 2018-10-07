package com.wb.dbtool.javafx;

import com.wb.dbtool.javafx.ctrl.DbDetailController;
import com.wb.dbtool.javafx.ctrl.MainController;
import com.wb.dbtool.javafx.ctrl.TableDetailController;
import com.wb.dbtool.javafx.customview.DBCheckBoxTableCell;
import com.wb.dbtool.javafx.enumeration.FieldType;
import com.wb.dbtool.javafx.manger.DBManager;
import com.wb.dbtool.javafx.manger.ManagerFactory;
import com.wb.dbtool.javafx.po.Module;
import com.wb.dbtool.javafx.po.Field;
import com.wb.dbtool.javafx.po.Table;
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
import javafx.scene.input.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.Callback;
import javafx.util.converter.DefaultStringConverter;
import javafx.util.converter.IntegerStringConverter;

import java.net.URL;
import java.util.Iterator;
import java.util.List;

public class JavaFxApplication extends Application {

    private DBManager dBmanger = ManagerFactory.getdBManager();
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
    private Module currentDB;
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
        URL main = JavaFxApplication.class.getClassLoader().getResource("fxml/main.fxml");
        if (main == null) {
            main = getClass().getResource("../../../fxml/main.fxml");
        }
        mainloader = new FXMLLoader(main);
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

        ContextMenu con = new ContextMenu(new MenuItem("新增"), new MenuItem("删除"), new MenuItem("向上调整"), new MenuItem("向下调整"));
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
                        case "向上调整":
                            if (index > 0) {
                                fields.add(index - 1, fields.get(index));
                                fields.add(index + 1, fields.get(index));
                                fields.remove(index);
                                fields.remove(index + 1);
                            }
                            break;
                        case "向下调整":
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
        db_right_menu = new ContextMenu(new MenuItem("新建库"), new MenuItem("删除库"), new MenuItem("新建表"), new MenuItem("向上调整"), new MenuItem("向下调整"));
        table_right_menu = new ContextMenu(new MenuItem("新建表"), new MenuItem("删除表"));
        all_right_menu.setOnAction(xEventHandler);
        db_right_menu.setOnAction(xEventHandler);
        table_right_menu.setOnAction(xEventHandler);

        URL dbdetail = JavaFxApplication.class.getClassLoader().getResource("fxml/dbdetail.fxml");
        if (dbdetail == null) {
            dbdetail = getClass().getResource("../../../fxml/dbdetail.fxml");
        }
        dbdetailloader = new FXMLLoader(dbdetail);
        dbdetailloader.load();
        dbDetailController = dbdetailloader.getController();


        URL tabledetail = JavaFxApplication.class.getClassLoader().getResource("fxml/tabledetail.fxml");
        if (tabledetail == null) {
            tabledetail = getClass().getResource("../../../fxml/tabledetail.fxml");
        }
        tabledetailloader = new FXMLLoader(tabledetail);
        tabledetailloader.load();
        tableDetailController = tabledetailloader.getController();

        dbtree.setRoot(new TreeItem());
        dbtree.setShowRoot(false);
        dbtree.setEditable(true);
        dbtree.setDisable(false);
        dbtree.setCellFactory(new Callback<TreeView, TreeCell>() {
            @Override
            public TreeCell call(TreeView param) {
                TextFieldTreeCell textFieldTreeCell = new TextFieldTreeCell(new DefaultStringConverter());
                // creating cell from deafult factory
                TreeCell treeCell = textFieldTreeCell.forTreeView().call(param);
                // setting handlers
                textFieldTreeCell.setOnDragDetected(new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent event) {
                        TreeItem treeItem = (TreeItem) dbtree.getSelectionModel().getSelectedItem();
                        TreeItem parent = treeItem.getParent();
                        if (parent != null) {
                            System.out.println("库名:" + parent.getValue());
                            currentDB = dBmanger.findDBByDBName((String) parent.getValue());
                        }
                        TreeCell source = (TreeCell<String>) event.getSource();
                        Dragboard db = source.startDragAndDrop(TransferMode.ANY);
                        ClipboardContent content = new ClipboardContent();
                        content.putString((String) source.getItem());
                        db.setContent(content);
//                        System.out.println("Dragging: " + db.getString());
                        event.consume();
                    }
                });
                textFieldTreeCell.setOnDragOver(new EventHandler<DragEvent>() {
                    @Override
                    public void handle(DragEvent event) {
                        Dragboard db = event.getDragboard();

                        if (db.hasString()) {
                            double y = event.getY();
                            double height = textFieldTreeCell.getHeight();

                            if (y >= height / 4 && y < height * 3 / 4) {
                                event.acceptTransferModes(TransferMode.MOVE);
                            } else {
                                event.acceptTransferModes(TransferMode.COPY);
                            }
                        }
//                        System.out.println("DragOver: " + db.getString());
                        event.consume();
                    }
                });
                textFieldTreeCell.setOnDragDropped(new EventHandler<DragEvent>() {
                    @Override
                    public void handle(DragEvent event) {
                        Dragboard db = event.getDragboard();
                        String m1 = db.getString();

                        TreeCell source = (TreeCell<String>) event.getSource();
                        String m2 = ((TreeCell<String>) event.getGestureTarget()).getItem();

                        if (currentDB != null) {
                            int i1 = 0, i2 = 0;
                            Table t1 = null, t2 = null;
                            for (int i = 0; i < currentDB.getTables().size(); i++) {
                                if (currentDB.getTables().get(i).getTableName().equals(m1)) {
                                    i1 = i;
                                    t1 = currentDB.getTables().get(i);
                                }
                                if (currentDB.getTables().get(i).getTableName().equals(m2)) {
                                    i2 = i;
                                    t2 = currentDB.getTables().get(i);
                                }
                            }
                            if (t1 == null || t2 == null) {
                                return;
                            }


                            if (event.getTransferMode().equals(TransferMode.COPY)) {//插入
                                double y = event.getY();
                                double height = textFieldTreeCell.getHeight();
                                if (y < height / 2) {
                                    currentDB.getTables().add(i2, t1);
                                } else {
                                    currentDB.getTables().add(i2 + 1, t1);
                                }
                                if (i1 < i2) {
                                    currentDB.getTables().remove(i1);
                                } else {
                                    currentDB.getTables().remove(i1 + 1);
                                }

                            } else if (event.getTransferMode().equals(TransferMode.MOVE)) {//交换
                                currentDB.getTables().add(i1, t2);
                                currentDB.getTables().remove(i1 + 1);
                                currentDB.getTables().add(i2, t1);
                                currentDB.getTables().remove(i2 + 1);
                            }

                            loadingDBTree(dBmanger.getDbs());
                        }

//                        boolean success = false;
//                        if (db.hasString()
//                                && !targetNode.equalsIgnoreCase((String)source.getItem())) {
//                            System.out.println("Dropped on: " + targetNode);
//                            success = true;
//                        }
                        event.setDropCompleted(true);
                        event.consume();
                    }
                });
                return textFieldTreeCell;
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
        for (Module db : dBmanger.getDbs()) {
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

    private void removeSysFields(Module db) {
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
        is_deleted.setDefaultValue("0");
        is_deleted.setFieldType(FieldType.Boolean);
        is_deleted.setFieldLenght(1);
        is_deleted.setFieldComment("是否已删除");

        Field created_by = new Field("CREATE_BY");
        created_by.setIsSystem(true);
        created_by.setIsMust(true);
        created_by.setFieldType(FieldType.Long);
        created_by.setFieldLenght(19);
        created_by.setFieldComment("创建用户");

        Field creation_time = new Field("CREATE_TIME");
        creation_time.setIsSystem(true);
        creation_time.setIsMust(true);
        creation_time.setDefaultValue("NULL");
        creation_time.setFieldType(FieldType.Date);
        creation_time.setFieldComment("创建时间");

        Field last_updated_by = new Field("LAST_UPDATE_BY");
        last_updated_by.setIsSystem(true);
        creation_time.setDefaultValue("NULL");
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
        for (Module db : dBmanger.getDbs()) {
            db.getTables().forEach(this::insertSysFields);
        }
    }

    private void bitchInsertSysFields(Module db) {
        db.setHasSysFields(true);
        db.getTables().forEach(this::insertSysFields);
    }

    private void addField() {
        if (currentTable != null && feilds != null) {
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

    private void loadingDBTree(List<Module> dbs) {
        int selectedIndex = dbtree.getSelectionModel().getSelectedIndex();
        int focusedIndex = dbtree.getFocusModel().getFocusedIndex();
        TreeItem root = dbtree.getRoot();
        root.getChildren().clear();
        for (Module db : dbs) {
            TreeItem<String> treeItem = new TreeItem<>(db.getDbName());
            treeItem.setExpanded(db.isExpanded());
            treeItem.expandedProperty().addListener(new ChangeListener<Boolean>() {
                @Override
                public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                    db.setIsExpanded(newValue);
                }
            });
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
                TreeItem targetItem = null;
                targetItem = (TreeItem) dbtree.getFocusModel().getFocusedItem();
                if (targetItem == null) {
                    targetItem = (TreeItem) dbtree.getSelectionModel().getSelectedItem();
                }

                if (targetItem != null) {
                    int level = getLevel(targetItem);
                    if (level == -1) {
                        dbtree.setContextMenu(all_right_menu);
                    } else if (level == 0) {
                        dbtree.setContextMenu(db_right_menu);
                    } else if (level == 1) {
                        dbtree.setContextMenu(table_right_menu);
                    }
                } else {
                    dbtree.setContextMenu(all_right_menu);
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
                    Module db = dBmanger.findDBByDBName((String) treeItem.getValue());
                    currentDB = db;

                    loadingDb();
                }
                break;
                case 1: {//查看表对象
                    TreeItem parent = treeItem.getParent();
                    Module db = dBmanger.findDBByDBName((String) parent.getValue());
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
        if (feilds != null && feilds.getItems() != null) {
            feilds.getItems().clear();
        }
    }

    /**
     * 加载表信息
     */
    private void loadingTable() {
        if (currentDB != null) {
            addSysFields.setSelected(currentDB.isHasSysFields());
        } else if (currentTable != null && currentTable.getdBhandle() != null) {
            addSysFields.setSelected(currentTable.getdBhandle().isHasSysFields());
        }
        GridPane gridPane = tabledetailloader.getRoot();
        if (currentTable != null) {
            tableDetailController.getTablename().setText(currentTable.getTableName());
            tableDetailController.getTablecomment().setText(currentTable.getTableComment());
            tableDetailController.getCreate().setSelected(currentTable.getCreate());
            tableDetailController.getDelete().setSelected(currentTable.getDelete());
            tableDetailController.getUpdate().setSelected(currentTable.getUpdate());
            tableDetailController.getFind().setSelected(currentTable.getFind());
            tableDetailController.getGet().setSelected(currentTable.getGet());
            tableDetailController.getSearch().setSelected(currentTable.getSearch());
            tableDetailController.getGetAll().setSelected(currentTable.getGetAll());

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
        tableDetailController.getCreate().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                currentTable.setCreate(newValue);
            }
        });
        tableDetailController.getDelete().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                currentTable.setDelete(newValue);
            }
        });
        tableDetailController.getUpdate().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                currentTable.setUpdate(newValue);
            }
        });
        tableDetailController.getFind().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                currentTable.setFind(newValue);
            }
        });
        tableDetailController.getGet().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                currentTable.setGet(newValue);
            }
        });
        tableDetailController.getSearch().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                currentTable.setSearch(newValue);
            }
        });
        tableDetailController.getGetAll().selectedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                currentTable.setGetAll(newValue);
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

                        String newValue = (String) event.getNewValue();
                        field.setFieldName(newValue);
                        if (newValue.endsWith("_ID")) {
                            field.setFieldType(FieldType.Long);
                            loadingTable();
                        }
                    }
                });

                TextFieldTableCell textFieldTableCell = new TextFieldTableCell(new DefaultStringConverter()) {

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

                textFieldTableCell.setOnDragDetected(new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent event) {
                        TableCell source = (TableCell) event.getSource();
                        Dragboard db = source.startDragAndDrop(TransferMode.ANY);
                        ClipboardContent content = new ClipboardContent();
                        content.putString((String) source.getItem());
                        db.setContent(content);
//                        System.out.println("Dragging: " + db.getString());
                        event.consume();
                    }
                });
                textFieldTableCell.setOnDragOver(new EventHandler<DragEvent>() {
                    @Override
                    public void handle(DragEvent event) {
                        Dragboard db = event.getDragboard();

                        if (db.hasString()) {
                            double y = event.getY();
                            double height = textFieldTableCell.getHeight();

                            if (y >= height / 4 && y < height * 3 / 4) {
                                event.acceptTransferModes(TransferMode.MOVE);
                            } else {
                                event.acceptTransferModes(TransferMode.COPY);
                            }
                        }

//                        System.out.println("DragOver: " + db.getString());
                        event.consume();
                    }
                });
                textFieldTableCell.setOnDragDropped(new EventHandler<DragEvent>() {
                    @Override
                    public void handle(DragEvent event) {
                        Dragboard db = event.getDragboard();
                        String f1 = db.getString();

                        TableCell source = (TableCell) event.getSource();
                        String f2 = ((TableCell) event.getGestureTarget()).getText();

                        if (currentTable != null) {
                            int i1 = 0, i2 = 0;
                            Field t1 = null, t2 = null;
                            for (int i = 0; i < currentTable.getFields().size(); i++) {
                                if (currentTable.getFields().get(i).getFieldName().equals(f1)) {
                                    i1 = i;
                                    t1 = currentTable.getFields().get(i);
                                }
                                if (currentTable.getFields().get(i).getFieldName().equals(f2)) {
                                    i2 = i;
                                    t2 = currentTable.getFields().get(i);
                                }
                            }

                            if (event.getTransferMode().equals(TransferMode.COPY)) {//插入
                                double y = event.getY();
                                double height = textFieldTableCell.getHeight();

                                if (y < height / 2) {
                                    currentTable.getFields().add(i2, t1);
                                } else {
                                    currentTable.getFields().add(i2 + 1, t1);
                                }
                                if (i1 < i2) {
                                    currentTable.getFields().remove(i1);
                                } else {
                                    currentTable.getFields().remove(i1 + 1);
                                }

                            } else if (event.getTransferMode().equals(TransferMode.MOVE)) {//交换
                                currentTable.getFields().add(i1, t2);
                                currentTable.getFields().remove(i1 + 1);
                                currentTable.getFields().add(i2, t1);
                                currentTable.getFields().remove(i2 + 1);
                            }
                            loadingTable();
                        }
                        event.setDropCompleted(true);
                        event.consume();
                    }
                });
                return textFieldTableCell;
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
                                if (fieldType.isFix() && fieldType.getDefaultLength() != field.getFieldLenght()) {
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
        columns.get(7).setCellValueFactory(new PropertyValueFactory("isSearch"));
        columns.get(7).setCellFactory(new Callback<TableColumn, TableCell>() {
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
                        if (fields.get(param).getIsSearch()) {
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
                        field.setIsSearch(newValue);
                    }
                });
                return checkBoxTableCell;
            }
        });
        columns.get(8).setCellValueFactory(new PropertyValueFactory("fieldComment"));
        columns.get(8).setCellFactory(new Callback<TableColumn, TableCell>() {
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
                    Module db = dBmanger.findDBByDBName((String) event.getOldValue());
                    db.setDbName((String) event.getNewValue());
                    loadingDb();
                }
                break;
                case 1: {//编辑表对象
                    TreeItem parent = treeItem.getParent();
                    Module db = dBmanger.findDBByDBName((String) parent.getValue());
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
            TreeItem targetItem = null;
            int index = -1;
            targetItem = (TreeItem) dbtree.getFocusModel().getFocusedItem();
            index = dbtree.getFocusModel().getFocusedIndex();
            if (targetItem == null) {
                targetItem = (TreeItem) dbtree.getSelectionModel().getSelectedItem();
            }
            if (index == -1) {
                index = dbtree.getSelectionModel().getSelectedIndex();
            }
            if (text != null && targetItem != null) {
                switch (text) {

                    case "向上调整":
                        if (index > 0) {
                            List<Module> dbs = dBmanger.getDbs();
                            dbs.add(index - 1, dbs.get(index));
                            dbs.add(index + 1, dbs.get(index));
                            dbs.remove(index);
                            dbs.remove(index + 1);
                            invalidateLeft();
                        }
                        break;
                    case "向下调整":
                        List<Module> dbs = dBmanger.getDbs();
                        if (index < dbs.size() - 1) {
                            dbs.add(index, dbs.get(index + 1));
                            dbs.add(index + 2, dbs.get(index + 1));
                            dbs.remove(index + 1);
                            dbs.remove(index + 2);
                            invalidateLeft();
                        }
                        break;
                    case "新建库":
                        root.getChildren().add(new TreeItem<>(dBmanger.getNewDBName()));
                        break;
                    case "删除库":
                        if (targetItem != null && targetItem.getParent() == root) {
                            boolean b = dBmanger.removeDBByDBName((String) targetItem.getValue());
                            if (b) {
                                System.out.println("删除库" + targetItem.getValue() + "成功!");
                                invalidateLeft();
                            }
                        }
                        break;
                    case "新建表":
                        int level = 0;
                        if (targetItem != null && targetItem.getParent() == root) {
                            level = 0;
                        } else if (targetItem != null && targetItem.getParent().getParent() == root) {
                            level = 1;
                        }
                        System.out.println("当前右击对象：" + targetItem.getValue());
                        switch (level) {
                            case 0: {//对库对象右击
                                System.out.println("库名:" + targetItem.getValue());
                                Module db = dBmanger.findDBByDBName((String) targetItem.getValue());
                                Table newTableName = dBmanger.getNewTableName(db);
                                if (addSysFields.isSelected()) {
                                    insertSysFields(newTableName);
                                }
                                targetItem.getChildren().add(new TreeItem<>(newTableName.getTableName()));
                            }
                            break;
                            case 1: {//对表对象右击
                                TreeItem parent = targetItem.getParent();
                                System.out.println("库名:" + parent.getValue());
                                Module db = dBmanger.findDBByDBName((String) parent.getValue());
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
                        if (targetItem != null && targetItem.getParent() == root) {
                            level = 0;
                        } else if (targetItem != null && targetItem.getParent().getParent() == root) {
                            level = 1;
                        }
                        System.out.println("当前右击对象：" + targetItem.getValue());
                        switch (level) {
                            case 0: {//对库对象右击
                                System.out.println("库名:" + targetItem.getValue());
                                Module db = dBmanger.findDBByDBName((String) targetItem.getValue());
                                Table newTableName = dBmanger.getNewTableName(db);
                                if (addSysFields.isSelected()) {
                                    insertSysFields(newTableName);
                                }
                                targetItem.getChildren().add(new TreeItem<>(newTableName.getTableName()));
                            }
                            break;
                            case 1: {//对表对象右击
                                TreeItem parent = targetItem.getParent();
                                System.out.println("库名:" + parent.getValue());
                                Module db = dBmanger.findDBByDBName((String) parent.getValue());

                                for (Table table : db.getTables()) {
                                    if (table.getTableName().equals(targetItem.getValue())) {
                                        db.getTables().remove(table);
                                        System.out.println("移除'" + targetItem.getValue() + "'表成功!");
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
            } else if (text != null && targetItem == null) {
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

    private void updateDbTree(List<Module> dbs) {
        TreeItem root = dbtree.getRoot();
        for (Module db : dbs) {
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
