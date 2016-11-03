package com.zyfz.web.exception;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by ron on 16-11-3.
 */
public class MyExceptionResolver implements HandlerExceptionResolver {
    private static final Logger logger = Logger.getLogger(MyExceptionResolver.class);

    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        Map<String, Object> model = new ConcurrentHashMap<String, Object>();
        model.put("exception", ex);
        // 可以细化异常信息，给出相应的提示
        logger.info("==========发生了异常：");
        logger.info("==========异常类型："+ex.getClass().getSimpleName());
        logger.info("==========异常描述："+ex.getMessage());
        logger.info("==========异常原因："+ex.getCause());
        return new ModelAndView("admin/error/unauthorized",model);
    }
}
