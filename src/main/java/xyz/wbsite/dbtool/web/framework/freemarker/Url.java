package xyz.wbsite.dbtool.web.framework.freemarker;

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

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String contextPath = request.getContextPath();

        if (url.startsWith("/")) {
            return contextPath + url;
        } else {
            return contextPath + "/" + url;
        }
    }
}
