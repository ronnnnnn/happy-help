package com.zyfz.web.controller;

import com.zyfz.model.ResponseMessage;
import com.zyfz.web.util.DeviceUtil;
import com.zyfz.web.util.JsonView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-11-18.
 */
@Controller
public class ErrorHandlerController extends BaseController{

    /**
     * 请求异常
     * @return
     * @throws Exception
     * String
     */
    @RequestMapping(value = "/error_404", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public ModelAndView error_404(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if(DeviceUtil.isMobileDevice(request.getHeader("user-agent"))){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","找不到页面");
            return JsonView.Render(new ResponseMessage<Map<String,String>>(404,"找不到页面",map),response);
        }else{
            ModelAndView mv = new ModelAndView();
           // mv.addObject("exception", e);
            mv.addObject("errorCode",404);
            mv.setViewName("admin/error/error_page");
            return mv;
        }
    }
    /**
     * 服务器异常
     * @return
     * String
     */
    @RequestMapping(value ="/error_500", produces = "text/html;charset=UTF-8")
    public ModelAndView error_500(HttpServletRequest request,HttpServletResponse response) {

        if(DeviceUtil.isMobileDevice(request.getHeader("user-agent"))){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","服务器内部错误");
            return JsonView.Render(new ResponseMessage<Map<String,String>>(500,"服务器内部错误",map),response);
        }else{
            ModelAndView mv = new ModelAndView();
            // mv.addObject("exception", e);
            mv.addObject("errorCode",500);
            mv.setViewName("admin/error/error_page");
            return mv;
        }
    }
}
