package com.wb.dbtool.tool;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tool {


    public static final char UNDERLINE = '_';

    /**
     * abbCdd --> abb_cdd
     * @param param
     * @return
     */
    public static String camelToUnderline(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (Character.isUpperCase(c)) {
                sb.append(UNDERLINE);
                sb.append(Character.toLowerCase(c));
            } else {
                sb.append(c);
            }
        }
        return sb.toString().toUpperCase();
    }

    /**
     * 下划线转首字母大写驼峰式
     * ABB_CDD --> AbbCdd
     * @param param
     * @return
     */
    public static String lineToClassName(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        //全部转小写
        param = param.toLowerCase();
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (c == UNDERLINE) {
                if (++i < len) {
                    sb.append(Character.toUpperCase(param.charAt(i)));
                }
            } else {
                sb.append(c);
            }
        }
        //首字符转大写
        return (new StringBuilder()).append(Character.toUpperCase(sb.charAt(0))).append(sb.substring(1)).toString();
    }

    /**
     * 下划线转首字母小写驼峰样式
     * ABB_CDD --> abbCdd
     * @param param
     * @return
     */
    public static String lineToFieldName(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        //全部转小写
        param = param.toLowerCase();
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (c == UNDERLINE) {
                if (++i < len) {
                    sb.append(Character.toUpperCase(param.charAt(i)));
                }
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    /**
     * 下划线转首字母小写驼峰样式
     * ABB_CDD --> abbcdd
     * @param param
     * @return
     */
    public static String lineToLowercase (String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        //全部转小写
        param = param.toLowerCase();
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (c == UNDERLINE) {

            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    /**
     * 下划线转点分割小写样式
     * ABB_CDD --> abb.cdd
     * @param param
     * @return
     */
    public static String lineToLPoint (String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        //全部转小写
        param = param.toLowerCase();
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (c == UNDERLINE) {
                sb.append(".");
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public static String lineToCamel2(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        StringBuilder sb = new StringBuilder(param);
        Matcher mc = Pattern.compile("_").matcher(param);
        int i = 0;
        while (mc.find()) {
            int position = mc.end() - (i++);
            //String.valueOf(Character.toUpperCase(sb.charAt(position)));
            sb.replace(position - 1, position + 1, sb.substring(position, position + 1).toUpperCase());
        }
        return sb.toString();
    }

    public static String pointToPath(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }

        return param.replaceAll("\\.", "/");
    }

    public static String print(String param) {
        return param;
    }
}
