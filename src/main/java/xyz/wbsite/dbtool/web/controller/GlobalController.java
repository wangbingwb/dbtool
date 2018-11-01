package xyz.wbsite.dbtool.web.controller;

import xyz.wbsite.dbtool.web.framework.utils.LogUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@ControllerAdvice
public class GlobalController {

    /**
     * 全局异常捕捉
     *
     * @param request
     * @param response
     * @param exception 要捕获的异常
     * @return
     */
    @ExceptionHandler(Exception.class)
    public String excepitonHandler(HttpServletRequest request, HttpServletResponse response, Model model, Exception exception) {
        StringBuffer msg = new StringBuffer("");
        if (exception != null) {
            msg = new StringBuffer("");
            String message = exception.toString();
            int length = exception.getStackTrace().length;
            if (length > 0) {
                msg.append("<a>").append(message).append("</a><br>");
                for (int i = 0; i < length; i++) {
                    msg.append("<a>").append(exception.getStackTrace()[i]).append("</a><br>");
                }
            } else {
                msg.append(message);
            }
        }
        model.addAttribute("msg", msg.toString());
        return "500";
    }

    /**
     * 当未明确指定控制器时，走该请求，默认返回对应的layout布局和screen视图
     *
     * @param model
     * @param request
     */
    @RequestMapping("**^\\.*")
    public void hold(HttpServletRequest request, HttpServletResponse response, Model model) {

        LogUtil.i("未明确指定控制器访问路径:" + request.getRequestURI());

        //todo 可在此获取公共部分数据，例如用户信息等。其他业务数据在页面渲染后通过Ajax请求
    }

    /**
     * 当需要使用layout时，不需要返回值，ViewNameTranslator会处理对应关系
     *
     * @param model
     * @param request
     */
    @RequestMapping({"/", "index"})
    public void index(Model model, HttpServletRequest request) throws Exception {
        model.addAttribute("hello", "Hello world!!!");
        model.addAttribute("status", 0);

        ArrayList<String> citys = new ArrayList<>();
        citys.add("北京");
        citys.add("上海");
        citys.add("深圳");
        model.addAttribute("citys", citys);
    }
}
