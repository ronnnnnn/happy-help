package com.zyfz.service;

import com.zyfz.domain.Captcha;

import java.util.List;

/**
 * Created by ron on 16-11-13.
 */
public interface ICaptchaService extends  IBaseService<Captcha>{
    public List<Captcha> selectByCaptcha(String captcha);
 }
