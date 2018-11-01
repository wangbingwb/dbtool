package xyz.wbsite.dbtool.javafx.tool;

import java.io.*;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tool {

    public static final char UNDERLINE = '_';

    /**
     * abbCdd --> abb_cdd
     *
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
     * abbCdd --> abb.cdd
     * AbbCdd --> abb.cdd
     *
     * @param param
     * @return
     */
    public static String camelToPoint(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        param = Character.toLowerCase(param.charAt(0)) + param.substring(1, param.length());
        int len = param.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = param.charAt(i);
            if (Character.isUpperCase(c)) {
                sb.append(".");
                sb.append(Character.toLowerCase(c));
            } else {
                sb.append(c);
            }
        }
        return sb.toString().toLowerCase();
    }


    /**
     * FileCreateRequest -> file
     *
     * @param requestName
     * @return
     */
    public static String getRequestTarget(String requestName) {
        if (requestName.contains("GetAllRequest")) {
            return Abb2abb(requestName.substring(0, requestName.indexOf("GetAllRequest")));
        }

        String s = camelToPoint(requestName);
        String[] split = s.split("\\.");
        if (split.length > 2) {
            String target = split[0];
            for (int i = 1; i < split.length - 2; i++) {
                target += abb2Abb(split[i]);
            }
            return target;
        }
        return "";
    }

    /**
     * FileCreateRequest -> create
     *
     * @param requestName
     * @return
     */
    public static String getRequestAction(String requestName) {
        String s = camelToPoint(requestName);

        if (requestName.contains("GetAllRequest")) {
            return "getAll";
        }

        String[] split = s.split("\\.");
        if (split.length > 2) {
            String action = split[split.length - 2];
            return action;
        }
        return "";
    }

    /**
     * @param param
     * @return
     */
    public static String Abb2abb(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        param = Character.toLowerCase(param.charAt(0)) + param.substring(1, param.length());
        return param;
    }

    public static String abb2Abb(String param) {
        if (param == null || "".equals(param.trim())) {
            return "";
        }
        param = Character.toUpperCase(param.charAt(0)) + param.substring(1, param.length());
        return param;
    }

    /**
     * 下划线转首字母大写驼峰式
     * ABB_CDD --> AbbCdd
     *
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
     *
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
     *
     * @param param
     * @return
     */
    public static String lineToLowercase(String param) {
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
     *
     * @param param
     * @return
     */
    public static String lineToLPoint(String param) {
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

    public static void outputResource(String url, File file) {
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
                return;
            }
        }
        if (url != null && url.startsWith("/")) {
            url = url.substring(1);
        }
        url = "modules/" + url;

        InputStream resourceAsStream = null;
        FileOutputStream fileOutputStream = null;
        try {
            URL resource = Tool.class.getClassLoader().getResource("/");
            resourceAsStream = Tool.class.getClassLoader().getResourceAsStream(url);
            fileOutputStream = new FileOutputStream(file);
            if (resourceAsStream == null) {
                resourceAsStream = Tool.class.getResourceAsStream("../../../../" + url);
            }

            int b = -1;

            while ((b = resourceAsStream.read()) != -1) {
                fileOutputStream.write(b);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                resourceAsStream.close();
            } catch (IOException e) {
            }
            try {
                fileOutputStream.close();
            } catch (IOException e) {
            }
        }
    }

    public static void clear(File f) {
        clear(f, ".idea|.*iml");
    }

    /**
     * @param f       目录
     * @param exclude 排除
     */
    public static void clear(File f, String exclude) {
        if (f.isDirectory()) {
            File[] files = f.listFiles(new FileFilter() {
                @Override
                public boolean accept(File pathname) {
                    if (exclude == null) {
                        return true;
                    }
                    return !pathname.getName().matches(exclude);
                }
            });
            for (File file : files) {
                if (file.isDirectory()) {
                    clear(file, exclude);
                    System.out.println("删除文件夹" + file.getName() + (file.delete() ? "成功" : "失败"));
                } else {
                    System.out.println("删除" + file.getName() + (file.delete() ? "成功" : "失败"));
                }
            }
        }
    }
}
