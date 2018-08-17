package ${domain};

import com.alibaba.fastjson.JSON;
import com.wb.sdk.auth.request.LoginRequest;
import com.wb.sdk.auth.response.LoginResponse;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {

    public static void main(String[] args) throws ClassNotFoundException {

        //实例化API请求客户端
        DefaultApiClient defaultApiClient = new DefaultApiClient("http://localhost:8080/api", "qwe", "asd");
        //设置发送网络请求前的统一操作
        defaultApiClient.setBefore(new DefaultApiClient.Before() {
            public void call(ApiRequest request) {
                System.out.println("请求参数" + JSON.toJSONString(request));
                System.out.println("请求方法" + request.apiMethod());
            }
        });
        //设置网络请求完成后的统一操作
        defaultApiClient.setAfter(new DefaultApiClient.After() {
            public void call(ApiRequest request, ApiResponse response) {
                System.out.println("响应参数" + JSON.toJSONString(response));
            }
        });
        final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");

        {
            //同步接口请求实例
            System.out.println("--------------------同步接口请求实例-------------------");
            Date start = new Date();
            System.out.println(simpleDateFormat.format(start));
            LoginRequest loginRequest = new LoginRequest();
            loginRequest.setUserName("admin");
            loginRequest.setPassword("123456");
            LoginResponse execute = defaultApiClient.execute(loginRequest);
            Date end = new Date();
            System.out.println(simpleDateFormat.format(end));
            System.out.println("共用" + (end.getTime() - start.getTime()) + "毫秒");
            System.out.println("--------------------同步接口请求实例-------------------");
        }


        {
            //文件上传接口请求实例
            System.out.println("--------------------文件上传接口请求实例-------------------");
            Date start = new Date();
            System.out.println(simpleDateFormat.format(start));
            FileUploadRequest fileUploadRequest = new FileUploadRequest();
            fileUploadRequest.setFile(new File("E:\\doc\\pic\\QQ截图20160918164514.jpg"));
            defaultApiClient.fileUpload(fileUploadRequest, new ApiClient.Callback<FileUploadResponse>() {
                public void call(FileUploadResponse response) {
                    System.out.println("文件上传接口请求实例" + JSON.toJSONString(response));
                    Date end = new Date();
                    System.out.println(simpleDateFormat.format(end));
                    System.out.println("共用" + (end.getTime() - start.getTime()) + "毫秒");
                    System.out.println("--------------------文件上传接口请求实例-------------------");
                }
            });
        }

        {
            //异步接口请求实例
            System.out.println("--------------------异步接口请求实例-------------------");
            final Date start = new Date();
            System.out.println(simpleDateFormat.format(start));
            LoginRequest loginRequest = new LoginRequest();
            loginRequest.setUserName("admin");
            loginRequest.setPassword("123456");
            defaultApiClient.asyncExecute(loginRequest, 1L, new ApiClient.Callback<LoginResponse>() {
                public void call(LoginResponse response) {
                    System.out.println("异步接口请求响应" + JSON.toJSONString(response));

                    Date end = new Date();
                    System.out.println(simpleDateFormat.format(end));
                    System.out.println("共用" + (end.getTime() - start.getTime()) + "毫秒");
                    System.out.println("--------------------异步接口请求实例-------------------");
                }
            });
        }

    }
}
