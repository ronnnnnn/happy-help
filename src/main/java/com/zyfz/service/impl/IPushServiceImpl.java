package com.zyfz.service.impl;

import com.zyfz.dao.PushMapper;
import com.zyfz.domain.Push;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPushService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ron on 16-12-6.
 */
@Service
public class IPushServiceImpl implements IPushService {
    @Resource
    PushMapper pushMapper;

    @Override
    public Integer save(Push push) {
        return pushMapper.insertSelective(push);
    }

    @Override
    public Integer update(Push push) {
        return pushMapper.updateByPrimaryKeySelective(push);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public Push getOneById(Push push) {
        return pushMapper.selectByPrimaryKey(push.getId());
    }

    @Override
    public Integer deleteOneById(Push push) {
        return pushMapper.deleteByPrimaryKey(push.getId());
    }

    @Override
    public Push selectByUserId(Integer hhUserId) {
        return pushMapper.selectByUserId(hhUserId);
    }
}
