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
    private TreeView mdtree = null;
    private Pane detail = null;
    private TableView feilds = null;
    private Button add = null;
    private Button sub = null;
    private CheckBox addSysFields = null;
    private MEventHandler mEventHandler = new MEventHandler();
    private FXMLLoader mainloader;
    private FXMLLoader mddetailloader;
    private FXMLLoader tabledetailloader;
    private MainController mainController;
    private DbDetailController mdDetailController;
    private TableDetailController tableDetailController;
    private Module currentMD;
    private Table currentTable;
    private ContextMenu all_right_menu;
    private ContextMenu md_right_menu;
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
        mdtree = mainController.getDbtree();
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

        all_right_menu = new ContextMenu(new MenuItem("新增模块"), new MenuItem("删除模块"), new MenuItem("新增对象"), new MenuItem("删除对象"));
        md_right_menu = new ContextMenu(new MenuItem("新增模块"), new MenuItem("删除模块"), new MenuItem("新增对象"), new MenuItem("向上调整"), new MenuItem("向下调整"));
        table_right_menu = new ContextMenu(new MenuItem("新增对象"), new MenuItem("删除对象"));
        all_right_menu.setOnAction(xEventHandler);
        md_right_menu.setOnAction(xEventHandler);
        table_right_menu.setOnAction(xEventHandler);

        URL mddetail = JavaFxApplication.class.getClassLoader().getResource("fxml/dbdetail.fxml");
        if (mddetail == null) {
            mddetail = getClass().getResource("../../../fxml/dbdetail.fxml");
        }
        mddetailloader = new FXMLLoader(mddetail);
        mddetailloader.load();
        mdDetailController = mddetailloader.getController();


        URL tabledetail = JavaFxApplication.class.getClassLoader().getResource("fxml/tabledetail.fxml");
        if (tabledetail == null) {
            tabledetail = getClass().getResource("../../../fxml/tabledetail.fxml");
        }
        tabledetailloader = new FXMLLoader(tabledetail);
        tabledetailloader.load();
        tableDetailController = tabledetailloader.getController();

        mdtree.setRoot(new TreeItem());
        mdtree.setShowRoot(false);
        mdtree.setEditable(true);
        mdtree.setDisable(false);
        mdtree.setCellFactory(new Callback<TreeView, TreeCell>() {
            @Override
            public TreeCell call(TreeView param) {
                TextFieldTreeCell textFieldTreeCell = new TextFieldTreeCell(new DefaultStringConverter());
                // creating cell from deafult factory
                TreeCell treeCell = textFieldTreeCell.forTreeView().call(param);
                // setting handlers
                textFieldTreeCell.setOnDragDetected(new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent event) {
                        TreeItem treeItem = (TreeItem) mdtree.getSelectionModel().getSelectedItem();
                        TreeItem parent = treeItem.getParent();
                        if (parent != null) {
                            System.out.println("库名:" + parent.getValue());
                            currentMD = dBmanger.findDBByDBName((String) parent.getValue());
                        }
                        TreeCell source = (TreeCell<String>) event.getSource();
                        Dragboard md = source.startDragAndDrop(TransferMode.ANY);
                        ClipboardContent content = new ClipboardContent();
                        content.putString((String) source.getItem());
                        md.setContent(content);
//                        System.out.println("Dragging: " + db.getString());
                        event.consume();
                    }
                });
                textFieldTreeCell.setOnDragOver(new EventHandler<DragEvent>() {
                    @Override
                    public void handle(DragEvent event) {
                        Dragboard md = event.getDragboard();

                        if (md.hasString()) {
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
                        Dragboard md = event.getDragboard();
                        String m1 = md.getString();

                        TreeCell source = (TreeCell<String>) event.getSource();
                        String m2 = ((TreeCell<String>) event.getGestureTarget()).getItem();

                        if (currentMD != null) {
                            int i1 = 0, i2 = 0;
                            Table t1 = null, t2 = null;
                            for (int i = 0; i < currentMD.getTables().size(); i++) {
                                if (currentMD.getTables().get(i).getTableName().equals(m1)) {
                                    i1 = i;
                                    t1 = currentMD.getTables().get(i);
                                }
                                if (currentMD.getTables().get(i).getTableName().equals(m2)) {
                                    i2 = i;
                                    t2 = currentMD.getTables().get(i);
                                }
                            }
                            if (t1 == null || t2 == null) {
                                return;
                            }


                            if (event.getTransferMode().equals(TransferMode.COPY)) {//插入
                                double y = event.getY();
                                double height = textFieldTreeCell.getHeight();
                                if (y < height / 2) {
                                    currentMD.getTables().add(i2, t1);
                                } else {
                                    currentMD.getTables().add(i2 + 1, t1);
                                }
                                if (i1 < i2) {
                                    currentMD.getTables().remove(i1);
                                } else {
                                    currentMD.getTables().remove(i1 + 1);
                                }

                            } else if (event.getTransferMode().equals(TransferMode.MOVE)) {//交换
                                currentMD.getTables().add(i1, t2);
                                currentMD.getTables().remove(i1 + 1);
                                currentMD.getTables().add(i2, t1);
                                currentMD.getTables().remove(i2 + 1);
                            }

                            loadingDBTree(dBmanger.getMds());
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
        mdtree.setOnEditCommit(new YEventHandler());
        mdtree.addEventHandler(MouseEvent.MOUSE_CLICKED, new MEventHandler());

        ManagerFactory.getReflashManager(this).start();

        checkSysFields();
        super.init();
    }

    private void checkSysFields() {
        if (currentMD != null) {
            boolean selected = addSysFields.isSelected();
            removeSysFields(currentMD);
            if (selected) {
                bitchInsertSysFields(currentMD);
            }
            loadingTable();
        }
    }

    private void removeSysFields() {
        for (Module md : dBmanger.getMds()) {
            for (Table table : md.getTables()) {
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

    private void removeSysFields(Module md) {
        md.setHasSysFields(false);
        for (Table table : md.getTables()) {
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
        for (Module md : dBmanger.getMds()) {
            md.getTables().forEach(this::insertSysFields);
        }
    }

    private void bitchInsertSysFields(Module md) {
        md.setHasSysFields(true);
        md.getTables().forEach(this::insertSysFields);
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
        loadingDBTree(dBmanger.getMds());
    }

    private void loadingDBTree(List<Module> mds) {
        int selectedIndex = mdtree.getSelectionModel().getSelectedIndex();
        int focusedIndex = mdtree.getFocusModel().getFocusedIndex();
        TreeItem root = mdtree.getRoot();
        root.getChildren().clear();
        for (Module md : mds) {
            TreeItem<String> treeItem = new TreeItem<>(md.getDbName());
            treeItem.setExpanded(md.isExpanded());
            treeItem.expandedProperty().addListener(new ChangeListener<Boolean>() {
                @Override
                public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                    md.setIsExpanded(newValue);
                }
            });
            for (Table table : md.getTables()) {
                TreeItem<String> item = new TreeItem<>(table.getTableName());
                item.setExpanded(true);
                treeItem.getChildren().add(item);
            }
            root.getChildren().add(treeItem);
        }
        mdtree.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                TreeItem targetItem = null;
                targetItem = (TreeItem) mdtree.getFocusModel().getFocusedItem();
                if (targetItem == null) {
                    targetItem = (TreeItem) mdtree.getSelectionModel().getSelectedItem();
                }

                if (targetItem != null) {
                    int level = getLevel(targetItem);
                    if (level == -1) {
                        mdtree.setContextMenu(all_right_menu);
                    } else if (level == 0) {
                        mdtree.setContextMenu(md_right_menu);
                    } else if (level == 1) {
                        mdtree.setContextMenu(table_right_menu);
                    }
                } else {
                    mdtree.setContextMenu(all_right_menu);
                }
            }
        });

        mdtree.getSelectionModel().select(selectedIndex);
        mdtree.getFocusModel().focus(focusedIndex);
    }

    private int getLevel(TreeItem treeItem) {
        if (treeItem == null)
            return -1;
        TreeItem root = mdtree.getRoot();
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
            TreeItem treeItem = (TreeItem) mdtree.getSelectionModel().getSelectedItem();
            if (treeItem == null)
                return;

            TreeItem root = mdtree.getRoot();

            int level = getLevel(treeItem);

            switch (level) {
                case 0: {//查看模块
                    Module md = dBmanger.findDBByDBName((String) treeItem.getValue());
                    currentMD = md;

                    loadingDb();
                }
                break;
                case 1: {//查看对象
                    TreeItem parent = treeItem.getParent();
                    Module md = dBmanger.findDBByDBName((String) parent.getValue());
                    currentTable = dBmanger.findTableByTableName(md, (String) treeItem.getValue());
                    loadingTable();
                    break;
                }
                default:
                    break;
            }

        }
    }

    private void loadingDb() {
        if (currentMD != null) {
            addSysFields.setSelected(currentMD.isHasSysFields());
        }

        GridPane gridPane = mddetailloader.getRoot();
        mdDetailController.getDbname().setText(currentMD.getDbName());
        mdDetailController.getDbcomment().setText(currentMD.getDbComment());
        mdDetailController.getDbprefix().setText(currentMD.getDbprefix());
        mdDetailController.getBasePackage().setText(currentMD.getBasePackage());
        mdDetailController.getModuleName().setText(currentMD.getModuleName());
        mdDetailController.getAuthor().setText(currentMD.getAuthor());
        mdDetailController.getDbname().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentMD != null) {
                    currentMD.setDbName(newValue);
                    invalidateLeft();
                }
            }
        });
        mdDetailController.getDbcomment().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentMD != null) {
                    currentMD.setDbComment(newValue);
                }
            }
        });
        mdDetailController.getDbprefix().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentMD != null) {
                    currentMD.setDbprefix(newValue);
                }
            }
        });
        mdDetailController.getBasePackage().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentMD != null) {
                    currentMD.setBasePackage(newValue);
                }
            }
        });
        mdDetailController.getModuleName().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentMD != null) {
                    currentMD.setModuleName(newValue);
                }
            }
        });
        mdDetailController.getAuthor().textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if (currentMD != null) {
                    currentMD.setAuthor(newValue);
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
     * 加载对象信息
     */
    private void loadingTable() {
        if (currentMD != null) {
            addSysFields.setSelected(currentMD.isHasSysFields());
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
                        Dragboard md = source.startDragAndDrop(TransferMode.ANY);
                        ClipboardContent content = new ClipboardContent();
                        content.putString((String) source.getItem());
                        md.setContent(content);
//                        System.out.println("Dragging: " + db.getString());
                        event.consume();
                    }
                });
                textFieldTableCell.setOnDragOver(new EventHandler<DragEvent>() {
                    @Override
                    public void handle(DragEvent event) {
                        Dragboard md = event.getDragboard();

                        if (md.hasString()) {
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
                        Dragboard md = event.getDragboard();
                        String f1 = md.getString();

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
            TreeItem root = mdtree.getRoot();
            int level = 0;
            if (treeItem.getParent() == root) {
                level = 0;
            } else if (treeItem.getParent().getParent() == root) {
                level = 1;
            }

            System.out.println("原值:" + event.getOldValue());
            System.out.println("现值:" + event.getNewValue());

            switch (level) {
                case 0: {//编辑模块
                    Module md = dBmanger.findDBByDBName((String) event.getOldValue());
                    md.setDbName((String) event.getNewValue());
                    loadingDb();
                }
                break;
                case 1: {//编辑对象
                    TreeItem parent = treeItem.getParent();
                    Module md = dBmanger.findDBByDBName((String) parent.getValue());
                    Table table = dBmanger.findTableByTableName(md, (String) event.getOldValue());
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
            TreeItem root = mdtree.getRoot();
            TreeItem targetItem = null;
            int index = -1;
            targetItem = (TreeItem) mdtree.getFocusModel().getFocusedItem();
            index = mdtree.getFocusModel().getFocusedIndex();
            if (targetItem == null) {
                targetItem = (TreeItem) mdtree.getSelectionModel().getSelectedItem();
            }
            if (index == -1) {
                index = mdtree.getSelectionModel().getSelectedIndex();
            }
            if (text != null && targetItem != null) {
                switch (text) {

                    case "向上调整":
                        if (index > 0) {
                            List<Module> mds = dBmanger.getMds();
                            mds.add(index - 1, mds.get(index));
                            mds.add(index + 1, mds.get(index));
                            mds.remove(index);
                            mds.remove(index + 1);
                            invalidateLeft();
                        }
                        break;
                    case "向下调整":
                        List<Module> mds = dBmanger.getMds();
                        if (index < mds.size() - 1) {
                            mds.add(index, mds.get(index + 1));
                            mds.add(index + 2, mds.get(index + 1));
                            mds.remove(index + 1);
                            mds.remove(index + 2);
                            invalidateLeft();
                        }
                        break;
                    case "新增模块":
                        root.getChildren().add(new TreeItem<>(dBmanger.getNewDBName()));
                        break;
                    case "删除模块":
                        if (targetItem != null && targetItem.getParent() == root) {
                            boolean b = dBmanger.removeDBByDBName((String) targetItem.getValue());
                            if (b) {
                                System.out.println("删除模块" + targetItem.getValue() + "成功!");
                                invalidateLeft();
                            }
                        }
                        break;
                    case "新增对象":
                        int level = 0;
                        if (targetItem != null && targetItem.getParent() == root) {
                            level = 0;
                        } else if (targetItem != null && targetItem.getParent().getParent() == root) {
                            level = 1;
                        }
                        switch (level) {
                            case 0: {//对模块右击
                                System.out.println("模块:" + targetItem.getValue());
                                Module md = dBmanger.findDBByDBName((String) targetItem.getValue());
                                Table newTableName = dBmanger.getNewTableName(md);
                                if (addSysFields.isSelected()) {
                                    insertSysFields(newTableName);
                                }
                                targetItem.getChildren().add(new TreeItem<>(newTableName.getTableName()));
                            }
                            break;
                            case 1: {//对对象右击
                                TreeItem parent = targetItem.getParent();
                                System.out.println("对象:" + parent.getValue());
                                Module md = dBmanger.findDBByDBName((String) parent.getValue());
                                Table newTableName = dBmanger.getNewTableName(md);
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
                    case "删除对象":
                        level = 0;
                        if (targetItem != null && targetItem.getParent() == root) {
                            level = 0;
                        } else if (targetItem != null && targetItem.getParent().getParent() == root) {
                            level = 1;
                        }
                        switch (level) {
                            case 0: {//对模块右击
                                System.out.println("模块:" + targetItem.getValue());
                                Module md = dBmanger.findDBByDBName((String) targetItem.getValue());
                                Table newTableName = dBmanger.getNewTableName(md);
                                if (addSysFields.isSelected()) {
                                    insertSysFields(newTableName);
                                }
                                targetItem.getChildren().add(new TreeItem<>(newTableName.getTableName()));
                            }
                            break;
                            case 1: {//对对象右击
                                TreeItem parent = targetItem.getParent();
                                System.out.println("对象:" + parent.getValue());
                                Module md = dBmanger.findDBByDBName((String) parent.getValue());

                                for (Table table : md.getTables()) {
                                    if (table.getTableName().equals(targetItem.getValue())) {
                                        md.getTables().remove(table);
                                        System.out.println("移除'" + targetItem.getValue() + "'对象成功!");
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
                    case "新增模块":
                        root.getChildren().add(new TreeItem<>(dBmanger.getNewDBName()));
                        break;
                    default:
                        break;
                }
            }
        }
    }

    private void updateDbTree(List<Module> mds) {
        TreeItem root = mdtree.getRoot();
        for (Module md : mds) {
            TreeItem<String> treeItem = new TreeItem<>(md.getDbName());
            treeItem.setExpanded(true);
            for (Table table : md.getTables()) {
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
