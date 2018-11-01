package com.wb.dbtool.javafx.manger.callable;

import com.wb.dbtool.javafx.manger.DBManager;
import com.wb.dbtool.javafx.manger.FreeMarkerManager;
import com.wb.dbtool.javafx.manger.ManagerFactory;
import com.wb.dbtool.javafx.po.AbstractDBmapper;
import com.wb.dbtool.javafx.po.Api;
import com.wb.dbtool.javafx.tool.JavaClassReader;
import com.wb.dbtool.javafx.tool.JavaEnumReader;
import com.wb.dbtool.javafx.tool.Tool;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.Callable;

import static com.wb.dbtool.javafx.tool.Tool.clear;

public class SDKCallable implements Callable {

    private File sdk;
    private File req;
    private File rsp;
    private File ent;
    private File enums;
    private List<Api> apis;
    private Tool tool = new Tool();

    private FreeMarkerManager freeMarkerManager;

    public SDKCallable(File sdk, File req, File rsp, File ent, File enums, List<Api> apis) {
        this.sdk = sdk;
        this.req = req;
        this.rsp = rsp;
        this.ent = ent;
        this.enums = enums;
        this.apis = apis;
        this.freeMarkerManager = ManagerFactory.getFreeMarkerManager();
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
            System.out.println("生成模块:Pom");
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("sdk", sdk.getName().toLowerCase());
            File file = new File(sdk.getAbsolutePath() + File.separator + "pom.xml");
            freeMarkerManager.outputTemp(file, "Java_api/pom.ftl", ctx);
        }

        File frameWork = null;
        String domain = null;
        String module = null;
        Set<String> managerList = new HashSet<>();
        List<Method> methodList = new ArrayList<>();

        for (Api api : apis) {
            if (api.isCheck()) {

                try {
                    //region 生成request
                    JavaClassReader javaClassReader = new JavaClassReader(api.getReq());

                    Method method = new Method();
                    method.setStringMethod(api.getMethod());
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

                    managerList.add(method.getManager());

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
                        HashMap<String, Object> ctx = new HashMap<String, Object>();
                        ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                        ctx.put("domain", javaClassReader.getDomainName());
                        ctx.put("module", javaClassReader.getModuleName());
                        ctx.put("importList", javaClassReader.getImportList());
                        ctx.put("annotation", javaClassReader.getAnnotationList());
                        ctx.put("className", javaClassReader.getClassName().replaceAll("Request", ""));
                        ctx.put("body", javaClassReader.getBody());
                        ctx.put("tool", tool);
                        ctx.put("hasList", javaClassReader.isHasList());
                        ctx.put("findOrSearchflag", javaClassReader.getFindOrSearchflag());
                        File file = new File(request.getAbsolutePath() + File.separator + api.getReq().getName());

                        freeMarkerManager.outputTemp(file, "Java_api/module/request/request.ftl", ctx);
                        System.out.println("生成文件" + file.getName() + "成功");
                    }
                    //endregion
                } catch (IOException e) {
                    e.printStackTrace();
                }


                try {
                    //region 生成response
                    JavaClassReader javaClassReader = new JavaClassReader(api.getRsp());

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
                        HashMap<String, Object> ctx = new HashMap<String, Object>();
                        ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                        ctx.put("domain", javaClassReader.getDomainName());
                        ctx.put("module", javaClassReader.getModuleName());
                        ctx.put("importList", javaClassReader.getImportList());
                        ctx.put("annotation", javaClassReader.getAnnotationList());
                        ctx.put("className", javaClassReader.getClassName().replaceAll("Response", ""));
                        ctx.put("body", javaClassReader.getBody());
                        ctx.put("tool", tool);
                        ctx.put("hasList", javaClassReader.isHasList());
                        ctx.put("Tclass", javaClassReader.getTclass());
                        File file = new File(response.getAbsolutePath() + File.separator + api.getRsp().getName().replaceAll("Request", "Response"));

                        freeMarkerManager.outputTemp(file, "Java_api/module/response/response.ftl", ctx);
                        System.out.println("生成文件" + api.getRsp().getName() + "成功");
                    }
                    //endregion
                } catch (IOException e) {
                    e.printStackTrace();
                }

