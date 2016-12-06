package com.zyfz.service.impl;

import com.zyfz.dao.ServerContractMapper;
import com.zyfz.domain.ServerContract;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IServerContractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ron on 16-12-6.
 */
@Service
public class ServerContractServiceImpl implements IServerContractService {

    @Resource
    ServerContractMapper serverContractMapper;

    @Override
    public Integer save(ServerContract serverContract) {
        return serverContractMapper.insertSelective(serverContract);
    }

    @Override
    public Integer update(ServerContract serverContract) {
        return serverContractMapper.updateByPrimaryKeySelective(serverContract);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public ServerContract getOneById(ServerContract serverContract) {
        return serverContractMapper.selectByPrimaryKey(serverContract.getId());
    }

    @Override
    public Integer deleteOneById(ServerContract serverContract) {
        return serverContractMapper.deleteByPrimaryKey(serverContract.getId());
    }

    @Override
    public ServerContract getByUserAndServer(ServerContract serverContract) {
        return serverContractMapper.selectByUserAndServer(serverContract);
    }
}
