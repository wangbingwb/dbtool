package com.wb.dbtool.javafx.po;

import java.io.File;

public class Api {
    private boolean check;
    private File req;
    private File rsp;
    private String reqName;
    private String rspName;
    private String method;

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
