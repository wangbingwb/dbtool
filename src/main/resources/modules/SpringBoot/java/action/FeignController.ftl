package ${basePackage}.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
<#list modules as m>
import ${basePackage}.${m.moduleName}.req.*;
import ${basePackage}.${m.moduleName}.mgr.*;
</#list>
import ${basePackage}.framework.utils.LocalData;
import ${basePackage}.framework.utils.MapperUtil;
import ${basePackage}.framework.utils.Message;
import ${basePackage}.framework.base.BaseResponse;
import ${basePackage}.framework.base.ErrorType;
import ${basePackage}.framework.base.Token;
import ${basePackage}.framework.utils.LogUtil;
import ${basePackage}.framework.base.Error;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
@RequestMapping("/feign")
public class FeignController {
<#list modules as m>
<#list m.tables as table>
    @Autowired
    private ${table.getCName()}Manager ${table.getFName()}Manager;
</#list>
</#list>

    @RequestMapping(value = "/user/create", method = RequestMethod.POST)
    public BaseResponse d(@RequestBody NewTableGetRequest asd) {

        return newTableGetResponse;
    }
}
