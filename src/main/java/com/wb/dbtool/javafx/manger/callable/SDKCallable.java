package com.wb.dbtool.javafx.manger.callable;

import com.wb.dbtool.javafx.manger.DBManager;
import com.wb.dbtool.javafx.po.AbstractDBmapper;
import com.wb.dbtool.javafx.tool.JavaClassReader;
import com.wb.dbtool.javafx.tool.JavaEnumReader;
import com.wb.dbtool.javafx.tool.Tool;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import java.io.*;
import java.util.*;
import java.util.concurrent.Callable;

import static com.wb.dbtool.javafx.tool.Tool.clear;
import static com.wb.dbtool.javafx.tool.Tool.outputVM;
import static com.wb.dbtool.javafx.tool.Tool.revert;

public class SDKCallable implements Callable {

    private File sdk;
    private File req;
    private File rsp;
    private File ent;
    private File enums;

    private VelocityEngine velocityEngine;

    public SDKCallable(File sdk, File req, File rsp, File ent, File enums) {
        this.sdk = sdk;
        this.req = req;
        this.rsp = rsp;
        this.ent = ent;
        this.enums = enums;
        try {
            velocityEngine = new VelocityEngine();
            velocityEngine.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
            velocityEngine.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
            velocityEngine.init();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private AbstractDBmapper dBmapper;

    public Boolean call() throws Exception {
        if (!sdk.exists()) {
            sdk.mkdir();
        } else {
            clear(sdk);
        }

        dBmapper = DBManager.dBmapper;

        {
            VelocityContext velocityContext = new VelocityContext();
            velocityContext.put("sdk", sdk.getName().toLowerCase());
            File file = new File(sdk.getAbsolutePath() + File.separator + "pom.xml");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/pom.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }

        File frameWork = null;
        String domain = null;
        String module = null;
        Set<String> managerList = new HashSet<>();
        List<Method> methodList = new ArrayList<>();

        if (req.exists() && rsp.exists() && ent.exists()) {
            File[] files = req.listFiles();
            for (File f : files) {
                try {
                    //region 生成request
                    JavaClassReader javaClassReader = new JavaClassReader(f);

                    Method method = new Method();
                    method.setStringMethod("api." + javaClassReader.getModuleName() + "." + Tool.camelToPoint(javaClassReader.getClassName().replaceAll("Request", "")));
                    method.setRequest(javaClassReader.getClassName());
                    method.setTarget(Tool.getRequestTarget(javaClassReader.getClassName()));
                    method.setMethod(Tool.getRequestAction(javaClassReader.getClassName()));
                    method.setManager(Tool.getRequestTarget(javaClassReader.getClassName()) + "Manager");
                    methodList.add(method);
                    StringBuffer stringBuffer = new StringBuffer("");
                    stringBuffer.append(sdk.getPath() + File.separator);
                    stringBuffer.append("src" + File.separator);
                    stringBuffer.append("main" + File.separator);
                    stringBuffer.append("java" + File.separator);

                    String[] split = javaClassReader.getDomainName().split("\\.");


                    for (String s1 : split) {
                        stringBuffer.append(s1 + File.separator);
                    }
                    if (frameWork == null) {
                        frameWork = new File(stringBuffer.toString());
                        frameWork.mkdirs();
                    }
                    if (domain == null) {
                        domain = javaClassReader.getDomainName();
                    }
                    if (module == null) {
                        module = javaClassReader.getModuleName();
                    }

                    stringBuffer.append(javaClassReader.getModuleName());

                    File request = new File(stringBuffer.toString() + File.separator + "request");
                    request.mkdirs();

                    {
                        VelocityContext velocityContext = new VelocityContext();
                        velocityContext.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                        velocityContext.put("domain", javaClassReader.getDomainName());
                        velocityContext.put("module", javaClassReader.getModuleName());
                        velocityContext.put("importList", javaClassReader.getImportList());
                        velocityContext.put("annotation", javaClassReader.getAnnotationList());
                        velocityContext.put("className", javaClassReader.getClassName().replaceAll("Request", ""));
                        velocityContext.put("body", javaClassReader.getBody());
                        velocityContext.put("tool", Tool.class);
                        velocityContext.put("hasList", javaClassReader.isHasList());
                        velocityContext.put("findOrSearchflag", javaClassReader.getFindOrSearchflag());
                        File file = new File(request.getAbsolutePath() + File.separator + f.getName());
                        Template template = velocityEngine.getTemplate("/modules/Java_sdk/module/request/request.vm", "UTF-8");
                        outputVM(file, template, velocityContext);
                        System.out.println("生成文件" + file.getName() + "成功");
                    }
                    //endregion
                } catch (IOException e) {
                    e.printStackTrace();
                }

                try {
                    //region 生成response
                    File r = new File(f.getParent().replaceAll("req", "rsp") + File.separator + f.getName().replaceAll("Request", "Response"));
                    JavaClassReader javaClassReader = new JavaClassReader(r);

                    StringBuffer stringBuffer = new StringBuffer("");
                    stringBuffer.append(sdk.getPath() + File.separator);
                    stringBuffer.append("src" + File.separator);
                    stringBuffer.append("main" + File.separator);
                    stringBuffer.append("java" + File.separator);

                    String[] split = javaClassReader.getDomainName().split("\\.");


                    for (String s1 : split) {
                        stringBuffer.append(s1 + File.separator);
                    }

                    stringBuffer.append(javaClassReader.getModuleName());

                    File response = new File(stringBuffer.toString() + File.separator + "response");
                    response.mkdirs();

                    {
                        VelocityContext velocityContext = new VelocityContext();
                        velocityContext.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                        velocityContext.put("domain", javaClassReader.getDomainName());
                        velocityContext.put("module", javaClassReader.getModuleName());
                        velocityContext.put("importList", javaClassReader.getImportList());
                        velocityContext.put("annotation", javaClassReader.getAnnotationList());
                        velocityContext.put("className", javaClassReader.getClassName().replaceAll("Response", ""));
                        velocityContext.put("body", javaClassReader.getBody());
                        velocityContext.put("tool", Tool.class);
                        velocityContext.put("hasList", javaClassReader.isHasList());
                        velocityContext.put("Tclass", javaClassReader.getTclass());
                        File file = new File(response.getAbsolutePath() + File.separator + f.getName().replaceAll("Request", "Response"));
                        Template template = velocityEngine.getTemplate("/modules/Java_sdk/module/response/response.vm", "UTF-8");
                        outputVM(file, template, velocityContext);
                        System.out.println("生成文件" + r.getName() + "成功");
                    }
                    //endregion
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }

            for (File f : ent.listFiles()) {

                try {
                    //region 生成entity
                    JavaClassReader javaClassReader = new JavaClassReader(f);
                    managerList.add(javaClassReader.getClassName() + "Manager");

                    StringBuffer stringBuffer = new StringBuffer("");
                    stringBuffer.append(sdk.getPath() + File.separator);
                    stringBuffer.append("src" + File.separator);
                    stringBuffer.append("main" + File.separator);
                    stringBuffer.append("java" + File.separator);

                    String[] split = javaClassReader.getDomainName().split("\\.");


                    for (String s1 : split) {
                        stringBuffer.append(s1 + File.separator);
                    }

                    stringBuffer.append(javaClassReader.getModuleName());

                    File entity = new File(stringBuffer.toString() + File.separator + "entity");
                    entity.mkdirs();

                    {
                        VelocityContext velocityContext = new VelocityContext();
                        velocityContext.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                        velocityContext.put("domain", javaClassReader.getDomainName());
                        velocityContext.put("module", javaClassReader.getModuleName());
                        velocityContext.put("importList", javaClassReader.getImportList());
                        velocityContext.put("annotation", javaClassReader.getAnnotationList());
                        velocityContext.put("className", javaClassReader.getClassName().replaceAll("Entity", ""));
                        velocityContext.put("body", javaClassReader.getBody());
                        velocityContext.put("tool", Tool.class);
                        File file = new File(entity.getAbsolutePath() + File.separator + f.getName());
                        Template template = velocityEngine.getTemplate("/modules/Java_sdk/module/entity/entity.vm", "UTF-8");
                        outputVM(file, template, velocityContext);
                        System.out.println("生成文件" + file.getName() + "成功");
                    }
                    //endregion

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            return false;
        }


        if (enums.exists()) {
            for (File f : enums.listFiles()) {
                try {
                    //region 生成enums
                    JavaEnumReader javaEnumReader = new JavaEnumReader(f);

                    StringBuffer stringBuffer = new StringBuffer("");
                    stringBuffer.append(sdk.getPath() + File.separator);
                    stringBuffer.append("src" + File.separator);
                    stringBuffer.append("main" + File.separator);
                    stringBuffer.append("java" + File.separator);

                    String[] split = javaEnumReader.getDomainName().split("\\.");


                    for (String s1 : split) {
                        stringBuffer.append(s1 + File.separator);
                    }

                    stringBuffer.append(javaEnumReader.getModuleName());

                    File enums_ = new File(stringBuffer.toString() + File.separator + "enums");
                    enums_.mkdirs();

                    {
                        VelocityContext velocityContext = new VelocityContext();
                        velocityContext.put("package", "package " + javaEnumReader.getDomainName() + "." + javaEnumReader.getModuleName() + "." + "enums;");
                        velocityContext.put("domain", javaEnumReader.getDomainName());
                        velocityContext.put("module", javaEnumReader.getModuleName());
                        velocityContext.put("annotation", javaEnumReader.getAnnotationList());
                        velocityContext.put("className", javaEnumReader.getClassName());
                        velocityContext.put("body", javaEnumReader.getBody());
                        velocityContext.put("tool", Tool.class);
                        File file = new File(enums_.getAbsolutePath() + File.separator + f.getName());
                        Template template = velocityEngine.getTemplate("/modules/Java_sdk/module/enums/type.vm", "UTF-8");
                        outputVM(file, template, velocityContext);
                        System.out.println("生成文件" + file.getName() + "成功");
                    }
                    //endregion

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        {
            VelocityContext velocityContext = new VelocityContext();
            velocityContext.put("tool", Tool.class);
            velocityContext.put("domain", domain);
            velocityContext.put("module", module);
            velocityContext.put("managerList", managerList);
            velocityContext.put("methodList", methodList);
            File file = new File(frameWork.getAbsolutePath() + File.separator + module + File.separator + "ApiController.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/module/controller/ApiController.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }

        VelocityContext velocityContext = new VelocityContext();
        velocityContext.put("domain", domain);
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiEntity.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ApiEntity.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiClient.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ApiClient.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiRequest.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ApiRequest.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiFindRequest.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ApiFindRequest.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiSearchRequest.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ApiSearchRequest.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiResponse.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ApiResponse.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiFindResponse.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ApiFindResponse.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "Base64Util.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/Base64Util.vm", "UTF-8");
            outputVM(file, template, velocityContext);
            revert(file);
        }
//        {
//            File file = new File(frameWork.getAbsolutePath() + File.separator + "DefaultApiClient.java");
//            Template template = velocityEngine.getTemplate("/modules/Java_sdk/DefaultApiClient.vm", "UTF-8");
//            outputVM(file, template, velocityContext);
//        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "Error.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/Error.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "SortType.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/SortType.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ErrorType.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ErrorType.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "FileUploadRequest.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/FileUploadRequest.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "FileUploadResponse.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/FileUploadResponse.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "JsonParser.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/JsonParser.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
//        {
//            File file = new File(frameWork.getAbsolutePath() + File.separator + "Main.java");
//            Template template = velocityEngine.getTemplate("/modules/Java_sdk/Main.vm", "UTF-8");
//            outputVM(file, template, velocityContext);
//        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "MD5Util.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/MD5Util.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "RSAUtil.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/RSAUtil.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "StringUtils.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/StringUtils.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ProgressRequestBody.java");
            Template template = velocityEngine.getTemplate("/modules/Java_sdk/ProgressRequestBody.vm", "UTF-8");
            outputVM(file, template, velocityContext);
        }

        return true;
    }


    public class Method {
        private String request;
        private String stringMethod;
        private String manager;
        private String method;
        private String target;

        public String getRequest() {
            return request;
        }

        public void setRequest(String request) {
            this.request = request;
        }

        public String getTarget() {
            return target;
        }

        public void setTarget(String target) {
            this.target = target;
        }

        public String getStringMethod() {
            return stringMethod;
        }

        public void setStringMethod(String stringMethod) {
            this.stringMethod = stringMethod;
        }

        public String getManager() {
            return manager;
        }

        public void setManager(String manager) {
            this.manager = manager;
        }

        public String getMethod() {
            return method;
        }

        public void setMethod(String method) {
            this.method = method;
        }
    }
}
