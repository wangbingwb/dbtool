package ${basePackage}.framework.utils;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

/**
 * AESUtil 对称加密和解密工具类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class AESUtil {

    private static final String ALGORITHM = "AES";
    private static final String ALGORITHM_STR = "AES/ECB/PKCS5Padding";

    /**
     * 加密
     *
     * @param data   待加密字节数组
     * @param secret 密钥
     * @return base64字符串
     */
    public static byte[] encrypt(byte[] data, String secret) {
        try {
            if (secret.length() != 16) {
                throw new IllegalArgumentException("secret's length is not 16");
            }
            SecretKeySpec key = new SecretKeySpec(secret.getBytes(), ALGORITHM);
            Cipher cipher = Cipher.getInstance(ALGORITHM_STR); // 创建密码器
            cipher.init(Cipher.ENCRYPT_MODE, key);// 初始化
            return cipher.doFinal(data);// 加密
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
     * 加密
     *
     * @param data   待加密字节数组
     * @param secret 密钥
     * @return base64字符串
     */
    public static String encrypt2Base64(byte[] data, String secret) {
        byte[] encrypt = encrypt(data, secret);
        return Base64Util.encodeToString(encrypt, false);
    }

    /**
     * 解密
     *
     * @param data   待解密字节数组
     * @param secret 密钥
     * @return
     */
    public static byte[] decrypt(byte[] data, String secret) {
        try {
            if (secret.length() != 16) {
                throw new IllegalArgumentException("secret's length is not 16");
            }
            SecretKeySpec key = new SecretKeySpec(secret.getBytes(), ALGORITHM);
            Cipher cipher = Cipher.getInstance(ALGORITHM_STR);
            cipher.init(Cipher.DECRYPT_MODE, key);
            return cipher.doFinal(data);
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
        }
        return null;
    }

    public static byte[] decryptBase64(String base64Data, String secret) {
        byte[] decode = Base64Util.decode(base64Data);
        return decrypt(decode, secret);
    }

    public static String decrypt2String(String base64Data, String secret) {
        byte[] bytes = decryptBase64(base64Data, secret);
        try {
            return new String(bytes, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        // 加密
        String data = "我有一个苹果";
        String secret = "1234567890123456";
        System.out.println("加密后的Base64密文是:" + AESUtil.encrypt2Base64(data.getBytes(), secret));

        // 解密
        String encrypt2Base64 = AESUtil.encrypt2Base64(data.getBytes(), secret);
        byte[] decrypt = AESUtil.decrypt(Base64Util.decode(encrypt2Base64), secret);
        System.out.println("解密后的明文是:" + new String(decrypt));
    }
}