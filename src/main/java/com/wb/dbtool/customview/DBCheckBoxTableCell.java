package com.wb.dbtool.customview;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.CheckBox;
import javafx.scene.control.cell.CheckBoxTableCell;
import javafx.util.Callback;
import javafx.util.StringConverter;

import java.lang.reflect.Field;

public class DBCheckBoxTableCell extends CheckBoxTableCell {

    private CheckBox checkBox = null;
    private int param = 0;

    public DBCheckBoxTableCell() {
        init();
    }

    public DBCheckBoxTableCell(Callback getSelectedProperty) {
        super(getSelectedProperty);
        init();
    }

    public void setInvalid(boolean value) {
        super.setDisable(value);
    }

    public DBCheckBoxTableCell(Callback getSelectedProperty, StringConverter converter) {
        super(getSelectedProperty, converter);
        init();
    }

    public class sCallback implements Callback<Integer, ObservableValue<Boolean>> {

        @Override
        public ObservableValue<Boolean> call(Integer param) {
            DBCheckBoxTableCell.this.param = param;
            return null;
        }
    }

    public int getParam() {
        return param;
    }

    public void setParam(int param) {
        this.param = param;
    }

    public void setOnChangeListener(ChangeListener<Boolean> changeListener) {
        checkBox.selectedProperty().addListener(changeListener);
    }

    private void init() {
        Class<?> superclass = this.getClass().getSuperclass();

        try {
            Field field = superclass.getDeclaredField("checkBox");
            field.setAccessible(true);
            checkBox = (CheckBox) field.get(this);
            checkBox.setFocusTraversable(false);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateItem(Object item, boolean empty) {
        super.updateItem(item, empty);
    }
}
