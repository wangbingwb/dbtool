package $

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

{basePackage}.framework.freemarker;

import freemarker.template.TemplateModelException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Url帮助类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
@Component
public class Url {

    public String setUrl(String url) throws TemplateModelException {
        if (url == null) {
            return "";
        }

        if (!url.startsWith("/")) {
            return "/" + url;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 协议
        String scheme = request.getScheme();
        // 域名
        String serverName = request.getServerName();
        // 端口
        int serverPort = request.getServerPort();
        // 上下文路径
        String contextPath = request.getContextPath();

        return String.format(Locale.CHINA, "%s://%s:%d%s%s", scheme, serverName, serverPort, contextPath, url);
    }
}
