package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.MoneyRecordMapper;
import com.zyfz.domain.MoneyRecord;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IMoneyRecordService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-12-7.
 */
@Service
public class MoneyRecordServiceImpl implements IMoneyRecordService{
    @Resource
    MoneyRecordMapper moneyRecordMapper;

    @Override
    public Integer save(MoneyRecord moneyRecord) {
        return moneyRecordMapper.insertSelective(moneyRecord);
    }

    @Override
    public Integer update(MoneyRecord moneyRecord) {
        return moneyRecordMapper.updateByPrimaryKeySelective(moneyRecord);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<MoneyRecord> moneyRecords = moneyRecordMapper.selectAll();
        PageInfo pageInfo = new PageInfo(moneyRecords);
        return new Datagrid(pageInfo.getTotal(),moneyRecords);
    }

    @Override
    public MoneyRecord getOneById(MoneyRecord moneyRecord) {
        return moneyRecordMapper.selectByPrimaryKey(moneyRecord.getId());
    }

    @Override
    public Integer deleteOneById(MoneyRecord moneyRecord) {
        return moneyRecordMapper.deleteByPrimaryKey(moneyRecord.getId());
    }

    @Override
    public Datagrid getByTradeOrderNo(PageModel pageModel,String tradeOrderNo) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<MoneyRecord> moneyRecords = moneyRecordMapper.selectByTradeOrderNo(tradeOrderNo);
        PageInfo pageInfo = new PageInfo(moneyRecords);
        return new Datagrid(pageInfo.getTotal(),moneyRecords);
    }

    @Override
    public Datagrid getByTimeRange(PageModel pageModel,Date startTime, Date endTime) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<MoneyRecord> moneyRecords = moneyRecordMapper.selectByTimeRange(startTime,endTime);
        PageInfo pageInfo = new PageInfo(moneyRecords);
        return new Datagrid(pageInfo.getTotal(),moneyRecords);
    }
}
