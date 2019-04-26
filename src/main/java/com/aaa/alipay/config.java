package com.aaa.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *作者：AAA_有梦想一起实现
 */

public class config{

    // ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016082100302262";//例：2016082600317257

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDINso4V4Whl1qMA5wCg5mFTC1noGifezxTFSmv1DUUFOahPbtx1nTBjniBSddrYGO1IZ7+5pp3lOWOISKlnSOqD3wEQUOpo0u7XN+MoYliXCDxhnjeTcEvJCVXo3gBF6Y/dqLBlmpbJKprKWreuOhUbDXoQ0tuXXd4TLkCs0wl702PI2SURl3nv2kyDofLZA6j4OFGTIoWDLNEQf1mIRofa9Gha4hgG9dSnUsIKl7JN3PcvRMrW5hSrt4DR8/QCaHPf7es6kyxWpf7W9aCAiC0nZi8I3G6ENPfInjlqU7QnHuOQCk7J4QTH2y93p/SN4uSbyie5mAXkDQX3Q8H10j/AgMBAAECggEAUMYJ/4EP4Il3dlVec4U0QprhFpWYn/7P75TyJIWwhFGKWjLVlK+4mv4nj8GCr0dL8p+FzcCrQONJWXX0zGwBH3Lvzaem7KF8xDJL3iitjIkuoUJnMQidj689gYXpvEcWQzRRpVhRwEOinWkwPHrNAIJHnVTI8dWzhU0utvAvIH4cIja8TZFmABfEZjXUYSJu4wYFf5snsus2a+MP+S0I4Z/DSrxNbPqq89SZ5bfoxCcvmbt9Bhamg7TMRvaOalCNZOOi+hdDzpLws0TnDvwreBIdD5FdDoEeUS4UrLpuZdCR5E7s3wzDdfa+2Pf9t/bXcKoZWHsLCsn17JwO3kVkQQKBgQDtd7ADmH0aHiR+1YNZsJFb2+u8S6l7frGaFofYxlbaW+ur3JYHxqvw+r8EdMVHbXbOlWJ6UicABT35jmyFCWpMlWuZo5wycyOW9+X4IEP2KfPGC7r7qgfwggqdSWQ/IHozA/lt+oj9lt0ChLpSVaBRyyDtcwTF51Kao4Za4HdTxQKBgQDX1tKW7iz/JRrpJEmMOgzekdgXrd6NQR3Q11i9kD/3Ro3PYOqlnLCAMK27NKVRpS78zD4aux2zPDaQ/1MlRw70CpYr2I/ikkT0GGW8G4jGCXx1zNm88DeMgrIFVVOX24VHLRX/qvQrhdfJHM2jssR3mFnUl22wv/R4x+WogzMB8wKBgQDKy4vlhjRQOa2xI2YpEkEQ0Z9gDr2OWYQSs2sQFVHW6Ok6vAbkXSY5henbRF21wiXUBn8zNzVXLyLeHGNQudmtzW02qCKccvfR1aLvY56meu1UFHB6u5pMKsIl0KdrwbCaIKrC4VJcPpo/rFnyNm3TbEWSgsdwuzwwE7aJpWhCgQKBgFt5WPDMaleL4zbRwTXj2FZvmxSWBI76/ObojVxxiRqEVU+BdJDRsl/xwX9olXPfvOU4rk1n5fNzXnDfNN7EmcrFvdVBR+GvOff1axBo3vOHS68lLVaMvA4ZydbGzdG7IGYE7qDXU/oqFETQpzpsZiWFdPTLZJqXD8YseeGMEQ8PAoGAGtZ7109KNL9Fnmur7Kt9acU0H33UCnJf+go57bn7yJTPYh/4KairmS8v0huCODjVZE+Kah3Bfb49AgvpXDNAZtJChMTr7KN+OgHaNQ/K8098JWEPxzJUmEpznRZsZEPkd2DtWrVzH7ZEkJJYVHcXp0J566ArWb/J9J1RLy5kxn0=";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
    // 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyDbKOFeFoZdajAOcAoOZhUwtZ6Bon3s8UxUpr9Q1FBTmoT27cdZ0wY54gUnXa2BjtSGe/uaad5TljiEipZ0jqg98BEFDqaNLu1zfjKGJYlwg8YZ43k3BLyQlV6N4ARemP3aiwZZqWySqaylq3rjoVGw16ENLbl13eEy5ArNMJe9NjyNklEZd579pMg6Hy2QOo+DhRkyKFgyzREH9ZiEaH2vRoWuIYBvXUp1LCCpeyTdz3L0TK1uYUq7eA0fP0Amhz3+3rOpMsVqX+1vWggIgtJ2YvCNxuhDT3yJ45alO0Jx7jkApOyeEEx9svd6f0jeLkm8onuZgF5A0F90PB9dI/wIDAQAB";    // 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    /**
     * 返回的时候此页面不会返回到用户页面，只会执行你写到控制器里的地址
     */
    public static String notify_url = "http://localhost:8080/MN_CS/notify_url";
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    /**
     * 此页面是同步返回用户页面，也就是用户支付后看到的页面，上面的notify_url是异步返回商家操作，谢谢
     * 要是看不懂就找度娘，或者多读几遍，或者去看支付宝第三方接口API，不看API直接拿去就用，遇坑不怪别人
     */
    public static String return_url = " http://localhost:8080/MN_CS/index.jsp";
    // 签名方式
    public static String sign_type = "RSA2";
    // 字符编码格式
    public static String charset = "gbk";
    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
    // 日志地址
    public static String log_path = "D:/logs/";
    // ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * 
     * @param sWord
     *            要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_"
                    + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}