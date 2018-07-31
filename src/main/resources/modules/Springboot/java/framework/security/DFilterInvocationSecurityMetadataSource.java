package ${basePackage}.framework.security;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;

import java.util.*;

public class DFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    // 资源权限集合
    private Map<String, Collection<ConfigAttribute>> resourceMap = null;

    public void loadResourceDefine() {
        resourceMap = new HashMap<String, Collection<ConfigAttribute>>();

        //取得资源与角色列表
        Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
        atts.add(new ConfigAttribute(){
            @Override
            public String getAttribute() {
                return "ADMIN";
            }
        });
        resourceMap.put("/index", atts);
    }

    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
        loadResourceDefine();//防止无法注入问题
        // guess object is a URL.
        String url = ((FilterInvocation) o).getRequestUrl();
        Iterator<String> ite = resourceMap.keySet().iterator();
        while (ite.hasNext()) {
            String resURL = ite.next();
            if (antPathMatcher.match(resURL, url)) {
                return resourceMap.get(resURL);
            }
        }
        return null;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return FilterInvocation.class.isAssignableFrom(aClass);
    }
}
