package xyz.wbsite.dbtool.javafx.po;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Api {
    private boolean check;

    //目标请求对象
    private String targetRequest;
    //目标请求响应
    private String targetResponse;
    //方法
    private String method;

    private File req;
    private File rsp;

    private Set<String> depReq = new HashSet<>();
    private Set<String> depEnt = new HashSet<>();
    private Set<String> depEnum = new HashSet<>();

    private String error;

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }

    public String getTargetRequest() {
        return targetRequest;
    }

    public void setTargetRequest(String targetRequest) {
        this.targetRequest = targetRequest;
    }

    public String getTargetResponse() {
        return targetResponse;
    }

    public void setTargetResponse(String targetResponse) {
        this.targetResponse = targetResponse;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
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

    public Set<String> getDepReq() {
        return depReq;
    }

    public void setDepReq(Set<String> depReq) {
        this.depReq = depReq;
    }

    public Set<String> getDepEnt() {
        return depEnt;
    }

    public void setDepEnt(Set<String> depEnt) {
        this.depEnt = depEnt;
    }

    public Set<String> getDepEnum() {
        return depEnum;
    }

    public void setDepEnum(Set<String> depEnum) {
        this.depEnum = depEnum;
    }
}
