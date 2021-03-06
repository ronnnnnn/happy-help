package com.zyfz.dao;

import com.zyfz.domain.OrderRecord;

import java.util.List;

public interface OrderRecordMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(OrderRecord record);

    int insertSelective(OrderRecord record);

    OrderRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderRecord record);

    int updateByPrimaryKey(OrderRecord record);

    List<OrderRecord> selectAll();

    OrderRecord selectByContactId(Integer contractId);

    List<OrderRecord> selectByTradeNo(String tradeNo);
}