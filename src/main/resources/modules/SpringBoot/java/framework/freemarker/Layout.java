package ${basePackage}.framework.freemarker;

import java.io.File;

import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Locale;

/**
 * 布局帮助类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
@Component
public class Layout {

    @Value("${r"${web.welcome.page}"}")
    private String homePage;

    @Autowired
    private FreeMarkerViewResolver viewResolver;

    private String screenPrefix = "/screen/";
    private String controlPrefix = "/control/";
    private String suffix = ".ftl";

    public String setScreen() throws TemplateModelException {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            LocaleResolver localeResolver = (LocaleResolver) request.getAttribute(DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE);
            String servletPath = request.getServletPath();
            if ("/".equals(servletPath)) {
                servletPath = this.homePage;
            }
            if (servletPath.startsWith("/")) {
                servletPath = servletPath.substring(1);
            }

            // 去除头部/
            String[] split = servletPath.split("/");
            StringBuilder sb = new StringBuilder("");

            // 分割组装路径
            for (int i = 0; i < split.length; i++) {
                sb.append(split[i]);
                if (i != split.length - 1) {
                    sb.append(File.separator);
                }
            }

            Locale locale = localeResolver.resolveLocale(request);
            String viewName = "screen" + File.separator + sb.toString();
            View view = viewResolver.resolveViewName(viewName, locale);
            //无法找到对应screen
            if (view == null) {
                return "";
            } else {
                return screenPrefix + servletPath + suffix;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String setControl(String control) {
        control = control.replaceAll("/", File.separator);
        return controlPrefix + control + suffix;
    }
}
