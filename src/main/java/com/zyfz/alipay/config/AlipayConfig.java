package com.zyfz.alipay.config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：1.0
 *日期：2016-06-06
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	//合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
	public static String partner = "2088812779503152";

	//商户的私钥,需要PKCS8格式，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
	public static String private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDoLG/6GMDXKa6p\n" +
			"+5CaUfXLcA4LM2fGKb95xWOXaAv3HFSpgM8reY7zT1USSsGHkXa93xh0xSfTF42R\n" +
			"te1RMO4txq0FmiF+/IbxaMQbk1K7RSiV6ZMiHeOedYB80wR77gHiOYfbcVSDBoxN\n" +
			"YhPM21+5XN5UD4DKt4pB2ZQSyYg4tqEyLjzNTEL6NoRkU0GPFdbOLucpcB3f8Ie7\n" +
			"Pi6QhbbfUUiiMeCOOuKzBQR7/I6sWLvyxBYzpNdiEn0QrW2JN+LZxqjGf9GktcbG\n" +
			"qRvZRsm7VAEt3SzCJ0QnomqFYj3Ch1nzZ7wU0HZhhSrE9vDIRIRcgSklv+cogett\n" +
			"9lsAFjAdAgMBAAECggEAEoyaVazsm0QlREdpAitSK/LD7Hkq7VYgiiYPEuWpLxEA\n" +
			"Ypp78sk/doj8Dv4SADbK+dh9J7cou2DCWsXiM/5oyRd6c1whGPgr/9WS9XELxxJ7\n" +
			"b569tpgUu3A/17k0PoKBfAWEqS+gxOcdBoGze0Z7m1+kE6s5avjG/wPXJLkdPQqT\n" +
			"WHKCsz78bTziI2QshSRb1qV7ww17XKETOCPlRJ2GPnojPIrffMlhB7mFtTgwNjBt\n" +
			"i0TUmZc+Y3TzT6wvOAxXzxA8o/neNslr8OAV+SNOdtj+2MV7QcQW2nc7ffY6OYnx\n" +
			"FpVIZ8egLNKi8X3SMqwkFRYM28jOwytdVq6GSxbRAQKBgQD3jH6GV+PYLB6vvquh\n" +
			"SMYbHLMM2yBUpMOckauEs9AtEgwzJCPMg3WJRq5RNmHX509/qlB4ya2XPwyaBxsA\n" +
			"Ikvfyhuu0T83I8pR7pRp2nAuS+PbdekQuh6ZeLdoEQLdofaQoztdljDjIPSN2zsk\n" +
			"z/XnFQ9clpf9F6WWEBY3d1UO7QKBgQDwGZFw8hk6Sv9qPnoQE2um0OfiflxhR924\n" +
			"c1iCuSyyFskCZCMAsobfuajE70QBwIG4F9WZ+IsaEHnraplTk1ZolzHu/uh9hwAN\n" +
			"qrUeR+spUCxlx2Mw/nuhj+qF0ZMxM7kkCBaDy98jK05TkX6ZSx0yPiYEyx06pDc/\n" +
			"jvhXeghP8QKBgGKFjPmk0y5+6LujVCV9lDLIKk6si2KErMGMjEnlUq4NZ8OW15SW\n" +
			"oVnAQrJZxXkrO02hGCPqiGcQldBbkZhtDeuEQZ5C8zjbyrLvFCxI3qreU1JNzDN3\n" +
			"D6SfEceeNZjF1B7eiEsH8m8C97HZleFhzwloLVP5L4ZwOdvOjTkICldFAoGAN4Zy\n" +
			"MCCM3QJDFxrjt5wGJUnilmqKiqTIDcP/EBwqzfSe/8KQpbSjpFGXShPbMlyGo0A/\n" +
			"0Z+864Yr69l3I/DK5t0wWwjwUzdJN9/mit4u8BruaYs20TnI9ZAGuHPDCnnfswl7\n" +
			"y3b2X3fAYWsgT+sjEV92A13FoK4haL1ziSdbjMECgYBxGXY7Hg2W5Z3k59ot/yFp\n" +
			"HRqLol21zLcBJsDAAtz43uBrvit6MTYvjAkO0BX+kYPMyIIaXyPSGsCj5WCividj\n" +
			"xSxy7bGbCfPujRnq0zKmr6Mqg/57Lemu56W0SHNLUNKH9QMV2Yp6DqUQ9PhRTvyi\n" +
			"pZJwxntN7eM7hTmrf7y0EA==";
	
	//支付宝的公钥，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
	public static String alipay_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
	
	// 签名方式
	public static String sign_type = "RSA";
	
	// 调试用，创建TXT日志文件夹路径，见AlipayCore.java类中的logResult(String sWord)打印方法。
	public static String log_path ="/var/log/happy-help";
		
	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";

	// 接收通知的接口名
	public static String service = "mobile.securitypay.pay";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
}

