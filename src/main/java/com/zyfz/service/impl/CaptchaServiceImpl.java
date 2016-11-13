package com.zyfz.service.impl;

import com.zyfz.dao.CaptchaMapper;
import com.zyfz.domain.Captcha;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICaptchaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-11-13.
 */
@Service
public class CaptchaServiceImpl implements ICaptchaService {

    @Resource
    CaptchaMapper captchaMapper;

    @Override
    public Integer save(Captcha captcha) {
        return captchaMapper.insertSelective(captcha);
    }

    @Override
    public List<Captcha> selectByCaptcha(String captcha) {
        return captchaMapper.selectByCaptcha(captcha);
    }

    @Override
    public Integer update(Captcha captcha) {
        return null;
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public Captcha getOneById(Captcha captcha) {
        return null;
    }

    @Override
    public Integer deleteOneById(Captcha captcha) {
        return null;
    }
}
