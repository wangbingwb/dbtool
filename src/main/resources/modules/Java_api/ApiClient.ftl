package ${domain};

import okhttp3.*;
import java.io.*;
import java.net.ConnectException;
import java.net.SocketTimeoutException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.security.PublicKey;
import ${domain}.MapperUtil;

public class ApiClient {
    private static ApiClient ourInstance = null;

    public static void init(String serverUrl, String appKey, String appSecret) {
        init(serverUrl, appKey, appSecret, DEFAULT_CONNECT_TIMEOUT, DEFAULT_READ_TIMEOUT);
    }

    public static void init(String serverUrl, String appKey, String appSecret, int connectTimeout, int readTimeout) {
        ourInstance = new ApiClient(serverUrl, appKey, appSecret, connectTimeout, readTimeout);
    }

    public static ApiClient getInstance() {
        if (ourInstance == null) {
            System.err.print("ApiClient need init");
        }
        return ourInstance;
    }

    //基本请求参数KEY
    private static final String P_APP_KEY = "app_key";
    private static final String P_TYPE = "type";
    private static final String P_TARGET = "target";
    private static final String P_TIMESTAMP = "timestamp";
    private static final String P_METHOD = "method";
    private static final String P_SIGN = "sign";
    private static final String P_TOKEN = "token_id";
    private static final String P_ENHANCED = "enhanced";
    //参数类型
    private static final String TYPE_JSON = "json";
    private static final String TYPE_FILE = "file";
    //基本请求参数value
    private String appKey;
    private String appSecret;
    private String serverUrl;
    private OkHttpClient httpClient = null;
    //默认参数
    private static final int DEFAULT_CONNECT_TIMEOUT = 3;//秒
    private static final int DEFAULT_READ_TIMEOUT = 30;//秒
    //全局公钥
    private PublicKey publicKey = null;
    //一次性公钥，一般针对个别请求
    private PublicKey onecPublicKey = null;
    //请求配置
    private int connectTimeout;//3秒
    private int readTimeout;//30秒
    private boolean needCheckRequest = true; // 是否在客户端校验请求
    private boolean needEnableParser = true; // 是否对响应结果进行解释

    private Before before = null;
    private After after = null;
    private String token = "";
    private boolean debug = false;
    private boolean isEnhanced = false;

    public void setEnhanced(boolean enhanced,PublicKey publicKey) {
        isEnhanced = enhanced;
        this.publicKey = publicKey;
    }

    private ApiClient(String serverUrl, String appKey, String appSecret, int connectTimeout, int readTimeout) {
        this.connectTimeout = connectTimeout;
        this.readTimeout = readTimeout;
        this.appKey = appKey;
        this.appSecret = appSecret;
        this.publicKey = publicKey;
        this.serverUrl = serverUrl;
        this.httpClient = new OkHttpClient.Builder()
                .readTimeout(readTimeout, TimeUnit.SECONDS)
                .connectTimeout(connectTimeout, TimeUnit.SECONDS)
                .build();
    }

    public interface Callback<T extends ApiResponse> {
        void call(T response);
    }

    public interface Before {
        void call(ApiRequest request);
    }

    public interface After {
        void call(ApiRequest request, ApiResponse response);
    }

    public void setAfter(After after) {
        this.after = after;
    }

    public void setBefore(Before before) {
        this.before = before;
    }

    public <T extends ApiResponse> T execute(ApiRequest<T> request) {
        if (before != null) {
            before.call(request);
        }

        // 检查请求参数
        T t = MapperUtil.toJava("{}",request.responseClass());
        ValidationUtil.validate(request,t);
        if (t.hasError()){
            return t;
        }

        try {
            //装载请求参数
            String currentTime = String.valueOf(System.currentTimeMillis());
            RequestBody requestBody = new FormBody.Builder()
                    .add(P_APP_KEY, appKey)
                    .add(P_METHOD, request.apiMethod())
                    .add(P_TYPE, TYPE_JSON)
                    .add(P_TARGET, MapperUtil.toJson(request))
                    .add(P_TIMESTAMP, currentTime)
                    .add(P_SIGN, sign(request, currentTime))
                    .add(P_ENHANCED, isEnhanced?"true":"false")
                    .add(P_TOKEN, token)
                    .build();

            Request build = new Request.Builder()
                    .url(serverUrl)
                    .post(requestBody)
                    .build();

            Response response = httpClient.newCall(build).execute();
            String responseJson = decryptResponse(response);
            t = MapperUtil.toJava(responseJson, request.responseClass());

        } catch (Exception e) {
            t = MapperUtil.toJava("{}",request.responseClass());
            t.addError(ErrorType.SYSTEM_ERROR, "请求异常!");
        } finally {
            if (after != null) {
                after.call(request, t);
            }
        }
        return t;
    }

