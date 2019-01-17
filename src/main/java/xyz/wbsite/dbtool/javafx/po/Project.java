package xyz.wbsite.dbtool.javafx.po;

import javafx.scene.control.TreeItem;

import java.util.ArrayList;
import java.util.List;

public class Project extends TreeItem{

    public Project() {
        this.projectName = "EXAMPLE-WEB";
        this.projectBasePackage = "com.example";
        this.projectAuthor = "author";
    }

    public Project(String projectName) {
        this.projectName = projectName;
        setValue(projectName);
        setExpanded(true);
    }

    private String projectName;
    private String projectBasePackage;
    private String projectAuthor;

    /**
     * 对象
     */
    private List<Module> modules = new ArrayList();

    public boolean putModule(Module module) {
        modules.add(module);
        this.getChildren().add(module);
        return true;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
        this.setValue(projectName);
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
