package com.zyfz.service;

import com.zyfz.domain.PlatformRecord;
import com.zyfz.model.AppPlatformModel;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-12-10.
 */
public interface IPlatformRecordService extends IBaseService<PlatformRecord> {

    public Datagrid selectWithParam(AppPlatformModel record, PageModel pageModel);

    public Datagrid selectAll(PageModel pageModel);

    public Double selectSumMoney(String incomeType);
}
