package com.wb.dbtool.tool;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class JavaClassReader {
    private File javaClass;

    private String packageName;
    private String domainName;
    private String moduleName;
    private List<String> annotationList;
    private List<String> importList;
    private String className;
    private String fatherName;
    private List<String> body;

    public JavaClassReader(File javaClass) throws IOException {
        this.javaClass = javaClass;
        importList = new ArrayList<>();
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

                if ("req".equals(split[split.length - 1]) || "rsp".equals(split[split.length - 1])|| "ent".equals(split[split.length - 1])) {
                    moduleName = split[split.length - 2];
                    for (int i = 0; i < split.length - 2; i++) {
                        domainName += split[i] + ".";
                    }
                    domainName = domainName.substring(0, domainName.length() - 1);
                }

                continue;
            }
            if (line.startsWith("import")) {
                if (!line.contains("framework")) {
                    if (line.contains(".ent.")){
                        line = line.replaceAll("\\.ent\\.",".entity.");
                    }
                    importList.add(line);
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
            if (line.contains("class")) {
                line = line.replaceAll("\\{", " { ");
                line = line.replaceAll("}", " } ");
                line = line.replaceAll("\\s+", " ");
                String[] split = line.split("\\s");
                for (int i = 0; i < split.length; i++) {
                    if ("class".equals(split[i])) {
                        className = split[i + 1];
                    }
                    if ("extends".equals(split[i])) {
                        fatherName = split[i + 1];
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

    public List<String> getImportList() {
        return importList;
    }

    public void setImportList(List<String> importList) {
        this.importList = importList;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
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
        JavaClassReader javaClassReader = new JavaClassReader(new File("C:\\dbtool\\auth\\src\\main\\java\\com\\resthome\\system\\auth\\req\\FunctionFindRequest.java"));
    }
}
