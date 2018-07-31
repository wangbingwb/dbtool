package com.wb.dbtool.web.framework.utils;//package com.example.demo.framework.utils;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * MD5Util - MD5工具类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class MD5Util {

    /**
     * 加密
     *
     * @param value
     * @return
     */
    public static String encode(String value) {
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte[] e = md.digest(value.getBytes());
            return toHexString(e);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return value;
        }
    }

    public static String encode(byte[] bytes) {
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte[] e = md.digest(bytes);
            return toHexString(e);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }

    private static String toHexString(byte bytes[]) {
        StringBuilder hs = new StringBuilder();
        String stmp = "";
        for (int n = 0; n < bytes.length; n++) {
            stmp = Integer.toHexString(bytes[n] & 0xff);
            if (stmp.length() == 1)
                hs.append("0").append(stmp);
            else
                hs.append(stmp);
        }

        return hs.toString();
    }

    /**
     * 对json数据排序并签名
     * @param appSecret
     * @param currentTime
     * @return
     */
    public static String toSign(TreeNode treeNode, String appSecret, String currentTime) {
        String typesetting = sortAndJson(treeNode);
        System.out.println(typesetting);
        return MD5Util.encode(appSecret + typesetting + currentTime);
    }

    private static String sortAndJson(TreeNode treeNode) {
        StringBuffer sb = new StringBuffer();
        Iterator<String> keyIterator = treeNode.fieldNames();
        while (keyIterator.hasNext()){
            String next = keyIterator.next();
            sb.append(next).append(treeNode.get(next));
        }
        return sb.toString();
    }

//
//    private static String sortAndJson(JSONObject jsonObject) {
//        List<String> data = new ArrayList(jsonObject.keySet());
//        Collections.sort(data);
//        StringBuffer sb = new StringBuffer();
//
//        for (String s : data) {
//            sb.append(s);
//            Object o = jsonObject.get(s);
//            if (o == null) {
//                sb.append("");
//            } else if (o instanceof JSONArray) {
//                sb.append(sortAndJson((JSONArray) o));
//            } else if (o instanceof JSONObject) {
//                sb.append(sortAndJson((JSONObject) o));
//            } else {
//                sb.append(o.toString());
//            }
//        }
//        return sb.toString();
//    }


    /**
     * 测试实例
     *
     * @param args
     */
    public static void main(String[] args) {

    }
}
