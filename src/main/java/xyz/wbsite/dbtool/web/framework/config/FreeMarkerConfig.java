package xyz.wbsite.dbtool.web.framework.config;

import xyz.wbsite.dbtool.web.framework.freemarker.FreemarkerViewNameTranslator;
import xyz.wbsite.dbtool.web.framework.freemarker.Layout;
import xyz.wbsite.dbtool.web.framework.freemarker.Url;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.DefaultRequestToViewNameTranslator;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.annotation.PostConstruct;
import java.util.Map;

/**
 * FreemarkerViewName解析器
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
@Configuration
public class FreeMarkerConfig {

    @Autowired
    private Layout layout;

    @Autowired
    private Url url;

    @Autowired
    protected FreeMarkerViewResolver resolver;

    @Autowired
    protected FreeMarkerConfigurer freeMarkerConfigurer;

    @PostConstruct
    public void setSharedVariable() {
        //设置基本工具类
        Map<String, Object> attributesMap = resolver.getAttributesMap();
        attributesMap.put("Layout", layout);
        attributesMap.put("Url", url);
    }

    /**
     * 解析器
     *
     * @return
     */
    @Bean(name = "viewNameTranslator")
    public DefaultRequestToViewNameTranslator getViewNameTranslator() {
        FreemarkerViewNameTranslator nameTranslator = new FreemarkerViewNameTranslator();
        nameTranslator.setViewResolver(resolver);
        return nameTranslator;
    }
}
