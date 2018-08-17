package ${domain};

import com.fasterxml.jackson.core.TreeNode;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;

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
     * 测试实例
     *
     * @param args
     */
    public static void main(String[] args) {
//        String encode = MD5Util.encode("123456");
//        System.out.println(encode);
//
//        UserCreateRequest user = new UserCreateRequest();
//        user.setUser("wangbing");
//
//
//        ArrayList<User> users = new ArrayList<>();
//        User user1 = new User();
//        user1.setUser("ddd");
//        users.add(user1);
//        user.setList(users);
//
//        TreeNode treeNode = MapperUtil.toTree(user);
//        String s = MapperUtil.toJson(user,true);
//        System.out.println(s);
//
//        String s1 = MD5Util.toSign(treeNode, "asasasdadasda", "wwwwwwwwwwwwwwww");
//
//        System.out.println(s1);

    }
}
