package com.wb.dbtool.javafx.po;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Api {
    private boolean check;
    private File req;
    private File rsp;
    private String reqName;
    private String rspName;
    private String method;
    private Set<String> entNames = new HashSet<>();
    private List<File> ents = new ArrayList<>();
    private Set<String> enumsNames = new HashSet<>();
    private List<File> enums = new ArrayList<>();
    private String error;

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public Set<String> getEnumsNames() {
        return enumsNames;
    }

    public void setEnumsNames(Set<String> enumsNames) {
        this.enumsNames = enumsNames;
    }

    public List<File> getEnums() {
        return enums;
    }

    public void setEnums(List<File> enums) {
        this.enums = enums;
    }

    public Set<String> getEntNames() {
        return entNames;
    }

    public void setEntNames(Set<String> entNames) {
        this.entNames = entNames;
    }

    public List<File> getEnts() {
        return ents;
    }

    public void setEnts(List<File> ents) {
        this.ents = ents;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }

    public File getReq() {
        return req;
    }

    public void setReq(File req) {
        this.req = req;
    }

    public File getRsp() {
        return rsp;
    }

    public void setRsp(File rsp) {
        this.rsp = rsp;
    }

    public String getReqName() {
        return reqName;
    }

    public void setReqName(String reqName) {
        this.reqName = reqName;
    }

    public String getRspName() {
        return rspName;
    }

    public void setRspName(String rspName) {
        this.rspName = rspName;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
}
