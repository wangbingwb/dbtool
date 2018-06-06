package templates.SpringMVC_Mybatis.java.framework.springmvc;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

import java.text.SimpleDateFormat;

/**
 * SpringMVC 对象JSON化自定义转换器
 *
 * @author wangbing
 * @version 0.0.1
 * @Time 2017-01-01
 */
public class CustomObjectMapper extends ObjectMapper {

    /**
     * 设置@ResponseBody 返回的JSON格式
     */
    public CustomObjectMapper() {
        super();

        // 设置日期转换yyyy-MM-dd HH:mm:ss
        setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));

        // 将所有的Long变成String以兼容js
        SimpleModule simpleModule = new SimpleModule("LongModule");
        simpleModule.addSerializer(Long.class, ToStringSerializer.instance);
        simpleModule.addSerializer(Long.TYPE, ToStringSerializer.instance);
        registerModule(simpleModule);
    }
}