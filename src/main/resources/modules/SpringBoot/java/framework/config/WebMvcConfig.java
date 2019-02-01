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
import org.springframework.boot.system.ApplicationHome;
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
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

//    @Bean
//    @Profile("prod")
//    public ServletWebServerFactory servletContainer() {
//        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
//
//        // 基本参数
//        String keyStore = "1754557_www.wbsite.xyz.pfx";
//        String keyStorePassword = "s98n7CLd";
//        String keyStoreType = "PKCS12";
//        int httpsPort = 443;
//
//        File keystore = null;
//        // 正常开发可以通过getFile()获取，打包jar后无法直接获取File对象，需将文件考出
//        try {
//            keystore = new ClassPathResource(keyStore).getFile();
//        } catch (IOException ex) {
//            try {
//                ApplicationHome home = new ApplicationHome(getClass());
//                // 当前运行jar文件
//                File jarFile = home.getSource();
//                //jar同目录
//                keystore = new File(jarFile.getParent(), keyStore);
//
//                InputStream inputStream = new ClassPathResource(keyStore).getInputStream();
//                byte[] bytes = new byte[inputStream.available()];
//
//                inputStream.read(bytes);
//
//                inputStream.close();
//
//                FileOutputStream fileOutputStream = new FileOutputStream(keystore);
//                fileOutputStream.write(bytes);
//                fileOutputStream.close();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//
//        // 创建Connector
//        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
//        Http11NioProtocol protocol = (Http11NioProtocol) connector.getProtocolHandler();
//        connector.setScheme("https");
//        connector.setSecure(true);
//        connector.setPort(httpsPort);
//        protocol.setSSLEnabled(true);
//        protocol.setKeystoreFile(keystore.getAbsolutePath());
//        protocol.setKeystorePass(keyStorePassword);
//        protocol.setKeystoreType(keyStoreType);
//
//        // 添加
//        tomcat.addAdditionalTomcatConnectors(connector);
//        return tomcat;
//    }
}