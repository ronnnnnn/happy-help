package com.zyfz.service;

import com.zyfz.domain.ServerContract;

/**
 * Created by ron on 16-12-6.
 */
public interface IServerContractService extends IBaseService<ServerContract> {
    public ServerContract getByUserAndServer(ServerContract serverContract);
}
