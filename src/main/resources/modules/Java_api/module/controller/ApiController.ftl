package ${domain}.controller;

import com.fasterxml.jackson.core.TreeNode;
import ${domain}.${module}.mgr.*;
import ${domain}.${module}.req.*;
import ${domain}.framework.base.BaseResponse;
import ${domain}.framework.base.ErrorType;
import ${domain}.framework.base.Token;
import ${domain}.framework.utils.*;
import org.springframework.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class ApiController {
    //基本请求参数KEY
    private static final String P_APP_KEY = "app_key";
    private static final String P_TYPE = "type";
    private static final String P_TARGET = "target";
    private static final String P_TARGET_JSON = "target_json";
    private static final String P_TIMESTAMP = "timestamp";
    private static final String P_METHOD = "method";
    private static final String P_SIGN = "sign";
    private static final String P_ENHANCED = "enhanced";
    //安全模式，签名或加密
    private static final String MODE_SIGN = "sign";
    private static final String MODE_ENCRYPTION = "encryption";
    //参数类型
    private static final String TYPE_JSON = "json";
    private static final String TYPE_FILE = "file";
    //签名方式
    private static final String SIGN_METHOD_MD5 = "MD5";
    private static final String SIGN_METHOD_RSA = "RSA";
    //加密方式
    private static final String ENCRYPTION_METHOD_MD5 = "MD5";
    private static final String ENCRYPTION_METHOD_RSA = "RSA";

    private static final String APP_SECRET = "app_secret";

<#list managerList as i>
    @Autowired
    private ${tool.abb2Abb(i)} ${tool.Abb2abb(i)};
</#list>

    @RequestMapping("/api")
    @ResponseBody
    public String api(HttpServletRequest request) {
        BaseResponse baseResponse = new BaseResponse();
        //安全认证
        validate(request, baseResponse);

        //权限认证
        if (!baseResponse.hasError()) {
            authenticate(request, baseResponse);
        }

        // 业务处理
        if (!baseResponse.hasError()) {
            baseResponse = handle(request);
        }

        return encrypt(request,baseResponse);
    }

    private String encrypt(HttpServletRequest request,BaseResponse baseResponse){
        String enhanced = request.getParameter(P_ENHANCED);
        boolean isEnhanced = !StringUtils.isEmpty(enhanced) && "true".equals(enhanced);
        byte[] bytes = MapperUtil.toJson(baseResponse).getBytes();
        if (isEnhanced){
            return RSAUtil.encrypt2Base64(bytes);
        }else {
            return AESUtil.encrypt2Base64(bytes, APP_SECRET);
        }
    }

    /**
     * 请求处理器
     *
     * @param request
     * @return
     */
    private BaseResponse handle(HttpServletRequest request) {

        //File请求处理
        if (TYPE_FILE.equals(request.getParameter(P_TYPE))) {
            return handleFILE(request);
        }
        //JSON请求处理
        if (TYPE_JSON.equals(request.getParameter(P_TYPE))) {
            return handleJSON(request);
        }

        BaseResponse baseResponse = new BaseResponse();
        baseResponse.addError(ErrorType.BUSINESS_ERROR, "请求未处理");
        return baseResponse;
    }

    /**
     * 上传文件请求处理
     *
     * @param request
     * @return
     */
    private BaseResponse handleFILE(HttpServletRequest request) {
        BaseResponse baseResponse = new BaseResponse();
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile target = multipartHttpServletRequest.getFile(P_TARGET);

        String fileName = target.getOriginalFilename();

        //========
        //处理文件
        //========

        if (target != null) {
            baseResponse.addError(ErrorType.BUSINESS_ERROR, "文件上传成功,但未处理文件[" + fileName + "]!");
        }else {
            baseResponse.addError(ErrorType.BUSINESS_ERROR, "文件上传失败!");
        }

        return baseResponse;
    }

    private BaseResponse handleJSON(HttpServletRequest request){
        BaseResponse baseResponse = new BaseResponse();
        String method = null;
        String targetJson = null;
        try {
            method = request.getParameter(P_METHOD);
            targetJson = (String) request.getAttribute(P_TARGET_JSON);
            if (method == null) {
                baseResponse.addError(ErrorType.BUSINESS_ERROR, "请求方法不能为空!");
                return baseResponse;
            }
            if (targetJson == null) {
                baseResponse.addError(ErrorType.BUSINESS_ERROR, "请求目标不能为空!");
                return baseResponse;
            }

            switch (method) {
<#list methodList as m >
                case "${m.stringMethod}":
                    baseResponse = ${m.target}${tool.abb2Abb(m.method)}(targetJson, LocalData.getToken());
                    break;
</#list>
                default:
                    baseResponse.addError(ErrorType.INVALID_PARAMETER, Message.NOT_EXIST_METHOD);
                    break;
            }

        } catch (Exception ex) {
            baseResponse.addError(ErrorType.SYSTEM_ERROR, Message.ERROR_500);
            LogUtil.dumpException(ex);
        } finally {
            if (baseResponse.hasError()) {
                LogUtil.e("请求方法:" + method + ", 请求目标:" + targetJson);
                LogUtil.e("错误原因:" + MapperUtil.toJson(baseResponse.getErrors()));
            }
        }
        return baseResponse;
    }

    /**
     * 安全认证
     *
     * @param request
     * @return
     */
    private void validate(HttpServletRequest request, BaseResponse baseResponse) {
        String type = request.getParameter(P_TYPE);
        String timestamp = request.getParameter(P_TIMESTAMP);
        String sign = request.getParameter(P_SIGN);
        String enhanced = request.getParameter(P_ENHANCED);
        boolean isEnhanced = !StringUtils.isEmpty(enhanced) && "true".equals(enhanced);

        if (TYPE_JSON.equals(type)) {
            String target = request.getParameter(P_TARGET);
            String jsonString = null;
            try {
                if (isEnhanced) {
                    jsonString = RSAUtil.decrypt2String(target);
                } else {
                    jsonString = AESUtil.decrypt2String(target, APP_SECRET);
                }
            }catch (Exception e){
                baseResponse.addError(ErrorType.BUSINESS_ERROR,"Target解码错误,请确认编码是否正确!");
                return;
            }

            String sign_ = MD5Util.encode(APP_SECRET + jsonString + timestamp);
            if (!sign_.equals(sign)) {
                baseResponse.addError(ErrorType.BUSINESS_ERROR, "签名验证失败");
            }
            request.setAttribute(P_TARGET_JSON,jsonString);
        } else if (TYPE_FILE.equals(type)) {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            MultipartFile file = multipartHttpServletRequest.getFile(P_TARGET);

            try {
                String sign_ = MD5Util.encode(APP_SECRET + MD5Util.encode(file.getBytes()) + timestamp);

                if (!sign_.equals(sign)) {
                    baseResponse.addError(ErrorType.BUSINESS_ERROR, "签名验证失败");
                }
            } catch (IOException e) {
                baseResponse.addError(ErrorType.BUSINESS_ERROR, "签名验证失败");
            }
            return;
        }

        if (!baseResponse.hasError()){//时效性验证
            long timestamp_ = Long.parseLong(timestamp);
            long currentTime = System.currentTimeMillis();
            if (currentTime - timestamp_ > 2 * 60 * 1000) {
                baseResponse.addError(ErrorType.BUSINESS_ERROR, "请求过期, 或本地时间错误.");
            }
        }
    }

    private void authenticate(HttpServletRequest request, BaseResponse baseResponse){
        Token token = new Token();
        token.setId(0L);
        token.setUserId(0L);
        token.setUserName("admin");
        LocalData.setToken(token);
    }

<#list methodList as m>
    private BaseResponse ${m.target}${tool.abb2Abb(m.method)}(String targetJson, Token token) {
        ${m.request} request = MapperUtil.toJava(targetJson, ${m.request}.class);
        return ${m.manager}.${m.method}(request, token);
    }
</#list>
}