    public <T extends ApiResponse> void execute(final ApiRequest<T> request, final Callback callback) {
        if (before != null) {
            before.call(request);
        }

        // 检查请求参数
        T t = MapperUtil.toJava("{}",request.responseClass());
        ValidationUtil.validate(request,t);
        if (t.hasError()){
            if (after != null) {
                after.call(request, t);
            }
            if (callback != null) {
                callback.call(t);
            }
            return;
        }

        try {
            //装载请求参数
            String currentTime = String.valueOf(System.currentTimeMillis());
            RequestBody requestBody = new FormBody.Builder()
                    .add(P_APP_KEY, appKey)
                    .add(P_METHOD, request.apiMethod())
                    .add(P_TYPE, TYPE_JSON)
                    .add(P_TARGET, encode(request))
                    .add(P_TIMESTAMP, currentTime)
                    .add(P_SIGN, sign(request, currentTime))
                    .add(P_ENHANCED, isEnhanced?"true":"false")
                    .add(P_TOKEN, token)
                    .build();

            Request build = new Request.Builder()
                    .url(serverUrl)
                    .post(requestBody)
                    .build();

            httpClient.newCall(build).enqueue(new okhttp3.Callback() {
                public void onFailure(Call call, IOException e) {
                    e.printStackTrace();
                    T t = MapperUtil.toJava("{}", request.responseClass());
                    if (e instanceof ConnectException) {
                        t.addError(ErrorType.BUSINESS_ERROR, "网络连接错误!");
                    } else if (e instanceof SocketTimeoutException) {
                        t.addError(ErrorType.BUSINESS_ERROR, "连接超时!");
                    } else {
                        t.addError(ErrorType.BUSINESS_ERROR, "请求错误!");
                    }

                    if (after != null) {
                        after.call(request, t);
                    }
                    if (callback != null) {
                        callback.call(t);
                    }
                }

                public void onResponse(Call call, Response response) throws IOException {
                    T t = null;
                    try {

                        String responseJson = decryptResponse(response);
                        t = MapperUtil.toJava(responseJson, request.responseClass());

                    } catch (Exception e) {
                        e.printStackTrace();
                        t = MapperUtil.toJava("{}", request.responseClass());
                        t.addError(ErrorType.BUSINESS_ERROR, "服务器异常!");
                    }
                    if (after != null) {
                        after.call(request, t);
                    }
                    if (callback != null) {
                        callback.call(t);
                    }
                }
            });
        } catch (Exception e) {
            T baseResponse = MapperUtil.toJava("{}",request.responseClass());
            baseResponse.addError(ErrorType.SYSTEM_ERROR, "请求异常!");
            if (after != null) {
                after.call(request, baseResponse);
            }
            if (callback != null) {
                callback.call(baseResponse);
            }
        }
    }

    public void fileUpload(FileUploadRequest request, Callback<FileUploadResponse> callback) {
        fileUpload(request, callback, null);
    }

