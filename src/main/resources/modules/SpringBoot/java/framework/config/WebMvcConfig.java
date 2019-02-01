package ${basePackage}.framework.config;

import ${basePackage}.framework.springmvc.GlobalHandlerInterceptor;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.apache.catalina.connector.Connector;
import org.apache.coyote.http11.Http11NioProtocol;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import xyz.wbsite.framework.springmvc.GlobalHandlerInterceptor;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //将资源Order设为 -1 权重大于 Mapping，保证资源优先级高于Mapping("**")
        registry.setOrder(-1);
    }

    @Autowired
    private GlobalHandlerInterceptor globalHandlerInterceptor;

    /**
     * 增加全局拦截器，可用于
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(globalHandlerInterceptor).addPathPatterns("/**").excludePathPatterns("/static/**");
    }

    /**
     * Jackson序列化时的转化规则配置
     *
     * 1、Long或long类型在序列化时转String，防止出现javascript中Number精度丢失的情况。
     *
     * @param converters
     */
    @Override
    public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
        MappingJackson2HttpMessageConverter jackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
        ObjectMapper objectMapper = jackson2HttpMessageConverter.getObjectMapper();
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        objectMapper.configure(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY, true);
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        SimpleModule simpleModule = new SimpleModule();
        simpleModule.addSerializer(Long.class, ToStringSerializer.instance);
        simpleModule.addSerializer(Long.TYPE, ToStringSerializer.instance);
        objectMapper.registerModule(simpleModule);
        jackson2HttpMessageConverter.setObjectMapper(objectMapper);

        // 将转化器注册到首个
        converters.add(0, jackson2HttpMessageConverter);
    }

//    /**
//     * 用于支持https支持，如果不需要可以删除
//     *
//     * @return
//     */
//    @Bean
//    @Profile("prod")
//    public ServletWebServerFactory servletContainer() {
//        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
//
//        String keyStore = "example.pfx";
//        String keyStorePassword = "abcdefg";
//        String keyStoreType = "PKCS12";
//        int httpsPort = 443;
//
//        // 创建Connector
//        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
//        Http11NioProtocol protocol = (Http11NioProtocol) connector.getProtocolHandler();
//        try {
//            File keystore = new ClassPathResource(keyStore).getFile();
//            connector.setScheme("https");
//            connector.setSecure(true);
//            connector.setPort(httpsPort);
//            protocol.setSSLEnabled(true);
//            protocol.setKeystoreFile(keystore.getAbsolutePath());
//            protocol.setKeystorePass(keyStorePassword);
//            protocol.setKeystoreType(keyStoreType);
//        } catch (IOException ex) {
//            throw new IllegalStateException("can't access keystore: [" + keyStore + "] or truststore: [" + keyStore + "]", ex);
//        }
//
//        // 添加
//        tomcat.addAdditionalTomcatConnectors(connector);
//        return tomcat;
//    }
}