package com.wb.dbtool.tool;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class JavaEnumReader {
    private File javaClass;

    private String packageName;
    private String domainName;
    private String moduleName;
    private List<String> annotationList;
    private String className;
    private List<String> body;

    public JavaEnumReader(File javaClass) throws IOException {
        this.javaClass = javaClass;
        annotationList = new ArrayList<>();
        domainName = "";
        read();
    }

    private void read() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(javaClass), "utf-8"));

        int step = 1;//1-读取package，2-读取import，3-读取类注释，4-读取类名、父类，5-读取类体

        String line = null;
        StringBuffer zs = new StringBuffer();
        StringBuffer sb = new StringBuffer();
        while ((line = bufferedReader.readLine()) != null) {
            if (line.startsWith("package")) {
                packageName = line;

                String s = line.replaceAll("package ", "");
                s = s.replaceAll(";", "");
                String[] split = s.split("\\.");

                if ("enums".equals(split[split.length - 1])) {
                    moduleName = split[split.length - 2];
                    for (int i = 0; i < split.length - 2; i++) {
                        domainName += split[i] + ".";
                    }
                    domainName = domainName.substring(0, domainName.length() - 1);
                }

                continue;
            }

            if (line.contains("/**") || line.contains("*") || line.contains("*/")) {
                if (zs != null) {
                    zs.append(line + "\n");
                    annotationList.add(line);
                    if (line.contains("*/")) {
                        zs = null;
                    }
                }
            }
            if (line.contains("enum")) {
                line = line.replaceAll("\\{", " { ");
                line = line.replaceAll("}", " } ");
                line = line.replaceAll("\\s+", " ");
                String[] split = line.split("\\s");
                for (int i = 0; i < split.length; i++) {
                    if ("enum".equals(split[i])) {
                        className = split[i + 1];
                    }
                }
            }
            sb.append(line + "\n");
        }

        body = new ArrayList<>(Arrays.asList(sb.substring(sb.indexOf("{")).split("\n")));

        for (int i = 0; i < body.size(); i++) {
            if (body.get(i).contains("{")) {
                body.set(i, body.get(i).replaceAll("\\{", ""));
                break;
            }
        }
        for (int i = body.size() - 1; i > 0; i--) {
            if (body.get(i).contains("}")) {
                body.set(i, body.get(i).replaceAll("\\}", ""));
                break;
            }
        }

        bufferedReader.close();
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getDomainName() {
        return domainName;
    }

    public void setDomainName(String domainName) {
        this.domainName = domainName;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public List<String> getAnnotationList() {
        return annotationList;
    }

    public void setAnnotationList(List<String> annotationList) {
        this.annotationList = annotationList;
    }


    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public List<String> getBody() {
        return body;
    }

    public void setBody(List<String> body) {
        this.body = body;
    }

    public File getJavaClass() {
        return javaClass;
    }

    public void setJavaClass(File javaClass) {
        this.javaClass = javaClass;
    }

    public static void main(String[] args) throws IOException {
        JavaEnumReader javaClassReader = new JavaEnumReader(new File("C:\\dbtool\\example\\src\\main\\java\\com\\example\\example\\enums\\Type.java"));
    }
}
