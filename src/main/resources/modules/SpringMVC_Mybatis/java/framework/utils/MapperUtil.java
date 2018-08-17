package ${basePackage}.framework.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.cglib.core.Converter;

import java.io.IOException;

/**
 * MapUtil - 映射转化工具类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class MapperUtil {
    private static ObjectMapper om;
    private static Converter simpleConverter;

    static {
        //初始化
        om = new ObjectMapper();
        //序列化时忽略null属性
        om.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        //序列化时排序
        om.configure(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY, true);
        //反序列化是忽略多余字段
        om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        simpleConverter = new Converter() {

            @Override
            public Object convert(Object o, Class aClass, Object o1) {
                if (o == null) {
                    return null;
                }
                //类一样，且是java系统对象
                if (o.getClass() == aClass) {
                    if (o.getClass().getClassLoader() == null) {
                        return o;
                    } else {
                        return map(o, aClass);
                    }
                } else {

                }
                return null;
            }
        };
    }

    public static TreeNode toTree(String json) {
        try {
            return om.readTree(json);
        } catch (IOException e) {
            e.printStackTrace();
            return om.createObjectNode();
        }
    }

    public static TreeNode toTree(Object json) {
        return om.valueToTree(json);
    }

    public static String toJson(Object object) {
        return toJson(object, false);
    }

    public static String toJson(Object object, boolean pretty) {
        try {
            if (pretty) {
                return om.writerWithDefaultPrettyPrinter().writeValueAsString(object);
            } else {
                return om.writeValueAsString(object);
            }
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "{}";
        }
    }

    public static String toJson(JsonNode jsonNode) {
        return jsonNode.asText();
    }

    public static <T> T toJava(String json, Class<T> cls) {
        try {
            if (json == null || "".equals(json)) {
                return cls.newInstance();
            }
            return om.readValue(json, cls);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> T toJava(TreeNode treeNode, Class<T> cls) {
        try {
            return om.treeToValue(treeNode, cls);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> T toJava(String json, TypeReference valueTypeRef) {
        try {
            return om.readValue(json, valueTypeRef);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> T map(Object object, Class<T> tClass) {
        try {
            T t = tClass.newInstance();
            map(object, t);
            return t;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void map(Object object, Object target) {
        map(object, target, simpleConverter);
    }

    public static void map(Object object, Object target, Converter converter) {
        BeanCopier copier = BeanCopier.create(object.getClass(), target.getClass(), converter != null);
        copier.copy(object, target, converter);
    }

}