                for (String s : api.getDepReq()) {
                    try {
                        File f = new File(req.getAbsolutePath() + File.separator + s + ".java");
                        if (!f.exists()) {
                            System.err.println("文件" + f.getAbsolutePath() + "不存在");
                            continue;
                        }
                        JavaClassReader javaClassReader = new JavaClassReader(f);

                        Method method = new Method();
                        method.setStringMethod(api.getMethod());
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
                            HashMap<String, Object> ctx = new HashMap<String, Object>();
                            ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                            ctx.put("domain", javaClassReader.getDomainName());
                            ctx.put("module", javaClassReader.getModuleName());
                            ctx.put("importList", javaClassReader.getImportList());
                            ctx.put("annotation", javaClassReader.getAnnotationList());
                            ctx.put("className", javaClassReader.getClassName().replaceAll("Request", ""));
                            ctx.put("body", javaClassReader.getBody());
                            ctx.put("tool", tool);
                            ctx.put("hasList", javaClassReader.isHasList());
                            ctx.put("findOrSearchflag", javaClassReader.getFindOrSearchflag());
                            File file = new File(request.getAbsolutePath() + File.separator + f.getName());

                            freeMarkerManager.outputTemp(file, "Java_api/module/request/request.ftl", ctx);
                            System.out.println("生成文件" + file.getName() + "成功");
                        }
                        //endregion
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                    try {
                        File f = new File(rsp.getAbsolutePath() + File.separator + s.replaceAll("Request", "Response.java"));
                        if (!f.exists()){
                            System.err.println("文件" + f.getAbsolutePath() + "不存在");
                        }
                        JavaClassReader javaClassReader = new JavaClassReader(f);

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
                            HashMap<String, Object> ctx = new HashMap<String, Object>();
                            ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                            ctx.put("domain", javaClassReader.getDomainName());
                            ctx.put("module", javaClassReader.getModuleName());
                            ctx.put("importList", javaClassReader.getImportList());
                            ctx.put("annotation", javaClassReader.getAnnotationList());
                            ctx.put("className", javaClassReader.getClassName().replaceAll("Response", ""));
                            ctx.put("body", javaClassReader.getBody());
                            ctx.put("tool", tool);
                            ctx.put("hasList", javaClassReader.isHasList());
                            ctx.put("Tclass", javaClassReader.getTclass());
                            File file = new File(response.getAbsolutePath() + File.separator + f.getName());

                            freeMarkerManager.outputTemp(file, "Java_api/module/response/response.ftl", ctx);
                            System.out.println("生成文件" + api.getRsp().getName() + "成功");
                        }
                        //endregion
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

                for (String s : api.getDepEnt()) {

                    try {
                        File f = new File(ent.getAbsolutePath() + File.separator + s + ".java");
                        if (!f.exists()) {
                            System.out.println("文件" + f.getAbsolutePath() + "不存在");
                            continue;
                        }
                        JavaClassReader javaClassReader = new JavaClassReader(f);

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
                            HashMap<String, Object> ctx = new HashMap<String, Object>();
                            ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
                            ctx.put("domain", javaClassReader.getDomainName());
                            ctx.put("module", javaClassReader.getModuleName());
                            ctx.put("importList", javaClassReader.getImportList());
                            ctx.put("annotation", javaClassReader.getAnnotationList());
                            ctx.put("className", javaClassReader.getClassName().replaceAll("Entity", ""));
                            ctx.put("body", javaClassReader.getBody());
                            ctx.put("tool", tool);
                            File file = new File(entity.getAbsolutePath() + File.separator + f.getName());
                            freeMarkerManager.outputTemp(file, "Java_api/module/entity/entity.ftl", ctx);
                            System.out.println("生成文件" + file.getName() + "成功");
                        }
                        //endregion
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

                for (String s : api.getDepEnum()) {
                    try {
                        File f = new File(enums.getAbsolutePath() + File.separator + s + ".java");
                        if (!f.exists()) {
                            System.err.println("文件" + f.getAbsolutePath() + "不存在");
                            continue;
                        }
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
                            HashMap<String, Object> ctx = new HashMap<String, Object>();
                            ctx.put("package", "package " + javaEnumReader.getDomainName() + "." + javaEnumReader.getModuleName() + "." + "enums;");
                            ctx.put("domain", javaEnumReader.getDomainName());
                            ctx.put("module", javaEnumReader.getModuleName());
                            ctx.put("annotation", javaEnumReader.getAnnotationList());
                            ctx.put("className", javaEnumReader.getClassName());
                            ctx.put("body", javaEnumReader.getBody());
                            ctx.put("tool", tool);

                            File file = new File(enums_.getAbsolutePath() + File.separator + f.getName());
                            freeMarkerManager.outputTemp(file, "Java_api/module/enums/type.ftl", ctx);
                            System.out.println("生成文件" + file.getName() + "成功");
                        }
                        //endregion

                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }


//        if (req.exists() && rsp.exists() && ent.exists()) {
//            File[] files = req.listFiles();
//            System.out.println("生成模块:Request,Response,Entity");
//            for (File f : files) {
//                try {
//                    //region 生成request
//                    JavaClassReader javaClassReader = new JavaClassReader(f);
//
//                    Method method = new Method();
//                    method.setStringMethod("api." + javaClassReader.getModuleName() + "." + Tool.camelToPoint(javaClassReader.getClassName().replaceAll("Request", "")));
//                    method.setRequest(javaClassReader.getClassName());
//                    method.setTarget(Tool.getRequestTarget(javaClassReader.getClassName()));
//                    method.setMethod(Tool.getRequestAction(javaClassReader.getClassName()));
//                    method.setManager(Tool.getRequestTarget(javaClassReader.getClassName()) + "Manager");
//                    methodList.add(method);
//                    StringBuffer stringBuffer = new StringBuffer("");
//                    stringBuffer.append(sdk.getPath() + File.separator);
//                    stringBuffer.append("src" + File.separator);
//                    stringBuffer.append("main" + File.separator);
//                    stringBuffer.append("java" + File.separator);
//
//                    String[] split = javaClassReader.getDomainName().split("\\.");
//
//
//                    for (String s1 : split) {
//                        stringBuffer.append(s1 + File.separator);
//                    }
//                    if (frameWork == null) {
//                        frameWork = new File(stringBuffer.toString());
//                        frameWork.mkdirs();
//                    }
//                    if (domain == null) {
//                        domain = javaClassReader.getDomainName();
//                    }
//                    if (module == null) {
//                        module = javaClassReader.getModuleName();
//                    }
//
//                    stringBuffer.append(javaClassReader.getModuleName());
//
//                    File request = new File(stringBuffer.toString() + File.separator + "request");
//                    request.mkdirs();
//
//                    {
//                        HashMap<String, Object> ctx = new HashMap<String, Object>();
//                        ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
//                        ctx.put("domain", javaClassReader.getDomainName());
//                        ctx.put("module", javaClassReader.getModuleName());
//                        ctx.put("importList", javaClassReader.getImportList());
//                        ctx.put("annotation", javaClassReader.getAnnotationList());
//                        ctx.put("className", javaClassReader.getClassName().replaceAll("Request", ""));
//                        ctx.put("body", javaClassReader.getBody());
//                        ctx.put("tool", tool);
//                        ctx.put("hasList", javaClassReader.isHasList());
//                        ctx.put("findOrSearchflag", javaClassReader.getFindOrSearchflag());
//                        File file = new File(request.getAbsolutePath() + File.separator + f.getName());
//
//                        freeMarkerManager.outputTemp(file, "Java_api/module/request/request.ftl", ctx);
//                        System.out.println("生成文件" + file.getName() + "成功");
//                    }
//                    //endregion
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//
//                try {
//                    //region 生成response
//                    File r = new File(f.getParent().replaceAll("req", "rsp") + File.separator + f.getName().replaceAll("Request", "Response"));
//                    JavaClassReader javaClassReader = new JavaClassReader(r);
//
//                    StringBuffer stringBuffer = new StringBuffer("");
//                    stringBuffer.append(sdk.getPath() + File.separator);
//                    stringBuffer.append("src" + File.separator);
//                    stringBuffer.append("main" + File.separator);
//                    stringBuffer.append("java" + File.separator);
//
//                    String[] split = javaClassReader.getDomainName().split("\\.");
//
//
//                    for (String s1 : split) {
//                        stringBuffer.append(s1 + File.separator);
//                    }
//
//                    stringBuffer.append(javaClassReader.getModuleName());
//
//                    File response = new File(stringBuffer.toString() + File.separator + "response");
//                    response.mkdirs();
//
//                    {
//                        HashMap<String, Object> ctx = new HashMap<String, Object>();
//                        ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
//                        ctx.put("domain", javaClassReader.getDomainName());
//                        ctx.put("module", javaClassReader.getModuleName());
//                        ctx.put("importList", javaClassReader.getImportList());
//                        ctx.put("annotation", javaClassReader.getAnnotationList());
//                        ctx.put("className", javaClassReader.getClassName().replaceAll("Response", ""));
//                        ctx.put("body", javaClassReader.getBody());
//                        ctx.put("tool", tool);
//                        ctx.put("hasList", javaClassReader.isHasList());
//                        ctx.put("Tclass", javaClassReader.getTclass());
//                        File file = new File(response.getAbsolutePath() + File.separator + f.getName().replaceAll("Request", "Response"));
//
//                        freeMarkerManager.outputTemp(file, "Java_api/module/response/response.ftl", ctx);
//                        System.out.println("生成文件" + r.getName() + "成功");
//                    }
//                    //endregion
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//
//            for (File f : ent.listFiles()) {
//                try {
//                    //region 生成entity
//                    JavaClassReader javaClassReader = new JavaClassReader(f);
//                    managerList.add(javaClassReader.getClassName() + "Manager");
//
//                    StringBuffer stringBuffer = new StringBuffer("");
//                    stringBuffer.append(sdk.getPath() + File.separator);
//                    stringBuffer.append("src" + File.separator);
//                    stringBuffer.append("main" + File.separator);
//                    stringBuffer.append("java" + File.separator);
//
//                    String[] split = javaClassReader.getDomainName().split("\\.");
//
//
//                    for (String s1 : split) {
//                        stringBuffer.append(s1 + File.separator);
//                    }
//
//                    stringBuffer.append(javaClassReader.getModuleName());
//
//                    File entity = new File(stringBuffer.toString() + File.separator + "entity");
//                    entity.mkdirs();
//
//                    {
//                        HashMap<String, Object> ctx = new HashMap<String, Object>();
//                        ctx.put("package", "package " + javaClassReader.getDomainName() + "." + javaClassReader.getModuleName() + "." + "request;");
//                        ctx.put("domain", javaClassReader.getDomainName());
//                        ctx.put("module", javaClassReader.getModuleName());
//                        ctx.put("importList", javaClassReader.getImportList());
//                        ctx.put("annotation", javaClassReader.getAnnotationList());
//                        ctx.put("className", javaClassReader.getClassName().replaceAll("Entity", ""));
//                        ctx.put("body", javaClassReader.getBody());
//                        ctx.put("tool", tool);
//                        File file = new File(entity.getAbsolutePath() + File.separator + f.getName());
//                        freeMarkerManager.outputTemp(file, "Java_api/module/entity/entity.ftl", ctx);
//                        System.out.println("生成文件" + file.getName() + "成功");
//                    }
//                    //endregion
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        } else {
//            return false;
//        }
//
//        if (enums.exists()) {
//            System.out.println("生成模块:Enums");
//            for (File f : enums.listFiles()) {
//                try {
//                    //region 生成enums
//                    JavaEnumReader javaEnumReader = new JavaEnumReader(f);
//
//                    StringBuffer stringBuffer = new StringBuffer("");
//                    stringBuffer.append(sdk.getPath() + File.separator);
//                    stringBuffer.append("src" + File.separator);
//                    stringBuffer.append("main" + File.separator);
//                    stringBuffer.append("java" + File.separator);
//
//                    String[] split = javaEnumReader.getDomainName().split("\\.");
//
//
//                    for (String s1 : split) {
//                        stringBuffer.append(s1 + File.separator);
//                    }
//
//                    stringBuffer.append(javaEnumReader.getModuleName());
//
//                    File enums_ = new File(stringBuffer.toString() + File.separator + "enums");
//                    enums_.mkdirs();
//
//                    {
//                        HashMap<String, Object> ctx = new HashMap<String, Object>();
//                        ctx.put("package", "package " + javaEnumReader.getDomainName() + "." + javaEnumReader.getModuleName() + "." + "enums;");
//                        ctx.put("domain", javaEnumReader.getDomainName());
//                        ctx.put("module", javaEnumReader.getModuleName());
//                        ctx.put("annotation", javaEnumReader.getAnnotationList());
//                        ctx.put("className", javaEnumReader.getClassName());
//                        ctx.put("body", javaEnumReader.getBody());
//                        ctx.put("tool", tool);
//
//                        File file = new File(enums_.getAbsolutePath() + File.separator + f.getName());
//                        freeMarkerManager.outputTemp(file, "Java_api/module/enums/type.ftl", ctx);
//                        System.out.println("生成文件" + file.getName() + "成功");
//                    }
//                    //endregion
//
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }

        {
            System.out.println("生成模块:ApiController");
            HashMap<String, Object> ctx = new HashMap<String, Object>();
            ctx.put("tool", tool);
            ctx.put("domain", domain);
            ctx.put("module", module);
            ctx.put("managerList", managerList);
            ctx.put("methodList", methodList);
            File file = new File(frameWork.getAbsolutePath() + File.separator + module + File.separator + "ApiController.java");
            freeMarkerManager.outputTemp(file, "Java_api/module/controller/ApiController.ftl", ctx);
        }

        System.out.println("生成基础类");
        HashMap<String, Object> ctx = new HashMap<String, Object>();
        ctx.put("domain", domain);
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiEntity.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ApiEntity.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "AESUtil.java");
            freeMarkerManager.outputTemp(file, "/Java_api/AESUtil.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiClient.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ApiClient.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiRequest.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ApiRequest.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiFindRequest.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ApiFindRequest.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiSearchRequest.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ApiSearchRequest.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiResponse.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ApiResponse.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ApiFindResponse.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ApiFindResponse.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "Base64Util.java");
            freeMarkerManager.outputTemp(file, "/Java_api/Base64Util.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "DownloadUtil.java");
            freeMarkerManager.outputTemp(file, "/Java_api/DownloadUtil.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "Error.java");
            freeMarkerManager.outputTemp(file, "/Java_api/Error.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ErrorType.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ErrorType.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "FileUploadRequest.java");
            freeMarkerManager.outputTemp(file, "/Java_api/FileUploadRequest.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "FileUploadResponse.java");
            freeMarkerManager.outputTemp(file, "/Java_api/FileUploadResponse.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "MapperUtil.java");
            freeMarkerManager.outputTemp(file, "/Java_api/MapperUtil.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "MD5Util.java");
            freeMarkerManager.outputTemp(file, "/Java_api/MD5Util.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "RSAUtil.java");
            freeMarkerManager.outputTemp(file, "/Java_api/RSAUtil.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ProgressRequestBody.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ProgressRequestBody.ftl", ctx);
        }

        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "SortType.java");
            freeMarkerManager.outputTemp(file, "/Java_api/SortType.ftl", ctx);
        }

        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "StringUtils.java");
            freeMarkerManager.outputTemp(file, "/Java_api/StringUtils.ftl", ctx);
        }
        {
            File file = new File(frameWork.getAbsolutePath() + File.separator + "ValidationUtil.java");
            freeMarkerManager.outputTemp(file, "/Java_api/ValidationUtil.ftl", ctx);
        }
        System.out.println("finish");
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
