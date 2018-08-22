package ${basePackage}.framework.utils;

import javax.servlet.http.Cookie;

/**
 * CookieUtil
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class CookieUtil {

    public static String getTokenCookieName(String deployMode){
        if (deployMode.equals("production")) {
            return "TOKEN_ID";
        } else {
            return "TOKEN_ID_" + deployMode.toUpperCase();
        }
    }

    /**
     * 通过Cookies获取passport的ID
     * @param cookies       Cookies
     * @return      passportID
     */
    public static Long getTokenId(Cookie[] cookies, String deployMode) {
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                // Cookie中存放的为Token的id ，Cookie名称通过ConfigToolObject获取
                if (cookie != null && cookie.getName().equals(getTokenCookieName(deployMode))) {
                    try {
                        // 将cookie中的passportId转换为Long型
                        return Long.parseLong(cookie.getValue());
                    } catch (Exception ignored) {
                    }
                }
            }
        }
        return null;
    }

    /**
     * 通过Cookies获取内容
     * @param cookies       Cookies
     * @return      passportID
     */
    public static String getCookieValue(Cookie[] cookies, String key) {
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                // Cookie中存放的为passport的id ，Cookie名称通过ConfigToolObject获取
                if (cookie != null && cookie.getName().equals(key)) {
                    try {
                        return cookie.getValue();
                    } catch (Exception ignored) {
                    }
                }
            }
        }
        return null;
    }
}
