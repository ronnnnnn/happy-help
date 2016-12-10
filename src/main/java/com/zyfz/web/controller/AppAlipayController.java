package com.zyfz.web.controller;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.zyfz.alipay.util.OrderInfoUtil2_0;
import com.zyfz.domain.MoneyRecord;
import com.zyfz.model.AppOrderModel;
import com.zyfz.service.IMoneyRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.zyfz.alipay.config.AlipayConfig.*;

/**
 * Created by ron on 16-12-1.
 */
@Controller
public class AppAlipayController {

    private static Logger logger = LoggerFactory.getLogger(AppAlipayController.class);

    @Resource
    IMoneyRecordService moneyRecordService;
    /**
     * 异步接受支付宝支付结果
     * 支付宝服务器调用
     *
     * @param request
     * @param response
     */

    @RequestMapping(value = "/api/v1/anon/notify", method = RequestMethod.POST)
    public void receiveNotify(HttpServletRequest request, HttpServletResponse response) {
        try {
            //获取支付宝POST过来反馈信息
            Map<String, String> params = new HashMap<String, String>();
            Map requestParams = request.getParameterMap();
            this.handleParam(params,requestParams);
            logger.info("============"+params.toString()+"=============");
            PrintWriter printWriter = null;
            try {
                printWriter = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            //获取参数
            //商户订单号
            String out_trade_no = null;
            String total_amount = null;
            String seller_id = null;
            String app_id = null;
            try {
                out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
                total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
                seller_id = new String(request.getParameter("seller_id").getBytes("ISO-8859-1"), "UTF-8");
                app_id = new String(request.getParameter("app_id").getBytes("ISO-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                logger.info(e.toString());
            }

            Map<String, String> paramsMap = params; //将异步通知中收到的待验证所有参数都存放到map中
            boolean signVerified = false;//调用SDK验证签名
            try {
                signVerified = AlipaySignature.rsaCheckV1(paramsMap, ALIPAY_PUBLIC_KEY, INPUT_CHARSET);
            } catch (AlipayApiException e) {
                e.printStackTrace();
                logger.info(e.toString());
            }
            if(signVerified){
                // TODO 验签成功后
                //按照支付结果异步通知中的描述，对支付结果中的业务内容进行1\2\3\4二次校验，校验成功后在response中返回success，校验失败返回failure
                MoneyRecord moneyRecord = moneyRecordService.getByTradeOrderNoUniq(out_trade_no);
                if (moneyRecord == null){
                    if (moneyRecord.getMoney() == Double.valueOf(total_amount) && PID == seller_id && APPID == app_id ){
                        moneyRecord.setIsValied(true);
                        moneyRecordService.update(moneyRecord);
                        if (printWriter != null) {
                            printWriter.print("success");//请不要修改或删除
                        }
                    }
                }
            }else{
                // TODO 验签失败则记录异常日志，并在response中返回failure.
                if (printWriter != null) {
                    printWriter.print("failure");//请不要修改或删除
                }
            }

        }catch (Exception e){
            e.printStackTrace();
            logger.info(e.toString());
        }
    }

//    @RequestMapping(value = "/api/v1/anon/notify", method = RequestMethod.POST)
//    public void receiveNotify(HttpServletRequest request, HttpServletResponse response) {
//
//        try {
//
//            String resultResponse = "success";
//            PrintWriter printWriter = null;
//
//            //获取支付宝POST过来反馈信息
//            Map<String, String> params = new HashMap<String, String>();
//            Map requestParams = request.getParameterMap();
//
//            this.handleParam(params,requestParams);
//
//            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
//
//            //商户订单号
//            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
//            //支付宝交易号
//            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
//            //交易状态
//            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
//
//            //异步通知ID
//            String notify_id = request.getParameter("notify_id");
//
//            //sign
//            String sign = request.getParameter("sign");
//            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
//
//
//            printWriter = response.getWriter();
//
//
//            if (notify_id != "" && notify_id != null) {////判断接受的post通知中有无notify_id，如果有则是异步通知。
//                if (AlipayNotify.verifyResponse(notify_id).equals("true"))//判断成功之后使用getResponse方法判断是否是支付宝发来的异步通知。
//                {
//                    if (AlipayNotify.getSignVeryfy(params, sign))//使用支付宝公钥验签
//                    {
//                        //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
//                        if (trade_status.equals("TRADE_FINISHED")) {
//                            //判断该笔订单是否在商户网站中已经做过处理
//                            //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//                            //如果有做过处理，不执行商户的业务程序
//                            //注意：
//                            //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
//                            //请务必判断请求时的out_trade_no、total_fee、seller_id与通知时获取的out_trade_no、total_fee、seller_id为一致的
//
//                        } else if (trade_status.equals("TRADE_SUCCESS")) {
//                            //判断该笔订单是否在商户网站中已经做过处理
//                            //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//                            //如果有做过处理，不执行商户的业务程序
//                            //注意：
//                            //付款完成后，支付宝系统发送该交易状态通知
//                            //请务必判断请求时的out_trade_no、total_fee、seller_id与通知时获取的out_trade_no、total_fee、seller_id为一致的
//                        }
//                        //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
//                        if (printWriter != null) {
//                            printWriter.print("success");//请不要修改或删除
//                        }
//                        //调试打印log
//                        AlipayCore.logResult("notify_url success!","notify_url");
//                    } else//验证签名失败
//                    {
//                        if (printWriter != null) {
//                            printWriter.print("sign fail");
//                        }
//                    }
//                } else//验证是否来自支付宝的通知失败
//                {
//                    if (printWriter != null) {
//                        printWriter.print("response fail");
//                    }
//                }
//            } else {
//                if (printWriter != null) {
//                    printWriter.print("no notify message");
//                }
//            }
//
//        }catch (UnsupportedEncodingException e){
//            e.printStackTrace();
//        }catch (IOException e){
//            e.printStackTrace();
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }

    @RequestMapping(value = "/api/v1/anon/signatures",method = RequestMethod.POST)
    public void signatrues2(@RequestParam Map<String,String> reqParams, HttpServletResponse response){
        //记录订单
        String jsonString = reqParams.get("biz_content");
        AppOrderModel appOrderModel = JSON.parseObject(jsonString,AppOrderModel.class);
        logger.info("======="+appOrderModel.getOut_trade_no()+"========");
        MoneyRecord moneyRecord = new MoneyRecord(null,appOrderModel.getOut_trade_no(),
                                                        appOrderModel.getUserId(),
                                                        appOrderModel.getTotal_amount(),
                                                        appOrderModel.getSubject(),
                                                        appOrderModel.getBody(),
                                                        false,
                                                        new Date());

        moneyRecordService.save(moneyRecord);
        //处理签名
        reqParams.put("charset", INPUT_CHARSET);
        reqParams.put("method", SERVICE);
        reqParams.put("notify_url",NOTIFY_URL);
        reqParams.put("sign_type", SIGN_TYPE);
        String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(new Date());
        reqParams.put("timestamp", timestamp);
        reqParams.put("version",VERSION);

        String orderParam = OrderInfoUtil2_0.buildOrderParam(reqParams);
        String sign = OrderInfoUtil2_0.getSign(reqParams, RSA_PRIVATE);
        String orderInfo = orderParam + "&" + sign;   // 订单信息
        logger.info("signatrues2: 订单信息 ==>" + orderInfo);
        try {
            PrintWriter printWriter = response.getWriter();
            printWriter.flush();
            printWriter.print(orderInfo);
        } catch (IOException e){
            e.printStackTrace();
        }
    }

//    @RequestMapping(value = "/api/v1/anon/msignatures",method = RequestMethod.POST)
//    public void signatures(HttpServletRequest request, HttpServletResponse response){
//        try {
//            PrintWriter printWriter = response.getWriter();
//            //获取支付宝POST过来反馈信息
//            Map<String,String> params = new HashMap<String,String>();
//            Map requestParams = request.getParameterMap();
//
//            this.handleParam(params,requestParams);
//
//            if(params!=null&&params.size()>0)
//            {
//                //partner
//                String partner=request.getParameter("partner");
//                AlipayCore.logResult(partner,"partner");
//                //接口名
//                String service=request.getParameter("service");
//                //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
//
//                if(partner.replace("\"","").equals(AlipayConfig.PARTNER)&& service.replace("\"","").equals(AlipayConfig.SERVICE)){//确认PID和接口名称。
//
//                    //将post接收到的数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串。需要排序。
//                    String data=AlipayCore.createLinkString(params);
//
//                    //打印待签名字符串。工程目录下的log文件夹中。
//                    AlipayCore.logResult(data,"datashuju");
//
//                    //将待签名字符串使用私钥签名。
//                    String rsa_sign= URLEncoder.encode(RSA.sign(data, RSA_PRIVATE, AlipayConfig.INPUT_CHARSET),AlipayConfig.INPUT_CHARSET);
//
//                    //把签名得到的sign和签名类型sign_type拼接在待签名字符串后面。
//                    data=data+"&sign=\""+rsa_sign+"\"&sign_type=\""+AlipayConfig.SIGN_TYPE+"\"";
//
//                    //返回给客户端,建议在客户端使用私钥对应的公钥做一次验签，保证不是他人传输。
//                    printWriter.flush();
//                    printWriter.print(data);
//                }
//                else
//                {
//                    printWriter.print("客户端信息与服务端配置信息有误！");
//                }
//            }
//            else
//            {
//                printWriter.print("无客户端信息!");
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }

    private void handleParam(Map<String,String> params,Map requestParams){
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
    }
}
