package xyz.wbsite.dbtool.web.framework.springmvc;

import xyz.wbsite.dbtool.web.framework.LocalData;
import xyz.wbsite.dbtool.web.framework.base.Token;
import xyz.wbsite.dbtool.web.framework.utils.LogUtil;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * SpringMVC 全局拦截器 全局处理，日志记录
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class GlobalHandlerInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);

        //当请求为@ResponseBody，modelAndView为null
        if (modelAndView == null){
            return;
        }

        //获取当前用户信息
        Token token = LocalData.getToken();
        modelAndView.addObject("token", token);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);

        LogUtil.i("请求地址" + request.getServletPath());
        if (ex != null) {
            LogUtil.dumpException(ex);
        }
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        super.afterConcurrentHandlingStarted(request, response, handler);
    }
}
