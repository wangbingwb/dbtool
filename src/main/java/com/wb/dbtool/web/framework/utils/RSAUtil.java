package com.wb.dbtool.web.framework.utils;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
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
            System.err.println("publicKeyBase64-->" + new BASE64Encoder().encode(aPublic.getEncoded()));
            System.err.println("privateKeyBase64-->" + new BASE64Encoder().encode(aPrivate.getEncoded()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    /**
     * 加密
     *
     * @param data 待加密明文
     */
    public static String encrypt(String data) {
        try {
            //生成公钥对象
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(new BASE64Decoder().decodeBuffer(cryptPublicKeyBase64));
            PublicKey aPublic = keyFactory.generatePublic(x509EncodedKeySpec);

            StringBuffer miwen = new StringBuffer();
            //分段加密开始
            Cipher rsa = Cipher.getInstance("RSA");
            rsa.init(Cipher.ENCRYPT_MODE, aPublic);
            int offset = 0;
            byte[] b = data.getBytes();
            while (offset < b.length) {
                byte[] bytes = rsa.doFinal(Arrays.copyOfRange(b, offset, Math.min(offset + 117, b.length)));
                miwen.append(new BASE64Encoder().encode(bytes));
                offset += 117;
            }
            return miwen.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 解密
     *
     * @param miwen base64密文
     */
    public static String decrypt(String miwen) {
        try {
            //生成私钥对象
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(new BASE64Decoder().decodeBuffer(cryptPrivateKeyBase64));
            PrivateKey aPrivate = keyFactory.generatePrivate(pkcs8EncodedKeySpec);

            Cipher rsa = Cipher.getInstance("RSA");
            rsa.init(Cipher.DECRYPT_MODE, aPrivate);
            //获得密文字节
            byte[] data = new BASE64Decoder().decodeBuffer(miwen.toString());
            int offset = 0;
            StringBuffer getMing = new StringBuffer();
            while (offset < data.length) {
                byte[] bytes = rsa.doFinal(Arrays.copyOfRange(data, offset, Math.min(offset + 128, data.length)));
                getMing.append(new String(bytes));
                offset += 128;
            }
            return getMing.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * RSA签名
     *
     * @param content    待签名数据
     * @param privateKey 私钥
     * @param encode     字符集编码
     * @return 签名值
     */
    public static String sign(String content, String privateKey, String encode) {
        try {

            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PKCS8EncodedKeySpec priPKCS8 = new PKCS8EncodedKeySpec(new BASE64Decoder().decodeBuffer(privateKey));
            PrivateKey aPrivate = keyFactory.generatePrivate(priPKCS8);

            Signature signature = Signature.getInstance("SHA1WithRSA");

            signature.initSign(aPrivate);
            signature.update(content.getBytes(encode));

            byte[] signed = signature.sign();

            return new BASE64Encoder().encode(signed);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * RSA验签名检查
     *
     * @param content   待签名数据
     * @param sign      签名值
     * @param publicKey 公钥
     * @param encode    字符集编码
     * @return 布尔值
     */
    public static boolean doCheck(String content, String sign, String publicKey, String encode) {
        try {
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            byte[] encodedKey = new BASE64Decoder().decodeBuffer(publicKey);
            PublicKey pubKey = keyFactory.generatePublic(new X509EncodedKeySpec(encodedKey));


            Signature signature = Signature.getInstance("SHA1WithRSA");

            signature.initVerify(pubKey);
            signature.update(content.getBytes(encode));

            boolean bverify = signature.verify(new BASE64Decoder().decodeBuffer(sign));
            return bverify;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
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
            String encrypt = RSAUtil.encrypt("我有一个苹果");
            System.out.println(encrypt);

            //解密
            String decrypt = RSAUtil.decrypt(encrypt);
            System.out.println(decrypt);
        }


        String sign = sign("我有一个苹果", signPrivateKeyBase64, "utf-8");
        System.out.println(sign);

        boolean b = doCheck("我有一个苹果", sign, signPublicKeyBase64, "utf-8");
        System.out.println(b);
    }
}
