package ${domain};

import javax.crypto.Cipher;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Arrays;

/**
 * RSAUtil - RSA工具类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class RSAUtil {

    private static String cryptPublicKeyBase64 = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCTrwfsrJjCF+pP4S3A/wrD4U1txg53EuBC1mPt" +
            "3vGXvSK2U0YNRVR3Q65ooHnPKmk4LwI8v+7+ATTxUg3qkuRiDuzBa5zLkYKM50LOgEWSdOKzbnbx" +
            "a5FnE7IXawNt1p8+MVN1TTI7J/fZy6g1x0WBy1odE5Osru4WfZNOqQtjHwIDAQAB";
    private static String cryptPrivateKeyBase64 = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJOvB+ysmMIX6k/hLcD/CsPhTW3G" +
            "DncS4ELWY+3e8Ze9IrZTRg1FVHdDrmigec8qaTgvAjy/7v4BNPFSDeqS5GIO7MFrnMuRgoznQs6A" +
            "RZJ04rNudvFrkWcTshdrA23Wnz4xU3VNMjsn99nLqDXHRYHLWh0Tk6yu7hZ9k06pC2MfAgMBAAEC" +
            "gYBjLRjKRMI1HfBZgmPChsPI9YWU4XuXVVLLL8Rd2uktOHOWM2gIw3VMvmPimVoT2GxesZr0BwTN" +
            "CSxvnuX/kHPTqtsIu1r5Iup3mGbvlj3sn8RvG0yvUDglDN7QVDqqN7XWvHJSBVfBzDXeExA/WGnE" +
            "6BOocNT9qkqA/UWNbCXGKQJBAN0Fd/P2D6EvCd2RztHhzVE6V8s/LwOTDnGn/YhdMpddy9TwZpBi" +
            "r7I6lzcLWQ1HfDUive3t+DGXqPqr/4FfkG0CQQCrDlZKf216QrXOmJ70LQSbflgvGYU+b6kLFyEh" +
            "+15HcIBfKUQCU+XUK4UzLMQDYxdngTNMNyq4AQ9Sh0tUTUI7AkEAtkq9XayzxWhLhcCtyTOoqPcq" +
            "1Aqf1x3iCuHYXTEo+ek1pcJFhY6vhJuIfrDQWQB9tEGcTvI4A4cnquBTkzvjnQJAYid58ImqYmuB" +
            "M6l0HJzwdeFL7MryIF+mWozNIFjDQq8VmoVtVwCZcuP+LN1VJLRpq6UBsIw/YRKKnkqwORGUHQJA" +
            "UuR0G/3Hai+vKDA14tIYIH6C4zNmbULxAEuQVh9thfafWNmiDcifApvkxQ2ewXwEGeJtz44zv6iY" +
            "3f3yq+a2OQ==";

    private static String signPublicKeyBase64 = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCTrwfsrJjCF+pP4S3A/wrD4U1txg53EuBC1mPt" +
            "3vGXvSK2U0YNRVR3Q65ooHnPKmk4LwI8v+7+ATTxUg3qkuRiDuzBa5zLkYKM50LOgEWSdOKzbnbx" +
            "a5FnE7IXawNt1p8+MVN1TTI7J/fZy6g1x0WBy1odE5Osru4WfZNOqQtjHwIDAQAB";
    private static String signPrivateKeyBase64 = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJOvB+ysmMIX6k/hLcD/CsPhTW3G" +
            "DncS4ELWY+3e8Ze9IrZTRg1FVHdDrmigec8qaTgvAjy/7v4BNPFSDeqS5GIO7MFrnMuRgoznQs6A" +
            "RZJ04rNudvFrkWcTshdrA23Wnz4xU3VNMjsn99nLqDXHRYHLWh0Tk6yu7hZ9k06pC2MfAgMBAAEC" +
            "gYBjLRjKRMI1HfBZgmPChsPI9YWU4XuXVVLLL8Rd2uktOHOWM2gIw3VMvmPimVoT2GxesZr0BwTN" +
            "CSxvnuX/kHPTqtsIu1r5Iup3mGbvlj3sn8RvG0yvUDglDN7QVDqqN7XWvHJSBVfBzDXeExA/WGnE" +
            "6BOocNT9qkqA/UWNbCXGKQJBAN0Fd/P2D6EvCd2RztHhzVE6V8s/LwOTDnGn/YhdMpddy9TwZpBi" +
            "r7I6lzcLWQ1HfDUive3t+DGXqPqr/4FfkG0CQQCrDlZKf216QrXOmJ70LQSbflgvGYU+b6kLFyEh" +
            "+15HcIBfKUQCU+XUK4UzLMQDYxdngTNMNyq4AQ9Sh0tUTUI7AkEAtkq9XayzxWhLhcCtyTOoqPcq" +
            "1Aqf1x3iCuHYXTEo+ek1pcJFhY6vhJuIfrDQWQB9tEGcTvI4A4cnquBTkzvjnQJAYid58ImqYmuB" +
            "M6l0HJzwdeFL7MryIF+mWozNIFjDQq8VmoVtVwCZcuP+LN1VJLRpq6UBsIw/YRKKnkqwORGUHQJA" +
            "UuR0G/3Hai+vKDA14tIYIH6C4zNmbULxAEuQVh9thfafWNmiDcifApvkxQ2ewXwEGeJtz44zv6iY" +
            "3f3yq+a2OQ==";

    /**
     * 创建密钥和私钥
     */
    public static void createKey() {
        try {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(1024);
            KeyPair keyPair = keyPairGenerator.generateKeyPair();

            //公钥
            RSAPublicKey aPublic = (RSAPublicKey) keyPair.getPublic();
            //私钥
            RSAPrivateKey aPrivate = (RSAPrivateKey) keyPair.getPrivate();
            //把密钥对象对应的字节转为Base64字符存储
            System.err.println("publicKeyBase64-->" + Base64Util.encodeToString(aPublic.getEncoded()));
            System.err.println("privateKeyBase64-->" + Base64Util.encodeToString(aPrivate.getEncoded()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public static String encrypt2Base64(byte[] data) {
        byte[] encrypt = encrypt(data);
        return Base64Util.encodeToString(encrypt);
    }

    public static byte[] encrypt(String data) {
        return encrypt(data.getBytes());
    }

    /**
     * 加密
     *
     * @param data 待加密数据
     */
    public static byte[] encrypt(byte[] data) {
        try {
            //生成公钥对象
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64Util.decode(cryptPublicKeyBase64));
            PublicKey aPublic = keyFactory.generatePublic(x509EncodedKeySpec);

            //分段加密开始
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            Cipher rsa = Cipher.getInstance("RSA");
            rsa.init(Cipher.ENCRYPT_MODE, aPublic);
            int offset = 0;
            while (offset < data.length) {
                byte[] bytes = rsa.doFinal(Arrays.copyOfRange(data, offset, Math.min(offset + 117, data.length)));
                bs.write(bytes);
                offset += 117;
            }
            return bs.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 加密
     *
     * @param data 待加密明文
     */
    public static byte[] encrypt(String data, PublicKey aPublic) {
        try {
            if (aPublic == null) {
                System.err.println("PublicKey can not be null");
                return null;
            }

            //分段加密开始
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            Cipher rsa = Cipher.getInstance("RSA");
            rsa.init(Cipher.ENCRYPT_MODE, aPublic);
            int offset = 0;
            byte[] b = data.getBytes();
            while (offset < b.length) {
                byte[] bytes = rsa.doFinal(Arrays.copyOfRange(b, offset, Math.min(offset + 117, b.length)));
                bs.write(bytes);
                offset += 117;
            }
            return bs.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param base64String base64编码字符串
     * @return
     */
    public static byte[] decrypt(String base64String) {
        return decrypt(Base64Util.decode(base64String));
    }

    public static String decrypt2String(String base64String) {
        byte[] decrypt = decrypt(Base64Util.decode(base64String));
        try {
            return new String(decrypt, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 解密
     *
     * @param data 已加密字节
     */
    public static byte[] decrypt(byte[] data) {
        try {
            //生成私钥对象
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64Util.decode(cryptPrivateKeyBase64));
            PrivateKey aPrivate = keyFactory.generatePrivate(pkcs8EncodedKeySpec);

            Cipher rsa = Cipher.getInstance("RSA");
            rsa.init(Cipher.DECRYPT_MODE, aPrivate);
            //获得密文字节
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            int offset = 0;
            while (offset < data.length) {
                byte[] bytes = rsa.doFinal(Arrays.copyOfRange(data, offset, Math.min(offset + 128, data.length)));
                bs.write(bytes);
                offset += 128;
            }
            return bs.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 解密
     *
     * @param data     已加密字节
     * @param aPrivate 公钥
     * @return 解密后的字节
     */
    public static byte[] decrypt(byte[] data, PublicKey aPrivate) {
        try {
            if (aPrivate == null) {
                System.err.println("PublicKey can not be null");
                return null;
            }

            Cipher rsa = Cipher.getInstance("RSA");
            rsa.init(Cipher.DECRYPT_MODE, aPrivate);
            //获得密文字节
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            int offset = 0;
            while (offset < data.length) {
                byte[] bytes = rsa.doFinal(Arrays.copyOfRange(data, offset, Math.min(offset + 128, data.length)));
                bs.write(bytes);
                offset += 128;
            }
            return bs.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static String sign2Base64(byte[] data, String privateKey) {
        byte[] sign = sign(data, privateKey);
        return Base64Util.encodeToString(sign);
    }

    /**
     * RSA签名
     *
     * @param data       待签名数据
     * @param privateKey 私钥
     * @return 签名字节数组
     */
    public static byte[] sign(byte[] data, String privateKey) {
        try {
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PKCS8EncodedKeySpec priPKCS8 = new PKCS8EncodedKeySpec(Base64Util.decode(privateKey));
            PrivateKey aPrivate = keyFactory.generatePrivate(priPKCS8);

            Signature signature = Signature.getInstance("SHA1WithRSA");

            signature.initSign(aPrivate);
            signature.update(data);
            return signature.sign();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * RSA验签名检查
     *
     * @param data      待签名数据
     * @param sign      base64 签名字符串
     * @param publicKey 公钥
     * @return 布尔值
     */
    public static boolean doCheck(byte[] data, String sign, String publicKey) {
        try {
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            byte[] encodedKey = Base64Util.decode(publicKey);
            PublicKey pubKey = keyFactory.generatePublic(new X509EncodedKeySpec(encodedKey));
            Signature signature = Signature.getInstance("SHA1WithRSA");
            signature.initVerify(pubKey);
            signature.update(data);
            return signature.verify(Base64Util.decode(sign));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static PublicKey parsePublicKey(String cryptPublicKeyBase64) {
        try {
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64Util.decode(cryptPublicKeyBase64));
            return keyFactory.generatePublic(x509EncodedKeySpec);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static PrivateKey parsePrivateKey(String cryptPrivateKeyBase64) {
        try {
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PKCS8EncodedKeySpec priPKCS8 = new PKCS8EncodedKeySpec(Base64Util.decode(cryptPrivateKeyBase64));
            return keyFactory.generatePrivate(priPKCS8);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 测试实例
     *
     * @param args
     */
    public static void main(String[] args) {
        {//创建秘钥对
            RSAUtil.createKey();
        }

        {//加解密

            //加密
            String encrypt = RSAUtil.encrypt2Base64("我有一个苹果".getBytes());
            System.out.println(encrypt);

            //解密
            String decrypt = RSAUtil.decrypt2String(encrypt);
            System.out.println(decrypt);
        }


        String sign = sign2Base64("我有一个苹果".getBytes(), signPrivateKeyBase64);
        System.out.println(sign);

        boolean b = doCheck("我有一个苹果".getBytes(), sign, signPublicKeyBase64);
        System.out.println(b);
    }
}
