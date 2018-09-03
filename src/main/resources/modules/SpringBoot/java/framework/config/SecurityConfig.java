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
import ${basePackage}.framework.base.Token;
import ${basePackage}.framework.utils.LocalData;

@Configuration
@EnableGlobalMethodSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Value("${r"${web.url.excluded}"}")
    private String[] excluded;
    @Value("${r"${web.url.authorization}"}")
    private String[] authorization;
    @Value("${r"${web.url.login}"}")
    private String login;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .antMatchers(excluded).permitAll()
                .antMatchers(authorization).access("@Authorization.hasPermission(request,authentication)")
                .and().cors()
                .and().headers().frameOptions().disable()
                .and().csrf().disable();
    }

    /**
     * 此方法不要删除 用于屏蔽默认用户密码生成
     *
     * 例如 Using generated security password: f6b42a66-71b1-4c31-b6a8-942838c81408
     *
     * @return
     * @throws Exception
     */
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean("Authorization")
    public Object getAuthorization() {
        return new Object() {
            public boolean hasPermission(HttpServletRequest request, Authentication authentication) {

                // 获取Token
                String token = CookieUtil.getCookieValue(request.getCookies(), "token");
                LogUtil.i(token);

                if (token == null) {
                    Token tempToken = LocalData.getTempToken();
                    LocalData.setToken(tempToken);
                }

                // 授权
                Token token_ = LocalData.getToken();
                if (token_.hasResource(request.getServletPath())) {
                    return true;
                }

                return false;
            }
        };
    }

}
