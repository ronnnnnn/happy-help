package com.zyfz.service;

import com.zyfz.domain.ServerContract;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-12-6.
 */
public interface IServerContractService extends IBaseService<ServerContract> {
    public ServerContract getByUserAndServer(ServerContract serverContract);

    public Datagrid selectByServerId(Integer serverId, PageModel pageModel);
}
