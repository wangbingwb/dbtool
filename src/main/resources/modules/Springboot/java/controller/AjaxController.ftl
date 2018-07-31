package ${basePackage}.controller;

import com.fasterxml.jackson.core.TreeNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.${moduleName}.mgr.*;
import ${basePackage}.framework.LocalData;
import ${basePackage}.framework.utils.MapperUtil;
import ${basePackage}.framework.Message;
import ${basePackage}.framework.base.BaseResponse;
import ${basePackage}.framework.base.ErrorType;
import ${basePackage}.framework.base.Token;
import ${basePackage}.framework.utils.LogUtil;
import ${basePackage}.framework.base.Error;

@Controller
public class AjaxController {
<#list db.tables as table>
    @Autowired
    private ${table.getCName()}Manager ${table.getFName()}Manager;
</#list>

    @RequestMapping("/ajax")
    @ResponseBody
    public BaseResponse ajax(@RequestParam("method") String method,HttpServletRequest request,HttpServletResponse response) {

        BaseResponse baseResponse = new BaseResponse();
        String line = null;
        TreeNode treeNode = null;
        try {
            if (method == null){
                baseResponse.addError(new Error(ErrorType.BUSINESS_ERROR, "请求方法不能为空!"));
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
                // 示例
                case "ajax.${moduleName}.example":
                    break;
<#list db.tables as table>
                // 创建${table.tableComment}
                case "ajax.${moduleName}.${table.getLName()}.create":
                    baseResponse = create${table.getCName()}(treeNode, token);
                    break;
                // 删除${table.tableComment}
                case "ajax.${moduleName}.${table.getLName()}.delete":
                    baseResponse = delete${table.getCName()}(treeNode, token);
                    break;
                // 修改${table.tableComment}
                case "ajax.${moduleName}.${table.getLName()}.update":
                    baseResponse = update${table.getCName()}(treeNode, token);
                    break;
                // 查询${table.tableComment}
                case "ajax.${moduleName}.${table.getLName()}.find":
                    baseResponse = find${table.getCName()}(treeNode, token);
                    break;
                // 查询所有${table.tableComment}
                case "ajax.${moduleName}.${table.getLName()}.get.all":
                    baseResponse = getAll${table.getCName()}(treeNode, token);
                    break;
                // 获得${table.tableComment}
                case "ajax.${moduleName}.${table.getLName()}.get":
                    baseResponse = get${table.getCName()}(treeNode, token);
                    break;
                // 搜索${table.tableComment}
                case "ajax.${moduleName}.${table.getLName()}.search":
                    baseResponse = search${table.getCName()}(treeNode, token);
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
            if(baseResponse.hasError()) {
                LogUtil.e("请求方法" + method + ", 请求参数：" + line);
                LogUtil.e("返回结果包含异常" + MapperUtil.toJson(baseResponse));
            }
        }
        return baseResponse;
    }

<#list db.tables as table>
    /**
     * 创建${table.tableComment}
     */
    private BaseResponse create${table.getCName()}(TreeNode treeNode, Token token) {
        ${table.getCName()}CreateRequest request = MapperUtil.map(treeNode, ${table.getCName()}CreateRequest.class);
        return ${table.getFName()}Manager.create(request, token);
    }

    /**
     * 删除${table.tableComment}
     */
    private BaseResponse delete${table.getCName()}(TreeNode treeNode, Token token) {
        ${table.getCName()}DeleteRequest request = MapperUtil.map(treeNode, ${table.getCName()}DeleteRequest.class);
        return ${table.getFName()}Manager.delete(request, token);
    }

    /**
     * 修改${table.tableComment}
     */
    private BaseResponse update${table.getCName()}(TreeNode treeNode, Token token) {
        ${table.getCName()}UpdateRequest request = MapperUtil.map(treeNode, ${table.getCName()}UpdateRequest.class);
        return ${table.getFName()}Manager.update(request, token);
    }

    /**
     * 查询${table.tableComment}
     */
    private BaseResponse find${table.getCName()}(TreeNode treeNode, Token token) {
        ${table.getCName()}FindRequest request = MapperUtil.map(treeNode, ${table.getCName()}FindRequest.class);
        return ${table.getFName()}Manager.find(request, token);
    }

    /**
     * 查询所有${table.tableComment}
     */
    private BaseResponse getAll${table.getCName()}(TreeNode treeNode, Token token) {
        ${table.getCName()}GetAllRequest request = MapperUtil.map(treeNode, ${table.getCName()}GetAllRequest.class);
        return ${table.getFName()}Manager.getAll(request, token);
    }

    /**
     * 获得${table.tableComment}
     */
    private BaseResponse get${table.getCName()}(TreeNode treeNode, Token token) {
        ${table.getCName()}GetRequest request = MapperUtil.map(treeNode, ${table.getCName()}GetRequest.class);
        return ${table.getFName()}Manager.get(request, token);
    }

    /**
     * 搜索${table.tableComment}
     */
    private BaseResponse search${table.getCName()}(TreeNode treeNode, Token token) {
        ${table.getCName()}SearchRequest request = MapperUtil.map(treeNode, ${table.getCName()}SearchRequest.class);
        return ${table.getFName()}Manager.search(request, token);
    }

</#list>
}
