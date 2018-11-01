package xyz.wbsite.dbtool.web.controller;

import xyz.wbsite.dbtool.web.framework.LocalData;
import xyz.wbsite.dbtool.web.framework.Message;
import xyz.wbsite.dbtool.web.framework.base.BaseResponse;
import xyz.wbsite.dbtool.web.framework.base.Error;
import xyz.wbsite.dbtool.web.framework.base.ErrorType;
import xyz.wbsite.dbtool.web.framework.base.Token;
import xyz.wbsite.dbtool.web.framework.utils.LogUtil;
import xyz.wbsite.dbtool.web.framework.utils.MapperUtil;
import com.fasterxml.jackson.core.TreeNode;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class AjaxController {

    @RequestMapping("/ajax")
    public BaseResponse ajax(@RequestParam("method") String method, HttpServletRequest request, HttpServletResponse response) {

        BaseResponse baseResponse = new BaseResponse();
        String line = null;
        TreeNode treeNode = null;
        try {
            if (method == null) {
                baseResponse.addError(new xyz.wbsite.dbtool.web.framework.base.Error(ErrorType.BUSINESS_ERROR, "请求方法不能为空!"));
                return baseResponse;
            }
            Token token = LocalData.getToken();
            if (token == null) {
                token = LocalData.getTempToken();
            }
            if (!token.hasResource(method)) {
                baseResponse.addError(new Error(ErrorType.BUSINESS_ERROR, "无权调用该接口!"));
                return baseResponse;
            }

            InputStreamReader isr = new InputStreamReader(request.getInputStream());
            BufferedReader in = new BufferedReader(isr);
            line = in.readLine();
            treeNode = MapperUtil.toTree(line);

            switch (method) {
                // 创建注释
                case "ajax.example.user.create":
//                    baseResponse = createUser(treeNode, token);
                    break;
                default:
                    baseResponse.addError(ErrorType.INVALID_PARAMETER, Message.NOT_EXIST_METHOD);
                    break;
            }

        } catch (Exception ex) {
            baseResponse.addError(ErrorType.SYSTEM_ERROR, Message.ERROR_500);
            LogUtil.dumpException(ex);
        } finally {
            if (baseResponse.hasError()) {
                LogUtil.e("请求方法" + method + ", 请求参数：" + line);
                LogUtil.e("返回结果包含异常" + MapperUtil.toJson(baseResponse));
            }
        }
        return baseResponse;
    }


}
