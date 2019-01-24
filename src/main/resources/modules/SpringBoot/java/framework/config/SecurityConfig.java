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
import ${basePackage}.framework.base.Token;
import ${basePackage}.framework.utils.CookieUtil;
import ${basePackage}.framework.utils.LocalData;
import javax.servlet.http.HttpServletRequest;

@Configuration
@EnableGlobalMethodSecurity(securedEnabled = true)
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

                if (token == null) {
                    LocalData.setToken(LocalData.getTempToken());
                }else {
                    // 组装Token
                    Token token1 = new Token();
                    token1.setId(1L);
                    token1.setUserId(1L);
                    token1.setUserName("admin");
                    //继承临时Token
                    token1.addResourceSet(LocalData.getTempToken());
                    //管理员特有资源
                    token1.putResource("/admin/.*");
                    LocalData.setToken(token1);
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
