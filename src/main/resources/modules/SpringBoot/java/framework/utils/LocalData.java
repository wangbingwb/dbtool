package ${basePackage}.framework.utils;


import ${basePackage}.framework.base.Token;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

/**
 * LocalData - 本地数据存放类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class LocalData implements Serializable{
    private static final long serialVersionUID = 1L;

    private static Token temp = null;

    static {
        temp = new Token();
        temp.setId(-1);
        temp.setUserId(-1);
        temp.setUserName("游客");
        temp.putResource("/ajax");
        temp.putResource("ajax.example.example");
    }

    public static Token getTempToken(){
        return temp;
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
}