    public void fileUpload(final FileUploadRequest request, final Callback<FileUploadResponse> callback, ProgressRequestBody.ProgressListener listener) {
        if (before != null) {
            before.call(request);
        }

        try {
            //检查文件是否存在
            File file = request.getFile();
            if (!file.exists()) {
                FileUploadResponse fileUploadResponse = new FileUploadResponse();
                fileUploadResponse.addError(ErrorType.BUSINESS_ERROR, "文件不存在!");
                if (after != null) {
                    after.call(request, fileUploadResponse);
                }
                callback.call(fileUploadResponse);
                return;
            }

            //装载请求参数
            String currentTime = String.valueOf(System.currentTimeMillis());
            MultipartBody multipartBody = new MultipartBody.Builder()
                    .addFormDataPart(P_APP_KEY, appKey)
                    .addFormDataPart(P_METHOD, request.apiMethod())
                    .addFormDataPart(P_TYPE, TYPE_FILE)
                    .addFormDataPart(P_TIMESTAMP, currentTime)
                    .addFormDataPart(P_SIGN, sign(request, currentTime))
                    .addFormDataPart(P_TOKEN, token)
                    .addFormDataPart(P_TARGET, request.getFile().getName(), ProgressRequestBody.createProgressRequestBody(MediaType.parse("image/*"), request.getFile(), listener))
                    .build();

            Request build = new Request.Builder()
                    .url(serverUrl)
                    .post(multipartBody)
                    .build();

            httpClient.newCall(build).enqueue(new okhttp3.Callback() {
                public void onFailure(Call call, IOException e) {
                    e.printStackTrace();
                    FileUploadResponse t = MapperUtil.toJava("{}", FileUploadResponse.class);
                    if (e instanceof ConnectException) {
                        t.addError(ErrorType.BUSINESS_ERROR, "网络连接错误!");
                    } else if (e instanceof SocketTimeoutException) {
                        t.addError(ErrorType.BUSINESS_ERROR, "连接超时!");
                    } else {
                        t.addError(ErrorType.BUSINESS_ERROR, "请求错误!");
                    }

                    if (after != null) {
                        after.call(request, t);
                    }
                    if (callback != null) {
                        callback.call(t);
                    }
                }

                public void onResponse(Call call, Response response) throws IOException {

                    FileUploadResponse t = null;
                    try {

                        String responseJson = decryptResponse(response);
                        t = MapperUtil.toJava(responseJson, FileUploadResponse.class);

                    } catch (Exception e) {
                        e.printStackTrace();
                        t = new FileUploadResponse();
                        t.addError(ErrorType.BUSINESS_ERROR, "服务器异常!");
                    }

                    if (after != null) {
                        after.call(request, t);
                    }
                    if (callback != null) {
                        callback.call(t);
                    }
                }
            });

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 对请求进行加密编码
     *
     * @param request
     * @return
     */
    private String encode(ApiRequest request) {
        String json = MapperUtil.toJson(request);
        if (isEnhanced) {
            return RSAUtil.encrypt(json, onecPublicKey != null ? onecPublicKey : publicKey);
        } else {
            return AESUtil.encrypt2Base64(json.getBytes(), appSecret);
        }
    }

    /**
     * 对响应进行解密
     *
     * @param response
     * @return
     */
    private String decryptResponse(Response response) throws IOException {
        String responseString = response.body().string();
        String responseJson = AESUtil.decrypt2String(responseString, appSecret);
        if (debug) {
            System.out.println("加密响应结果:" + responseString);
            System.out.println("响应结果:" + responseJson);
        }
        return responseJson;
    }

    /**
     * 对请求进行签名
     *
     * @param request
     * @return
     */
    private String sign(ApiRequest request, String currentTime) {
        if (request instanceof FileUploadRequest) {//文件签名、对文件字节生成的信息摘要签名
            FileUploadRequest fileUploadRequest = (FileUploadRequest) request;
            String encode = MD5Util.encode(toByteArray(fileUploadRequest.getFile()));
            return MD5Util.encode(appSecret + encode + currentTime);
        } else {//普通参数签名、此处JSON是经过排序生成的JSON字符串,因此验签时也需要排序
            String json = MapperUtil.toJson(request);
            return MD5Util.encode(appSecret + json + currentTime);
        }
    }

    private static byte[] toByteArray(File file) {
        File f = file;
        if (!f.exists()) {
            return null;
        }
        ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
        BufferedInputStream in = null;
        try {
            in = new BufferedInputStream(new FileInputStream(f));
            int buf_size = 1024;
            byte[] buffer = new byte[buf_size];
            int len = 0;
            while (-1 != (len = in.read(buffer, 0, buf_size))) {
                bos.write(buffer, 0, len);
            }
            return bos.toByteArray();
        } catch (IOException e) {
            return null;
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void setTokenId(String token) {
        this.token = token;
    }

    public boolean isDebug() {
        return debug;
    }

    public void setDebug(boolean debug) {
        this.debug = debug;
    }

    public static void main(String[] args) {

        //实例化API请求客户端
        ApiClient.init("http://localhost:8080/api", "app_key", "app_secret");
        ApiClient client = ApiClient.getInstance();

        final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        //设置发送网络请求前的统一操作
        client.setBefore(new Before() {
            public void call(ApiRequest request) {
                System.out.println("请求参数" + MapperUtil.toJson(request));
                System.out.println("请求方法" + request.apiMethod());
            }
        });
        //设置网络请求完成后的统一操作
        client.setAfter(new After() {
            public void call(ApiRequest request, ApiResponse response) {
                System.out.println("响应参数" + MapperUtil.toJson(response));
                Date end = new Date();
                System.out.println(simpleDateFormat.format(end));
            }
        });

        //json请求
        //json请求
//        News news = new News();
//        news.setNewField("CODE");
//        news.setNewField1(1L);
//
//        NewsCreateRequest newsCreateRequest = new NewsCreateRequest();
//        newsCreateRequest.setContent("asd");
//        newsCreateRequest.setNewField("asd");
//        newsCreateRequest.setPublisher("asd");
//        client.execute(newsCreateRequest, new ApiClient.Callback<NewsCreateResponse>() {
//            public void call(NewsCreateResponse response) {
//
//                System.out.println(MapperUtil.toJson(response));
//            }
//        });
//
//        {//无进度显示
//            final Date start = new Date();
//
//            //文件上传请求
//            FileUploadRequest fileUploadRequest = new FileUploadRequest();
//            fileUploadRequest.setFile(new File("D:\\1.PNG"));
//            client.fileUpload(fileUploadRequest, new Callback<FileUploadResponse>() {
//                public void call(FileUploadResponse response) {
//                    Date end = new Date();
//                    System.out.println("无进度显示" + (end.getTime() - start.getTime()));
//                }
//            });
//        }
//
//        {//有进度显示
//            final Date start = new Date();
//
//            //文件上传请求
//            FileUploadRequest fileUploadRequest = new FileUploadRequest();
//            fileUploadRequest.setFile(new File("D:\\1.PNG"));
//            client.fileUpload(fileUploadRequest, new Callback<FileUploadResponse>() {
//                public void call(FileUploadResponse response) {
//                    Date end = new Date();
//                    System.out.println("有进度显示" + (end.getTime() - start.getTime()));
//                }
//            }, new ProgressRequestBody.ProgressListener() {
//                public void onProgress(long totalBytes, long remainingBytes, boolean done) {
//                    System.out.println((totalBytes - remainingBytes) * 100 / totalBytes + "%");
//                }
//            });
//        }

    }
}
