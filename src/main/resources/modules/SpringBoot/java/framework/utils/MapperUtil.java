package ${basePackage}.framework.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * MapUtil - 映射转化工具类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class MapperUtil {
    private static ObjectMapper om;
    private static Mapper mapper;

    static {
        //初始化
        om = new ObjectMapper();
        //序列化时忽略null属性
        om.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        //序列化时排序
        om.configure(MapperFeature.SORT_PROPERTIES_ALPHABETICALLY, true);
        //反序列化是忽略多余字段
        om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        //支持空类序列化时出错InvalidDefinitionException
        om.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS,false);

        mapper = new DozerBeanMapper();
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

    public static <T> List<T> toJavaList(String json, TypeReference<List<T>> reference) {
        try {
            return om.readValue(json, reference);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> List<T> toJavaList(InputStream json, TypeReference<List<T>> reference) {
        try {
            return om.readValue(json, reference);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static <T> T map(Object o, Class<T> aClass) {
        return mapper.map(o, aClass);
    }

    public static void map(Object o, Object o1) {
        mapper.map(o, o1);
    }
}
