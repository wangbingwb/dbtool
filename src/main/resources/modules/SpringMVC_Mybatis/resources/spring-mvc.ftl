<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:p="http://www.springframework.org/schema/p"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-4.1.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context-4.1.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc-4.1.xsd">

    <!-- 自动扫描controller包下的所有类，如果@Controller注入为bean -->
    <context:component-scan base-package="${basePackage}.controller" />

    <!-- 避免IE执行AJAX时,返回JSON出现下载文件 -->
    <bean id="mappingJacksonHttpMessageConverter"
          class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
        <property name="supportedMediaTypes">
            <list>
                <value>text/html;charset=UTF-8</value>
            </list>
        </property>
    </bean>

    <!-- 启动Spring MVC的注解功能，完成请求和注解POJO的映射 -->
    <bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
        <property name="messageConverters">
            <list>
                <!-- json转换器 -->
                <ref bean="mappingJacksonHttpMessageConverter" />
            </list>
        </property>
    </bean>

    <mvc:annotation-driven>
        <mvc:message-converters>
            <bean class="org.springframework.http.converter.StringHttpMessageConverter">
                <constructor-arg index="0" value="utf-8"/>
                <property name="supportedMediaTypes">
                    <list>
                        <value>application/json;charset=UTF-8</value>
                        <value>text/plain;charset=UTF-8</value>
                    </list>
                </property>
            </bean>
            <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
                <property name="objectMapper">
                    <bean class="${basePackage}.framework.springmvc.GlobalObjectMapper">
                        <property name="dateFormat">
                            <bean class="java.text.SimpleDateFormat">
                                <constructor-arg type="java.lang.String" value="yyyy-MM-dd HH:mm:ss"/>
                            </bean>
                        </property>
                    </bean>
                </property>
            </bean>
        </mvc:message-converters>
    </mvc:annotation-driven>

    <mvc:interceptors>
        <mvc:interceptor>
            <mvc:mapping path="/**"/>
            <mvc:exclude-mapping path="/static/**"/>
            <bean class="${basePackage}.framework.springmvc.GlobalHandlerInterceptor" />
        </mvc:interceptor>
    </mvc:interceptors>

    <!-- 文件上传表单的视图解析器 -->
    <bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
        <property name="maxUploadSize" value="83886080" /><!-- 10M文件上传 -->
        <property name="defaultEncoding" value="UTF-8" />
    </bean>

    <mvc:resources mapping="/static/**" location="/static/" />

    <!-- 优先使用freemarker -->
    <bean id="freeMarkerConfigurer"
          class="org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer">
        <property name="templateLoaderPath" value="/WEB-INF/ftl/"/>
        <property name="defaultEncoding" value="utf-8"/>
        <property name="freemarkerSettings">
            <props>
                <prop key="template_update_delay">1</prop>
                <prop key="locale">zh_CN</prop>
                <prop key="datetime_format">yyyy-MM-dd</prop>
                <prop key="date_format">yyyy-MM-dd</prop>
#set($s = '#.##')
                <prop key="number_format">$s</prop>
                <!-- 如果变量为null,转化为空字符串,比如做比较的时候按照空字符做比较 -->
                <prop key="classic_compatible">true</prop>
                <!-- 去掉多余的空格,非常有用 -->
                <prop key="whitespace_stripping">true</prop>
                <!-- 模版更新事件,设置为1秒,正式环境设置为3600秒 -->
                <prop key="template_update_delay">3600</prop>
                <!-- 模版更新事件,设置为1秒,正式环境设置为3600秒 -->
                <prop key="template_update_delay">1</prop>
                <!-- url编码utf8 -->
                <prop key="url_escaping_charset">utf-8</prop>
                <!-- url编码utf8 -->
                <prop key="url_escaping_charset">utf-8</prop>
            </props>
        </property>
    </bean>

    <bean id="freeMarkerViewResolver"
          class="org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver">
        <property name="cache" value="true"/>
        <property name="prefix" value=""/>
        <!-- 上面已经配了，这里就不用配啦 -->
        <property name="suffix" value=".ftl" />
        <property name="contentType" value="text/html;charset=UTF-8" />
        <property name="allowRequestOverride" value="true" />
        <property name="exposeSpringMacroHelpers" value="true" />
        <property name="exposeSessionAttributes" value="true" />
        <property name="requestContextAttribute" value="Request" />
        <property name="attributesMap">
            <map>
                <entry key="Layout">
                    <bean class="${basePackage}.framework.freemarker.Layout"></bean>
                </entry>
                <entry key="Url">
                    <bean class="${basePackage}.framework.freemarker.Url"></bean>
                </entry>
            </map>
        </property>
        <property name="order" value="1" />
    </bean>
    <!-- freemarker视图翻译 -->
    <bean id="viewNameTranslator" class="${basePackage}.framework.freemarker.ViewNameTranslator"/>

    <!-- freemarker没有实现则使用jsp -->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/views/"/>
        <property name="suffix" value=".jsp"/>
        <property name="order" value="2"/>
    </bean>
</beans>