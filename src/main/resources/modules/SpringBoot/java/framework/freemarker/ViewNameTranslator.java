package ${basePackage}.framework.freemarker;

import ${basePackage}.framework.utils.LogUtil;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.DefaultRequestToViewNameTranslator;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Locale;
import java.util.Map;

/**
 * FreemarkerViewName解析器
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
@Component("viewNameTranslator")
public class ViewNameTranslator extends DefaultRequestToViewNameTranslator {

    @Value("${r"${web.welcome.page}"}")
    private String homePage;

    @Autowired
    private FreeMarkerViewResolver viewResolver;
    @Autowired
    private Layout layout;
    @Autowired
    private Uri uri;

    @PostConstruct
    public void setSharedVariable() {
        //设置基本工具类
        Map<String, Object> attributesMap = viewResolver.getAttributesMap();
        attributesMap.put("Layout", layout);
        attributesMap.put("Uri", uri);
    }

    @Override
    public String getViewName(HttpServletRequest request) {
        String viewName = "";
        try {
            LocaleResolver localeResolver = (LocaleResolver) request.getAttribute(DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE);
            String servletPath = request.getServletPath();
            if (servletPath != null && "/".equals(servletPath)) {
                servletPath = homePage;
            } else {
                servletPath = servletPath.replaceAll("^/", "");
            }
            Locale locale = localeResolver.resolveLocale(request);

            {//查询View
                String[] split = servletPath.split("/");
                StringBuilder sb = new StringBuilder("");
                sb.append("screen");
                for (int i = 0; i < split.length; i++) {
                    sb.append(File.separator);
                    sb.append(split[i]);
                }
                viewName = sb.toString();
                View view = viewResolver.resolveViewName(viewName, locale);
                if (view == null) {
                    LogUtil.e("can not find screen.");
                    return "404";
                }
            }

            {//查找layout
                String[] split = servletPath.split("/");

                int lt = split.length;
                while (lt > 0) {

                    StringBuilder sb = new StringBuilder("");
                    sb.append("layout");
                    for (int i = 0; i < lt - 1; i++) {
                        sb.append(File.separator);
                        sb.append(split[i]);
                    }

                    viewName = sb.toString() + File.separator + split[split.length - 1];

                    View view = viewResolver.resolveViewName(viewName, locale);
                    //无法找到对应layout，使用默认layout
                    if (view == null) {
                        viewName = sb.toString() + File.separator + "default";
                        View defaultView = viewResolver.resolveViewName(viewName, locale);
                        if (null == defaultView && lt == 1) {
                            System.err.println("can not find layout/default.ftl");
                            viewName = "";
                        }
                        lt--;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return viewName;
    }
}
