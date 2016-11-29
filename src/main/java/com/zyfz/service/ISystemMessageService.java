package com.zyfz.service;

import com.zyfz.dao.SystemMessageMapper;
import com.zyfz.domain.SystemMessage;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

import javax.annotation.Resource;

/**
 * Created by ron on 16-11-28.
 */
public interface ISystemMessageService extends IBaseService<SystemMessage>{

    public Datagrid getByUserId(SystemMessage systemMessage, PageModel pageModel);

}
