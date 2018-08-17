package ${basePackage}.${moduleName}.filter;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import ${basePackage}.framework.base.Token;
import ${basePackage}.framework.utils.LocalData;

/**
 * 登录验证过滤器
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class Authorizations implements Filter {

    ApplicationContext applicationContext;
    ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        context = filterConfig.getServletContext();
        applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
        //获取java Bean
        //userManager = applicationContext.getBean(UserManager.class);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        /* 获取要访问的路径 */
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        String path = httpServletRequest.getServletPath();

        //以下Api无需授权，Api自己会处理
        if ("/api".equals(path)) {
            chain.doFilter(request, response);
            return;
        }

        //静态文件url不需要验证权限,放行
        String[] suffixes = {".css", ".js", "$", ".jpg", ".eot", "svg", "less", ".gif", ".png", ".ttf", ".woff", ".ico", ".xls"};
        for (String suffix : suffixes) {
            if (path.contains(suffix)) {
                chain.doFilter(request, response);
                return;
            }
        }

        // 获取Token
        // 实现自己的用户认证和授权
        // LocalData.setToken(new Token());

        Token token = LocalData.getToken();
        if (token == null){
            token = LocalData.getTempToken();
        }
        //授权
        if (token.hasResource(path)) {
            chain.doFilter(request, response);
        } else {
            gotoLoginPage(request, response, chain, httpServletRequest, httpServletResponse);
        }
    }

    /**
    * 跳至登录页面
    */
    private void gotoLoginPage(ServletRequest request, ServletResponse response, FilterChain chain, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException, ServletException {
        String basePath = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":" + httpServletRequest.getServerPort() + httpServletRequest.getContextPath();
        httpServletResponse.sendRedirect(basePath + "/login");
        chain.doFilter(request, response);
        return;
    }

    /**
    * 跳至无权限页面
    */
    private void gotoUnAccessPage(ServletRequest request, ServletResponse response, FilterChain chain, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, String returnUrl) throws IOException, ServletException {
        String basePath = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":" + httpServletRequest.getServerPort() + httpServletRequest.getContextPath();
        String s = basePath + "/unAccess?returnUrl=" + (returnUrl == null ? "" : returnUrl);
        httpServletResponse.sendRedirect(s);
        chain.doFilter(request, response);
        return;
    }

    @Override
    public void destroy() {
    }
}
