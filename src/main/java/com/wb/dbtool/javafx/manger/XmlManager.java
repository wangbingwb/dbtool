package com.wb.dbtool.javafx.manger;

import com.wb.dbtool.javafx.enumeration.FieldType;
import com.wb.dbtool.javafx.po.Field;
import com.wb.dbtool.javafx.po.Module;
import com.wb.dbtool.javafx.po.Project;
import com.wb.dbtool.javafx.po.Table;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class XmlManager {

    public List<Project> inflate(String path) {
        ArrayList<Project> projectList = new ArrayList();

        if (path == null || "".equals(path)) {
            return projectList;
        }
        File file = new File(path);
        if (!file.exists()) {
            System.err.println("目录不存在!");
        } else {
            String dbpath = path + "\\.db";
            File dbFile = new File(dbpath);

            if (!dbFile.exists()) {
                dbFile.mkdir();
            } else {
                File[] files = dbFile.listFiles(new FilenameFilter() {
                    public boolean accept(File dir, String name) {
                        return name.endsWith(".xml") || name.endsWith(".XML");
                    }
                });

                //清空
                projectList.clear();
                //开始解析
                DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
                for (File xml : files) {
                    FileInputStream inputStream = null;
                    try {
                        inputStream = new FileInputStream(xml);
                        Document document = documentBuilderFactory.newDocumentBuilder().parse(inputStream);

                        Element dbElement = document.getDocumentElement();

                        if ("project".equals(dbElement.getNodeName())) {

                            System.out.println("发现库文件:" + xml.getName());
                            Project project = new Project();
                            project.setProjecName(dbElement.getAttribute("projectName"));
                            project.setBasePackage(dbElement.getAttribute("basePackage"));
                            project.setAuthor(dbElement.getAttribute("author"));

                            NodeList modules = dbElement.getElementsByTagName("module");
                            if (modules.getLength() > 0) {
                                for (int j = 0; j < modules.getLength(); j++) {
                                    Module module = new Module();
                                    Element moduleElement = (Element) modules.item(j);

                                    module.setDbName(moduleElement.getAttribute("dbName"));
                                    module.setDbUserName(moduleElement.getAttribute("dbUserName"));
                                    module.setDbComment(moduleElement.getAttribute("dbComment"));
                                    module.setDbprefix(moduleElement.getAttribute("dbprefix"));
                                    module.setModuleName(moduleElement.getAttribute("moduleName"));
                                    module.setHasSysFields(Boolean.parseBoolean(moduleElement.getAttribute("hasSysFields")));
                                    module.setIsExpanded(Boolean.parseBoolean(moduleElement.getAttribute("isExpanded")));


                                    NodeList tables = dbElement.getElementsByTagName("table");
                                    if (tables.getLength() > 0) {
                                        for (int k = 0; k < tables.getLength(); k++) {
                                            Element tableElement = (Element) tables.item(k);
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
                                                for (int l = 0; l < fields.getLength(); l++) {
                                                    Element fieldElement = (Element) fields.item(l);
                                                    Field field = new Field();
                                                    field.setFieldName(fieldElement.getAttribute("fieldName"));
                                                    field.setFieldType(FieldType.parse(fieldElement.getAttribute("fieldType")));
                                                    field.setFieldLenght(Integer.parseInt(fieldElement.getAttribute("fieldLenght")));
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

                                }

                            }
                            projectList.add(project);
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
        return projectList;
    }

    public boolean saveAs(String path, List<Project> projectList) {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        for (Project project : projectList) {
            //处理一些为null字段
            if (project.getAuthor() == null) {
                project.setAuthor("");
            }
            if (project.getBasePackage() == null) {
                project.setBasePackage("");
            }

            //生成DOM模型
            Document doc = null;
            try {
                builder = dbFactory.newDocumentBuilder();
                doc = builder.newDocument();
                Element projectElement = doc.createElement("project");
                projectElement.setAttribute("basePackage", project.getBasePackage());
                projectElement.setAttribute("author", project.getAuthor());

                for (Module module : project.getModuleList()) {
                    if (module.getDbprefix() == null) {
                        module.setDbprefix("");
                    }
                    if (module.getDbComment() == null) {
                        module.setDbComment("");
                    }

                    Element moduleElement = doc.createElement("module");

                    moduleElement.setAttribute("dbName", module.getDbName());
                    moduleElement.setAttribute("dbUserName", module.getDbUserName());
                    moduleElement.setAttribute("dbComment", module.getDbComment());
                    moduleElement.setAttribute("dbprefix", module.getDbprefix());
                    moduleElement.setAttribute("moduleName", module.getModuleName());
                    moduleElement.setAttribute("hasSysFields", String.valueOf(module.isHasSysFields()));
                    moduleElement.setAttribute("isExpanded", String.valueOf(module.isExpanded()));
                    Element tables = doc.createElement("tables");
                    projectElement.appendChild(tables);

                    for (Table t : module.getTables()) {
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
                            if (f.getFieldLenght() != null) {
                                field.setAttribute("fieldLenght", f.getFieldLenght().toString());
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
                }


                doc.appendChild(projectElement);
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
                e.printStackTrace();
                return false;
            }

            //输出文件
            FileOutputStream stream = null;
            try {
                Transformer t = TransformerFactory.newInstance().newTransformer();

                //设置换行和缩进
                t.setOutputProperty(OutputKeys.INDENT, "yes");
                t.setOutputProperty(OutputKeys.METHOD, "xml");

                File dbFile = new File(path + File.separator + ".db");
                if (!dbFile.exists()) {
                    dbFile.mkdirs();
                }
                File file = new File(dbFile.getAbsolutePath() + File.separator + project.getProjecName() + ".xml");
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
        }
        return true;
    }

    public boolean save(String path, List<Project> projectList) {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        for (Project project : projectList) {
            //处理一些为null字段
            if (project.getAuthor() == null) {
                project.setAuthor("");
            }
            if (project.getBasePackage() == null) {
                project.setBasePackage("");
            }

            //生成DOM模型
            Document doc = null;
            try {
                builder = dbFactory.newDocumentBuilder();
                doc = builder.newDocument();
                Element projectElement = doc.createElement("project");
                projectElement.setAttribute("basePackage", project.getBasePackage());
                projectElement.setAttribute("author", project.getAuthor());

                for (Module module : project.getModuleList()) {
                    if (module.getDbprefix() == null) {
                        module.setDbprefix("");
                    }
                    if (module.getDbComment() == null) {
                        module.setDbComment("");
                    }

                    Element moduleElement = doc.createElement("module");

                    moduleElement.setAttribute("dbName", module.getDbName());
                    moduleElement.setAttribute("dbUserName", module.getDbUserName());
                    moduleElement.setAttribute("dbComment", module.getDbComment());
                    moduleElement.setAttribute("dbprefix", module.getDbprefix());
                    moduleElement.setAttribute("moduleName", module.getModuleName());
                    moduleElement.setAttribute("hasSysFields", String.valueOf(module.isHasSysFields()));
                    moduleElement.setAttribute("isExpanded", String.valueOf(module.isExpanded()));
                    Element tables = doc.createElement("tables");
                    projectElement.appendChild(tables);

                    for (Table t : module.getTables()) {
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
                            if (f.getFieldLenght() != null) {
                                field.setAttribute("fieldLenght", f.getFieldLenght().toString());
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
                }


                doc.appendChild(projectElement);
            } catch (ParserConfigurationException e) {
                e.printStackTrace();
                e.printStackTrace();
                return false;
            }

            //输出文件
            FileOutputStream stream = null;
            try {
                Transformer t = TransformerFactory.newInstance().newTransformer();

                //设置换行和缩进
                t.setOutputProperty(OutputKeys.INDENT, "yes");
                t.setOutputProperty(OutputKeys.METHOD, "xml");

                File dbFile = new File(path + File.separator + ".db");
                if (!dbFile.exists()) {
                    dbFile.mkdirs();
                }
                File file = new File(dbFile.getAbsolutePath() + File.separator + project.getProjecName() + ".xml");
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
        }
        return true;
    }


}
