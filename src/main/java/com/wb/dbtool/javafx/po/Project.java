package com.wb.dbtool.javafx.po;

import java.util.List;

public class Project {

    public Project() {
    }

    public Project(String projecName) {
        this.projecName = projecName;
    }

    private String projecName;
    private String author;
    private String basePackage;

    public String getProjecName() {
        return projecName;
    }

    public void setProjecName(String projecName) {
        this.projecName = projecName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
    }

    private List<Module> moduleList;

    public List<Module> getModuleList() {
        return moduleList;
    }

    public void setModuleList(List<Module> moduleList) {
        this.moduleList = moduleList;
    }
}
