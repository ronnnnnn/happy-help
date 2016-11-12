package com.zyfz.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import com.zyfz.model.ResponseMessage;
import com.zyfz.web.util.Const;
import com.zyfz.web.util.Generator;
import org.hibernate.validator.constraints.NotBlank;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;


/**
 * Created by dengfengdecao on 16/9/19.
 * @see <a href=https://api.alidayu.com/doc2/apiDetail.htm?apiId=25450>
 *     https://api.alidayu.com/doc2/apiDetail.htm?apiId=25450</a>
 */
@SessionAttributes("captcha")
@RestController
@RequestMapping("/api/v1/sms")
public class AppSmsCaptchaController extends BaseController {

    public static final Logger log = LoggerFactory.getLogger(AppSmsCaptchaController.class);

    // 短信模板变量，传参规则{"key":"value"}
    @NotBlank
    private String smsParam;

    private String extend;


    @RequestMapping(value = "/captcha/{recPhoneNum}", method = RequestMethod.POST)
    @ResponseBody
    public Object getSmsCaptcha(ModelMap model, @PathVariable("recPhoneNum")String recPhoneNum, HttpServletResponse response) {

        String responseBody = null;
        if (recPhoneNum == null || recPhoneNum.trim().length() < 0 || recPhoneNum.trim().length() > 11) {
//            model.addAttribute("error_msg", "请输入正确手机号!");
//            return model.toString();
            ResponseMessage<String> responseMessage = new ResponseMessage<String>(40001,"手机号码格式错误！",null);
            return responseMessage;
        }

        String captcha  = Generator.generateCaptcha();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("captcha", captcha);
        jsonObject.put("product", "乐助风");

        TaobaoClient client = new DefaultTaobaoClient(Const.SERVER_URL, Const.APP_KEY, Const.APP_SECRET);
        AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
        // req.setExtend("123456");
        req.setSmsType(Const.SMS_TYPE);
        req.setSmsFreeSignName(Const.SMS_FREE_SIGN_NAME);
        req.setSmsTemplateCode(Const.SMS_TEMPLATE_CODE);
        req.setRecNum(recPhoneNum);
        smsParam = jsonObject.toJSONString();
        log.debug("getSmsCaptcha: smsParam=" + smsParam);
        req.setSmsParamString(smsParam);
        ResponseMessage<String> responseMessage = new ResponseMessage<String>();
        try {
            AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
           // model.addAttribute("captcha", captcha);
            responseMessage.setResult(captcha);
            responseBody = rsp.getBody();
            log.debug("getSmsCaptcha: responseBody = " + responseBody);
            if (rsp.getResult() != null) {
                //model.addAttribute("success_response", rsp.getResult());
                responseMessage.setMessage("success");
            } else {
               // model.addAttribute("error_response", rsp.getSubMsg());
                responseMessage.setMessage(rsp.getSubMsg().toString());
            }
        } catch (ApiException e) {
            log.error("getSmsCaptcha :" + e.getErrMsg());
        }

        JSONObject jsonBody = JSONObject.parseObject(responseBody);
        JSONObject successJson = jsonBody.getJSONObject("alibaba_aliqin_fc_sms_num_send_response");
        if (successJson != null) {
//            successJson = successJson.getJSONObject("result");
//            return successJson.getBoolean("success");
            return responseMessage;
        } else {
            return new ResponseMessage<String>(50001,"系统内部错误",null);
        }

    }


}
