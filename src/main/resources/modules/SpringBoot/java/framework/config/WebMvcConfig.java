package ${basePackage}.framework.config;

import ${basePackage}.framework.springmvc.GlobalHandlerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //将资源Order设为 -1 权重大于 Mapping，保证资源优先级高于Mapping("**")
        registry.setOrder(-1);
    }

    @Autowired
    private CharacterEncodingFilter characterEncodingFilter;

    @Autowired
    private GlobalHandlerInterceptor globalHandlerInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //增加全局拦截器
        registry.addInterceptor(globalHandlerInterceptor).addPathPatterns("**");
    }

    @Bean
    public FilterRegistrationBean characterEncodingFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        //注入过滤器
        registration.setFilter(characterEncodingFilter);
        //拦截规则
        registration.addUrlPatterns("/*");
        //过滤器名称
        registration.setName("CharacterEncodingFilter");
        //过滤器顺序
        registration.setOrder(1);
        return registration;
    }

    @Bean
    public CharacterEncodingFilter characterEncodingFilter() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return characterEncodingFilter;
    }
    @Bean
    public GlobalHandlerInterceptor globalHandlerInterceptor() {
        GlobalHandlerInterceptor globalHandlerInterceptor = new GlobalHandlerInterceptor();
        return globalHandlerInterceptor;
    }
}