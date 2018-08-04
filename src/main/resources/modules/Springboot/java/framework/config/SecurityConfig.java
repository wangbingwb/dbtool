package ${basePackage}.framework.config;

import ${basePackage}.framework.security.DFilterInvocationSecurityMetadataSource;
import ${basePackage}.framework.security.DSecurityContextRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.context.SecurityContextRepository;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private SecurityContextRepository securityContextRepository;

    @Value("${r"${web.url.excluded}"}")
    private String[] excluded;

    @Value("${r"${web.url.login}"}")
    private String login;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        super.configure(auth);

//        auth.inMemoryAuthentication().withUser("admin").password("123456").roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .antMatchers(excluded).permitAll()
//                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .securityContext().securityContextRepository(securityContextRepository)
                .and().csrf().disable();
    }

    @Bean
    public SecurityContextRepository getSecurityContextRepository() {
        return new DSecurityContextRepository();
    }

//    @Bean
//    public AccessDecisionManager getDAccessDecisionManager() {
//        List<AccessDecisionVoter<RoleVoter>> decisionVoters = new ArrayList();
//        return new DAccessDecisionManager(decisionVoters);
//    }

    @Bean
    public FilterInvocationSecurityMetadataSource getFilterInvocationSecurityMetadataSource() {
        return new DFilterInvocationSecurityMetadataSource();
    }

}
