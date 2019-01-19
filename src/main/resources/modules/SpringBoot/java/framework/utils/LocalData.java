package ${basePackage}.framework.utils;

import ${basePackage}.framework.base.Token;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * LocalData - 本地数据存放类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class LocalData {
    private static final long serialVersionUID = 1L;

    private static Token temp = null;

    private static Token system = null;

    static {
        temp = new Token();
        temp.setId(-1);
        temp.setUserId(-1);
        temp.setUserName("游客");
        temp.putResource("/ajax");
        temp.putResource("/upload");
        temp.putResource("ajax.example.example");
        system = new Token();
        system.setId(0);
        system.setUserId(0);
        system.setUserName("system");
        system.putResource(".*");
    }

    public static Token getTempToken(){
        return temp;
    }

    public static Token getSysToken() {
        return system;
    }

    /**
     * 当请求目标 target = '/aa/bb'
     */
    private static final ThreadLocal<String> targetHolder = new ThreadLocal();

    public static String getTarget() {
        return targetHolder.get();
    }

    public static void setTarget(String target) {
        targetHolder.set(target);
    }

    /**
     * 当前用户的通行证
     */
    private static final ThreadLocal<Token> tokenHolder = new ThreadLocal();

    public static Token getToken() {
        return tokenHolder.get();
    }

    public static void setToken(Token token) {
        tokenHolder.set(token);
    }

    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    public static HttpServletResponse getResponse() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
    }

    public static ApplicationContext getApplicationContext() {
        return WebApplicationContextUtils.getWebApplicationContext(getRequest().getServletContext());
    }
}
