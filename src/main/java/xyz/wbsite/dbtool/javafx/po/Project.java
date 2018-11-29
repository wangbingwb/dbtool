package xyz.wbsite.dbtool.javafx.po;

import java.util.ArrayList;
import java.util.List;

public class Project {

    public Project() {
    }

    public Project(String projectName) {
        this.projectName = projectName;
    }

    private String projectName;
    private String projectBasePackage;
    private String projectAuthor;

    /**
     * 对象
     */
    private List<Module> modules = new ArrayList();

    public boolean putModule(Module module) {
        if (modules == null) {
            modules = new ArrayList<Module>();
        }
        modules.add(module);
        return true;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectBasePackage() {
        return projectBasePackage;
    }

    public void setProjectBasePackage(String projectBasePackage) {
        this.projectBasePackage = projectBasePackage;
    }

    public String getProjectAuthor() {
        return projectAuthor;
    }

    public void setProjectAuthor(String projectAuthor) {
        this.projectAuthor = projectAuthor;
    }

    public List<Module> getModules() {
        return modules;
    }

    public void setModules(List<Module> modules) {
        this.modules = modules;
    }
}
