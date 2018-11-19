package ${basePackage}.framework.springmvc;

import ${basePackage}.framework.utils.LocalData;
import ${basePackage}.framework.base.Token;
import ${basePackage}.framework.utils.LogUtil;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * SpringMVC 全局拦截器，日志记录
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
@Component
public class GlobalHandlerInterceptor extends HandlerInterceptorAdapter {

    @Value("${r"${web.welcome.page}"}")
    private String homePage;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);

        //当请求为@ResponseBody，modelAndView为null,不处理
        if (modelAndView == null){
            return;
        }

        //获取当前用户信息
        Token token = LocalData.getToken();
        modelAndView.addObject("token", token);

        //主页
        modelAndView.addObject("homePath", homePage);

        //获取项目路径,在项目非根路径下用于拼接URL
        String contextPath = request.getContextPath();
        modelAndView.addObject("contextPath", contextPath);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);

        if (ex != null) {
            LogUtil.dumpException(ex);
        }
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        super.afterConcurrentHandlingStarted(request, response, handler);
    }
}
