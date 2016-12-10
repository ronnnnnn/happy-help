package com.zyfz.service;

import com.github.pagehelper.PageInfo;
import com.zyfz.domain.HelpInfo;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-10-31.
 */
public interface IHelpInfoService extends IBaseService<HelpInfo> {
    public Datagrid getHelpInfoWithUserByCIDAndTime(Integer categoryId, Date startTime, Date endTime, PageModel pageModel);

    public Datagrid getHelpInfoWithUserByKey(String key,PageModel pageModel);

    public Datagrid selectAllWithParam(PageModel pageModel,HelpInfo helpInfo);
}
