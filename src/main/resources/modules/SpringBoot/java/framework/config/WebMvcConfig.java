package ${basePackage}.framework.config;

import ${basePackage}.framework.springmvc.GlobalHandlerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
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
    private GlobalHandlerInterceptor globalHandlerInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //增加全局拦截器
        registry.addInterceptor(globalHandlerInterceptor).addPathPatterns("**");
    }

    @Bean
    public GlobalHandlerInterceptor globalHandlerInterceptor() {
        GlobalHandlerInterceptor globalHandlerInterceptor = new GlobalHandlerInterceptor();
        return globalHandlerInterceptor;
    }
}