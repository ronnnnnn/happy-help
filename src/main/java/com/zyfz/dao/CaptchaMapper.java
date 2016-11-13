package com.zyfz.dao;

import com.zyfz.domain.Captcha;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CaptchaMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Captcha record);

    int insertSelective(Captcha record);

    Captcha selectByCaptcha(String  captcha);

    Captcha selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Captcha record);

    int updateByPrimaryKey(Captcha record);

}