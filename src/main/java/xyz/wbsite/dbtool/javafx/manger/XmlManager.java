package xyz.wbsite.dbtool.javafx.manger;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import xyz.wbsite.dbtool.javafx.enumeration.FieldType;
import xyz.wbsite.dbtool.javafx.po.Field;
import xyz.wbsite.dbtool.javafx.po.Module;
import xyz.wbsite.dbtool.javafx.po.Project;
import xyz.wbsite.dbtool.javafx.po.Table;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;

public class XmlManager {

    public Project inflate(String path) {
        Project project = new Project();

        if (path == null || "".equals(path)) {
            return project;
        }
        File file = new File(path);
        if (!file.exists()) {
            System.err.println("目录不存在!");
        } else {
            File dbFile = new File(path);

            if (!dbFile.exists()) {
                dbFile.mkdir();
            } else {
                File[] files = dbFile.listFiles(new FilenameFilter() {
                    public boolean accept(File dir, String name) {
                        return name.endsWith(".xml") || name.endsWith(".XML");
                    }
                });

                //开始解析
                DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
                for (File xml : files) {
                    FileInputStream inputStream = null;
                    try {
                        inputStream = new FileInputStream(xml);
                        Document document = documentBuilderFactory.newDocumentBuilder().parse(inputStream);

                        Element dbElement = document.getDocumentElement();

                        if ("project".endsWith(dbElement.getNodeName())) {
                            System.out.println("发现项目:" + xml.getName());

                            NodeList projectName = dbElement.getElementsByTagName("projectName");
                            if (projectName.getLength() == 1) {
                                project.setProjectName(projectName.item(0).getTextContent());
                            }

                            NodeList projectBasePackage = dbElement.getElementsByTagName("projectBasePackage");
                            if (projectBasePackage.getLength() == 1) {
                                project.setProjectBasePackage(projectBasePackage.item(0).getTextContent());
                            }

                            NodeList projectAuthor = dbElement.getElementsByTagName("projectAuthor");
                            if (projectAuthor.getLength() == 1) {
                                project.setProjectAuthor(projectAuthor.item(0).getTextContent());
                            }

                            NodeList modules = dbElement.getElementsByTagName("module");
                            if (modules.getLength() > 0) {

                                for (int i = 0; i < modules.getLength(); i++) {
                                    Module module = new Module();
                                    Element moduleElement = (Element) modules.item(i);

                                    NodeList moduleName = moduleElement.getElementsByTagName("moduleName");
                                    if (moduleName.getLength() == 1) {
                                        module.setModuleName(moduleName.item(0).getTextContent());
                                    }

                                    NodeList moduleComment = moduleElement.getElementsByTagName("moduleComment");
                                    if (moduleComment.getLength() == 1) {
                                        module.setModuleComment(moduleComment.item(0).getTextContent());
                                    }

                                    NodeList modulePrefix = moduleElement.getElementsByTagName("modulePrefix");
                                    if (modulePrefix.getLength() == 1) {
                                        module.setModulePrefix(modulePrefix.item(0).getTextContent());
                                    }

                                    NodeList hasSysFields = moduleElement.getElementsByTagName("hasSysFields");
                                    if (hasSysFields.getLength() == 1) {
                                        module.setHasSysFields(Boolean.parseBoolean(hasSysFields.item(0).getTextContent()));
                                    }

                                    NodeList tables = moduleElement.getElementsByTagName("table");
                                    if (tables.getLength() > 0) {
                                        for (int j = 0; j < tables.getLength(); j++) {
                                            Element tableElement = (Element) tables.item(j);
                                            Table table = new Table();
                                            table.setdBhandle(module);
                                            table.setTableName(tableElement.getAttribute("tableName"));
                                            table.setTableComment(tableElement.getAttribute("tableComment"));
                                            table.setCreate(Boolean.parseBoolean(tableElement.getAttribute("create")));
                                            table.setDelete(Boolean.parseBoolean(tableElement.getAttribute("delete")));
                                            table.setUpdate(Boolean.parseBoolean(tableElement.getAttribute("update")));
                                            table.setFind(Boolean.parseBoolean(tableElement.getAttribute("find")));
                                            table.setGet(Boolean.parseBoolean(tableElement.getAttribute("get")));
                                            table.setSearch(Boolean.parseBoolean(tableElement.getAttribute("search")));
                                            table.setGetAll(Boolean.parseBoolean(tableElement.getAttribute("getAll")));

                                            NodeList fields = tableElement.getElementsByTagName("field");

                                            if (fields.getLength() > 0) {
                                                for (int k = 0; k < fields.getLength(); k++) {
                                                    Element fieldElement = (Element) fields.item(k);
                                                    Field field = new Field();
                                                    field.setFieldName(fieldElement.getAttribute("fieldName"));
                                                    field.setFieldType(FieldType.parse(fieldElement.getAttribute("fieldType")));
                                                    field.setFieldLength(Integer.parseInt(fieldElement.getAttribute("fieldLength")));
                                                    field.setFieldComment(fieldElement.getAttribute("fieldComment"));
                                                    field.setDefaultValue(fieldElement.getAttribute("defaultValue"));
                                                    field.setIsSystem(Boolean.parseBoolean(fieldElement.getAttribute("IsSystem")));
                                                    field.setIsMust(Boolean.parseBoolean(fieldElement.getAttribute("isMust")));
                                                    field.setIsPrimaryKey(Boolean.parseBoolean(fieldElement.getAttribute("isPrimaryKey")));
                                                    field.setIsQuery(Boolean.parseBoolean(fieldElement.getAttribute("isQuery")));
                                                    field.setIsSearch(Boolean.parseBoolean(fieldElement.getAttribute("isSearch")));
                                                    table.putField(field);
                                                }
                                            }
                                            module.putTable(table);
                                        }
                                    }
                                    project.putModule(module);
                                }
                            }
                        }
                    } catch (Exception e) {
                        System.out.println("文件：'" + xml.getName() + "'解析失败!请检查语法是否正确!");
                        e.printStackTrace();
                    } finally {
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        }
        System.out.println("数据初始化成功...");
        return project;
    }

    public boolean saveAs(String path, Project project) {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        //生成DOM模型
        try {
            builder = dbFactory.newDocumentBuilder();
            Document doc = builder.newDocument();

            Element rootProject = doc.createElement("project");
            doc.appendChild(rootProject);

            Element projectName = doc.createElement("projectName");
            projectName.setTextContent(project.getProjectName());
            Element projectBasePackage = doc.createElement("projectBasePackage");
            projectBasePackage.setTextContent(project.getProjectBasePackage());
            Element projectAuthor = doc.createElement("projectAuthor");
            projectAuthor.setTextContent(project.getProjectAuthor());
            rootProject.appendChild(projectName);
            rootProject.appendChild(projectBasePackage);
            rootProject.appendChild(projectAuthor);

            Element modules = doc.createElement("modules");
            rootProject.appendChild(modules);

            //region Description
            for (Module md : project.getModules()) {
                Element module = doc.createElement("module");

                Element moduleName = doc.createElement("moduleName");
                Element moduleComment = doc.createElement("moduleComment");
                Element modulePrefix = doc.createElement("modulePrefix");
                Element hasSysFields = doc.createElement("hasSysFields");
                moduleName.setTextContent(md.getModuleName());
                moduleComment.setTextContent(md.getModuleComment());
                modulePrefix.setTextContent(md.getModulePrefix());
                hasSysFields.setTextContent(String.valueOf(md.isHasSysFields()));
                module.appendChild(moduleComment);
                module.appendChild(modulePrefix);
                module.appendChild(moduleName);
                module.appendChild(hasSysFields);

                Element tables = doc.createElement("tables");
                module.appendChild(tables);
                for (Table t : md.getTables()) {
                    Element table = doc.createElement("table");
                    table.setAttribute("tableName", t.getTableName());
                    table.setAttribute("tableComment", t.getTableComment());
                    table.setAttribute("create", t.getCreate().toString());
                    table.setAttribute("delete", t.getDelete().toString());
                    table.setAttribute("update", t.getUpdate().toString());
                    table.setAttribute("find", t.getFind().toString());
                    table.setAttribute("get", t.getGet().toString());
                    table.setAttribute("search", t.getSearch().toString());
                    table.setAttribute("getAll", t.getGetAll().toString());

                    Element fields = doc.createElement("fields");

                    table.appendChild(fields);

                    for (Field f : t.getFields()) {
                        Element field = doc.createElement("field");
                        field.setAttribute("fieldName", f.getFieldName());
                        if (f.getFieldType() != null) {
                            field.setAttribute("fieldType", f.getFieldType().name());
                        }
                        if (f.getFieldLength() != null) {
                            field.setAttribute("fieldLength", f.getFieldLength().toString());
                        }
                        field.setAttribute("fieldComment", f.getFieldComment());
                        field.setAttribute("defaultValue", f.getDefaultValue());
                        if (f.getIsMust() != null) {
                            field.setAttribute("isMust", f.getIsMust().toString());
                        }
                        field.setAttribute("isQuery", f.getIsQuery().toString());
                        field.setAttribute("isSearch", f.getIsSearch().toString());
                        if (f.getIsPrimaryKey() != null) {
                            field.setAttribute("isPrimaryKey", f.getIsPrimaryKey().toString());
                        }
                        if (f.getIsSystem() != null) {
                            field.setAttribute("IsSystem", f.getIsSystem().toString());
                        }
                        fields.appendChild(field);
                    }
                    tables.appendChild(table);
                }
                modules.appendChild(module);
            }
            //endregion

            //输出文件
            FileOutputStream stream = null;
            try {
                Transformer t = TransformerFactory.newInstance().newTransformer();

                //设置换行和缩进
                t.setOutputProperty(OutputKeys.INDENT, "yes");
                t.setOutputProperty(OutputKeys.METHOD, "xml");

                File dbFile = new File(path);
                if (!dbFile.exists()) {
                    dbFile.mkdirs();
                }
                File file = new File(dbFile.getAbsolutePath() + File.separator + project.getProjectName() + ".xml");
                if (!file.exists()) {
                    file.createNewFile();
                }
                stream = new FileOutputStream(file);
                t.transform(new DOMSource(doc), new StreamResult(stream));
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            } finally {
                if (stream != null) {
                    try {
                        stream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean save(String path, Project project) {
        File projectFile = new File(path);
        saveAs(projectFile.getAbsolutePath(), project);
        return true;
    }
}
