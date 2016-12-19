package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.PlatformRecordMapper;
import com.zyfz.domain.PlatformRecord;
import com.zyfz.model.AppPlatformModel;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPlatformRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-10.
 */
@Service
public class PlatformServiceImpl implements IPlatformRecordService {
    @Resource
    PlatformRecordMapper platformRecordMapper;

    @Override
    public Integer save(PlatformRecord platformRecord) {
        return platformRecordMapper.insertSelective(platformRecord);
    }

    @Override
    public Integer update(PlatformRecord platformRecord) {
        return platformRecordMapper.updateByPrimaryKeySelective(platformRecord);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public PlatformRecord getOneById(PlatformRecord platformRecord) {
        return platformRecordMapper.selectByPrimaryKey(platformRecord.getId());
    }

    @Override
    public Integer deleteOneById(PlatformRecord platformRecord) {
        return platformRecordMapper.deleteByPrimaryKey(platformRecordMapper.deleteByPrimaryKey(platformRecord.getId()));
    }

    @Override
    public Datagrid selectWithParam(AppPlatformModel record, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<PlatformRecord> platformRecords = platformRecordMapper.selectWithParam(record);
        PageInfo pageInfo = new PageInfo(platformRecords);
        return new Datagrid(pageInfo.getTotal(),platformRecords);
    }

    @Override
    public Datagrid selectAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<PlatformRecord> platformRecords = platformRecordMapper.selectAll();
        PageInfo pageInfo = new PageInfo(platformRecords);
        return new Datagrid(pageInfo.getTotal(),platformRecords);
    }

    @Override
    public Double selectSumMoney(String incomeType) {
        return platformRecordMapper.selectSumMoney(incomeType);
    }

    @Override
    public Double selectSumMoneyTemp(String incomeType) {
        return platformRecordMapper.selectSumMoneyTemp(incomeType);
    }
}
