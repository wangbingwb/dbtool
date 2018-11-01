package xyz.wbsite.dbtool.web.framework;


import xyz.wbsite.dbtool.web.framework.base.Token;

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
        temp.putResource("/");
        temp.putResource("/index");
        temp.putResource("/login");
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
}
