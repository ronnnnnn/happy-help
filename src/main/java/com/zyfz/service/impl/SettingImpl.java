package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.SettingMapper;
import com.zyfz.domain.Setting;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ISettingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-10-23.
 */
@Service
public class SettingImpl implements ISettingService {
    @Resource
    SettingMapper settingMapper;

    @Override
    public Integer save(Setting setting) {
        return settingMapper.insertSelective(setting);
    }

    @Override
    public Integer update(Setting setting) {
        return settingMapper.updateByPrimaryKeySelective(setting);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<Setting> settings = settingMapper.selectAll();
        PageInfo pageInfo = new PageInfo(settings);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(settings);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Setting getOneById(Setting setting) {
        return settingMapper.selectByPrimaryKey(setting.getId());
    }

    @Override
    public Integer deleteOneById(Setting setting) {
        return settingMapper.deleteByPrimaryKey(setting.getId());
    }

    @Override
    public List<Setting> getSettingsBySysType(String sysType) {
        return settingMapper.selectBySysType(sysType);
    }

    @Override
    public Setting selectBySysTypeAndTypeName(Setting setting) {
        return settingMapper.selectBySysTypeAndTypeName(setting);
    }
}
