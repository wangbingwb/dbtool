package ${basePackage}.framework.utils;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * AESUtil 对称加密和解密工具类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class AESUtil {

    /**
     * 加密
     *
     * @param data   待加密字符串
     * @param secret 密钥
     * @return base64字符串
     */
    public static String encrypt(String data, String secret) {
        return encrypt(data.getBytes(), secret);
    }

    /**
     * 加密
     *
     * @param data   待加密字节数组
     * @param secret 密钥
     * @return base64字符串
     */
    public static String encrypt(byte[] data, String secret) {
        try {
            KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");// 创建AES的Key生产者
            keyGenerator.init(128, new SecureRandom(secret.getBytes()));// 利用用户密码作为随机数初始化出
            // 128位的key生产者
            //加密没关系，SecureRandom是生成安全随机数序列，password.getBytes()是种子，只要种子相同，序列就一样，所以解密只要有password就行
            SecretKey secretKey = keyGenerator.generateKey();// 根据用户密码，生成一个密钥
            byte[] enCodeFormat = secretKey.getEncoded();// 返回基本编码格式的密钥，如果此密钥不支持编码，则返回
            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");// 转换为AES专用密钥
            Cipher cipher = Cipher.getInstance("AES");// 创建密码器
            cipher.init(Cipher.ENCRYPT_MODE, key);// 初始化为加密模式的密码器
            byte[] result = cipher.doFinal(data);// 加密
            return Base64Util.encodeToString(result, true);
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 解密
     *
     * @param base64data 待解密base65字符串
     * @param secret     密钥
     * @return
     */
    public static String decrypt(String base64data, String secret) {
        byte[] decode = Base64Util.decodeFast(base64data);
        return decrypt(decode, secret);
    }

    /**
     * 解密
     *
     * @param data   待解密字节数组
     * @param secret 密钥
     * @return
     */
    public static String decrypt(byte[] data, String secret) {
        try {
            KeyGenerator kgen = KeyGenerator.getInstance("AES");// 创建AES的Key生产者
            kgen.init(128, new SecureRandom(secret.getBytes()));
            SecretKey secretKey = kgen.generateKey();// 根据用户密码，生成一个密钥
            byte[] enCodeFormat = secretKey.getEncoded();// 返回基本编码格式的密钥
            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");// 转换为AES专用密钥
            Cipher cipher = Cipher.getInstance("AES");// 创建密码器
            cipher.init(Cipher.DECRYPT_MODE, key);// 初始化为解密模式的密码器
            byte[] result = cipher.doFinal(data);
            return new String(result, "utf-8");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        // 加密
        String data = "我有一个苹果";
        String secret = "ABCDEFG";
        System.out.println("加密后的密文是:" + AESUtil.encrypt(data, secret));

        // 解密
        System.out.println("解密后的明文是:" + AESUtil.decrypt(AESUtil.encrypt(data, secret), secret));
    }

}