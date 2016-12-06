package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.OrderRecordMapper;
import com.zyfz.domain.OrderRecord;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IOrderRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-3.
 */
@Service
public class OrderRecordServiceImpl implements IOrderRecordService {

    @Resource
    OrderRecordMapper orderRecordMapper;

    @Override
    public Integer save(OrderRecord orderRecord) {
        return orderRecordMapper.insertSelective(orderRecord);
    }

    @Override
    public Integer update(OrderRecord orderRecord) {
        return orderRecordMapper.updateByPrimaryKeySelective(orderRecord);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<OrderRecord> orderRecords = orderRecordMapper.selectAll();
        PageInfo pageInfo = new PageInfo(orderRecords);
        Datagrid datagrid = new Datagrid(pageInfo.getTotal(),orderRecords);
        return datagrid;
    }

    @Override
    public OrderRecord getOneById(OrderRecord orderRecord) {
        return orderRecordMapper.selectByPrimaryKey(orderRecord.getId());
    }

    @Override
    public Integer deleteOneById(OrderRecord orderRecord) {
        return orderRecordMapper.deleteByPrimaryKey(orderRecord.getId());
    }

    @Override
    public OrderRecord selectByContactId(Integer contractId) {
        return orderRecordMapper.selectByContactId(contractId);
    }
}
