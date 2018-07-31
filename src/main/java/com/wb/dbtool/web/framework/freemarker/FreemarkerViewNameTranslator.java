package com.wb.dbtool.web.framework.freemarker;

import com.wb.dbtool.web.framework.utils.LogUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.DefaultRequestToViewNameTranslator;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Locale;

/**
 * FreemarkerViewName解析器
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class FreemarkerViewNameTranslator extends DefaultRequestToViewNameTranslator {

    private FreeMarkerViewResolver viewResolver;

    @Override
    public String getViewName(HttpServletRequest request) {
        String viewName = "";
        try {
            LocaleResolver localeResolver = (LocaleResolver) request.getAttribute(DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE);
            String servletPath = request.getServletPath();
            if (servletPath != null && "/".equals(servletPath)) {
                servletPath = "index";
            }else {
                servletPath = servletPath.replaceAll("^/","");
            }
            Locale locale = localeResolver.resolveLocale(request);

            {//查询View
                viewName = "screen" + File.separator + servletPath;
                View view = viewResolver.resolveViewName(viewName, locale);
                if (view == null) {
                    LogUtil.e("can not find screen.");
                    return "404";
                }
            }

            {//查找layout
                viewName = "layout" + File.separator + servletPath;

                View view = viewResolver.resolveViewName(viewName, locale);
                //无法找到对应layout，使用默认layout
                if (view == null) {
                    viewName = "layout" + File.separator + "default";
                    View defaultView = viewResolver.resolveViewName(viewName, locale);
                    if (defaultView == null) {
                        System.err.println("can not find layout/default.ftl");
                        viewName = "";
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return viewName;
    }

    public FreeMarkerViewResolver getViewResolver() {
        return viewResolver;
    }

    public void setViewResolver(FreeMarkerViewResolver viewResolver) {
        this.viewResolver = viewResolver;
    }
}
