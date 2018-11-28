package xyz.wbsite.dbtool.javafx.manger;

import xyz.wbsite.dbtool.javafx.enumeration.FieldType;
import xyz.wbsite.dbtool.javafx.po.Module;
import xyz.wbsite.dbtool.javafx.po.Field;
import xyz.wbsite.dbtool.javafx.po.Table;
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

    public List<Module> inflate(String path) {
        ArrayList<Module> dbs = new ArrayList();

        if (path == null || "".equals(path)) {
            return dbs;
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
                dbs.clear();
                //开始解析
                DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
                for (File xml : files) {
                    FileInputStream inputStream = null;
                    try {
                        inputStream = new FileInputStream(xml);
                        Document document = documentBuilderFactory.newDocumentBuilder().parse(inputStream);

                        Element dbElement = document.getDocumentElement();

                        if ("db".endsWith(dbElement.getNodeName())) {
                            System.out.println("发现模块:"+xml.getName());
                            Module md = new Module();

                            md.setDbName(dbElement.getAttribute("dbName"));
                            md.setDbUserName(dbElement.getAttribute("dbUserName"));
                            md.setDbComment(dbElement.getAttribute("dbComment"));
                            md.setDbprefix(dbElement.getAttribute("dbprefix"));
                            md.setBasePackage(dbElement.getAttribute("basePackage"));
                            md.setModuleName(dbElement.getAttribute("moduleName"));
                            md.setAuthor(dbElement.getAttribute("author"));
                            md.setHasSysFields(Boolean.parseBoolean(dbElement.getAttribute("hasSysFields")));
                            md.setIsExpanded(Boolean.parseBoolean(dbElement.getAttribute("isExpanded")));

                            NodeList tables = dbElement.getElementsByTagName("table");
                            if (tables.getLength() > 0) {
                                for (int i = 0; i < tables.getLength(); i++) {
                                    Element tableElement = (Element) tables.item(i);
                                    Table table = new Table();
                                    table.setdBhandle(md);
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
                                        for (int j = 0; j < fields.getLength(); j++) {
                                            Element fieldElement = (Element) fields.item(j);
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
                                    md.putTable(table);
                                }
                            }
                            dbs.add(md);
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
        return dbs;
    }

    public boolean saveAs(String path, List<Module> dbs) {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        for (Module md : dbs) {
            Document doc = null;

            //生成DOM模型
            try {
                builder = dbFactory.newDocumentBuilder();
                doc = builder.newDocument();

                Element root = doc.createElement("db");
                root.setAttribute("dbName", md.getDbName());
                root.setAttribute("dbUserName", md.getDbUserName());
                root.setAttribute("dbComment", md.getDbComment());
                root.setAttribute("dbprefix", md.getDbprefix());
                root.setAttribute("basePackage", md.getBasePackage());
                root.setAttribute("moduleName", md.getModuleName());
                root.setAttribute("author", md.getAuthor());
                root.setAttribute("hasSysFields", String.valueOf(md.isHasSysFields()));
                root.setAttribute("isExpanded",String.valueOf(md.isExpanded()));
                Element tables = doc.createElement("tables");
                root.appendChild(tables);
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

                doc.appendChild(root);
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

                File dbFile = new File(path);
                if (!dbFile.exists()) {
                    dbFile.mkdirs();
                }
                File file = new File(dbFile.getAbsolutePath() + File.separator + md.getDbName() + ".xml");
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

    public boolean save(String path, List<Module> dbs) {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        for (Module md : dbs) {
            //处理一些为null字段
            if(md.getAuthor()==null){
                md.setAuthor("");
            }
            if(md.getDbprefix()==null){
                md.setDbprefix("");
            }
            if(md.getDbComment()==null){
                md.setDbComment("");
            }

            Document doc = null;

            //生成DOM模型
            try {
                builder = dbFactory.newDocumentBuilder();
                doc = builder.newDocument();

                Element root = doc.createElement("db");
                root.setAttribute("dbName", md.getDbName());
                root.setAttribute("dbUserName", md.getDbUserName());
                root.setAttribute("dbComment", md.getDbComment());
                root.setAttribute("dbprefix", md.getDbprefix());
                root.setAttribute("basePackage", md.getBasePackage());
                root.setAttribute("moduleName", md.getModuleName());
                root.setAttribute("author", md.getAuthor());
                root.setAttribute("hasSysFields", String.valueOf(md.isHasSysFields()));
                root.setAttribute("isExpanded",String.valueOf(md.isExpanded()));
                Element tables = doc.createElement("tables");
                root.appendChild(tables);
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

                doc.appendChild(root);
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
                File file = new File(dbFile.getAbsolutePath() + File.separator + md.getDbName() + ".xml");
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
