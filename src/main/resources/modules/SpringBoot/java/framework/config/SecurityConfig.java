package ${basePackage}.framework.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import javax.servlet.http.HttpServletRequest;
import ${basePackage}.framework.utils.CookieUtil;
import ${basePackage}.framework.utils.LogUtil;

@Configuration
@EnableGlobalMethodSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Value("${r"${web.url.excluded}"}")
    private String[] excluded;

    @Value("${r"${web.url.login}"}")
    private String login;

    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        // ALTOUGH THIS SEEMS LIKE USELESS CODE,
        // ITS REQUIRED TO PREVEND SPRING BOOT AUTO-CONFIGURATION
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .antMatchers(excluded).permitAll()
                .antMatchers("/admin/**").access("@Authorization.hasPermission(request,authentication)")
                .and().cors()
                .and().headers().frameOptions().disable()
                .and().csrf().disable();
    }

    @Bean("Authorization")
    public Object getAuthorization() {
        return new Object() {
            public boolean hasPermission(HttpServletRequest request, Authentication authentication) {
                String requestedSessionId = request.getRequestedSessionId();

                String token = CookieUtil.getCookieValue(request.getCookies(), "token");
                LogUtil.i(token);

                if (token != null) {
                    return true;
                }

                return false;
            }
        };
    }

}
