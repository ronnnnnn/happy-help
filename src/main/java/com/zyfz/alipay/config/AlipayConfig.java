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
	/**
	 * 支付宝支付业务：入参app_id
	 */
	public static final String APPID = "2016121904425820";

	public static final String PID = "2088521478612514";

	//合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
	public static String PARTNER = "2088521478612514";

	//商户的私钥,需要PKCS8格式，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
	public static final String RSA_PRIVATE = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJIFf0TZ5ZVbVj+RTmvirfWzUdi88q0jPRZqT5fMXdxQAsBy5ISv7IG/Ja/G+CDAXWyhtSPsZhDi/Ago2JcOM4NDPrZydqKm8i8aMXzLqbWYG1MlfQHu6rufP8a1voK6NlV+8A4wFAV17yQVI+IEqKc50SH1hojtk8KwwILlinSLAgMBAAECgYBUh/AkOIvqiaSFSiX+2IviJ7vi34cQ6cxsVIDdHIbdikf9hsV5dqpQdgpoFqP/ubybrYVCVZDEh9JlGtg/og35ODKF9P8icL3et9FpqYuN5asRkAw8CQMfoLdLsiTp359QI4PK8GEcqOOHSm9CKB83Kp5vZIWUo6QUDPVhAjCBMQJBAMIHrQ1znq4iwaN5lqCA4LEdY67YDaTaX9RKz+wUzBdaP58Ut6MVDaf4cN+qPEYe23K3tJOi31TNZ3VP9iSSzDMCQQDAqInMnydbiIwDN7CnL+FGqtz8z0nhw5e7xLVoFKn3mIJUuhpMtCt1PnXYhbOYPiHkhZliXlq3CIaxlqkw/t5JAkEAk3uwL5Rd3jEvDOqD8vZjVF1pguJY5KDUzJIdH27jfzCrQWlG+KAtJCs06N4GOKqF1doLWVko9tW2uTYRe9VVfwJBAJjs7zzaVE5m6+Sd7v42llYWyIVwMRAgxq+ILArq5COiDkoc00VxelF9e+Ob9XvyTcrsdV1M0isZfHk4wyIeHOkCQQCVBi2z7xfUmxZxGJBpRr7xGtR4/ddaQvFazFu2BwG6yvm2KPvsqfDZxOjK8aWtjTUW/+RkLmPkNKG1Tu7TrZyK";

	//支付宝的公钥，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
	public static String ALIPAY_PUBLIC_KEY  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";
	
	// 签名方式
	public static String SIGN_TYPE = "RSA";
	
	// 调试用，创建TXT日志文件夹路径，见AlipayCore.java类中的logResult(String sWord)打印方法。
	public static String LOG_PATH ="/var/log/happy-help";
		
	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String INPUT_CHARSET = "utf-8";

	// 接收通知的接口名
	public static String SERVICE = "alipay.trade.app.pay";

	public static String NOTIFY_URL = "http://120.77.59.76/happy-help/api/v1/anon/notify";

	public static String FORMAT = "json";

	public static String VERSION = "1.0";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
}

