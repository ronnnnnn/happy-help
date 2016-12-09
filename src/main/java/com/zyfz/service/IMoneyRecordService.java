package com.zyfz.service;

import com.zyfz.domain.MoneyRecord;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

import java.util.Date;

/**
 * Created by ron on 16-12-7.
 */
public interface IMoneyRecordService extends IBaseService<MoneyRecord> {

    public Datagrid getByTradeOrderNo(PageModel pageModel,String tradeOrderNo);

    public Datagrid getByTimeRange(PageModel pageModel, Date startTime, Date endTime);

}
