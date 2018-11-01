package xyz.wbsite.dbtool.web.framework.springmvc;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

/**
 * SpringMVC 对象JSON化自定义转换器
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class GlobalObjectMapper extends ObjectMapper {

    /**
     * 设置@ResponseBody 返回的JSON格式
     */
    public GlobalObjectMapper() {
        super();
        // 将所有的Long变成String以兼容js
        SimpleModule simpleModule = new SimpleModule("LongModule");
        simpleModule.addSerializer(Long.class, ToStringSerializer.instance);
        simpleModule.addSerializer(Long.TYPE, ToStringSerializer.instance);
        registerModule(simpleModule);
    }
}