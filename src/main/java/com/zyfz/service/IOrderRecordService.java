package com.zyfz.service;

import com.zyfz.domain.OrderRecord;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-12-3.
 */
public interface IOrderRecordService extends IBaseService<OrderRecord> {

    public OrderRecord selectByContactId(Integer contractId);

    public Datagrid getByTradeNo(PageModel pageModel,String tradeNo);
}
