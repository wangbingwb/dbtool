package com.example.config;

import com.example.framework.base.Token;
import com.example.framework.springmvc.GlobalHandlerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class TestConfig {

    @Bean
    public Token getTestToken() {
        Token token = new Token();
        token.setId(-1);
        token.setUserId(-1);
        token.setUserName("system");
        return token;
    }
}