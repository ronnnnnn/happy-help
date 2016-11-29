package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.SystemMessageMapper;
import com.zyfz.domain.SystemMessage;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ISystemMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-11-28.
 */
@Service
public class SystemMessageServiceImpl implements ISystemMessageService {

    @Resource
    SystemMessageMapper systemMessageMapper;

    @Override
    public Integer save(SystemMessage systemMessage) {
        return systemMessageMapper.insertSelective(systemMessage);
    }

    @Override
    public Integer update(SystemMessage systemMessage) {
        return systemMessageMapper.updateByPrimaryKeySelective(systemMessage);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public SystemMessage getOneById(SystemMessage systemMessage) {
        return systemMessageMapper.selectByPrimaryKey(systemMessage.getId());
    }

    @Override
    public Integer deleteOneById(SystemMessage systemMessage) {
        return systemMessageMapper.deleteByPrimaryKey(systemMessage.getId());
    }

    @Override
    public Datagrid getByUserId(SystemMessage systemMessage,PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<SystemMessage> systemMessages = systemMessageMapper.selectByUserId(systemMessage);
        PageInfo pageInfo = new PageInfo(systemMessages);
        Datagrid datagrid = new Datagrid(pageInfo.getTotal(),systemMessages);
        return datagrid;
    }
}
