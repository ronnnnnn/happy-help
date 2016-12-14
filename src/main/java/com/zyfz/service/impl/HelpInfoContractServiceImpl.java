package com.zyfz.service.impl;

import com.zyfz.dao.HelpContractMapper;
import com.zyfz.domain.HelpContract;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IHelpInfoContractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-14.
 */
@Service
public class HelpInfoContractServiceImpl implements IHelpInfoContractService {

    @Resource
    HelpContractMapper helpContractMapper;

    @Override
    public Integer save(HelpContract helpContract) {
        return helpContractMapper.insertSelective(helpContract);
    }

    @Override
    public Integer update(HelpContract helpContract) {
        return helpContractMapper.updateByPrimaryKeySelective(helpContract);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public HelpContract getOneById(HelpContract helpContract) {
        return helpContractMapper.selectByPrimaryKey(helpContract.getId());
    }

    @Override
    public Integer deleteOneById(HelpContract helpContract) {
        return helpContractMapper.deleteByPrimaryKey(helpContract.getId());
    }

    @Override
    public List<HelpContract> selectByHelpInfo(Integer helpInfoId) {
        return helpContractMapper.selectByHelpInfo(helpInfoId);
    }

    @Override
    public HelpContract selectByHelpInfoAndUserV1(HelpContract helpContract) {
        return helpContractMapper.selectByHelpInfoAndUserV1(helpContract);
    }

    @Override
    public HelpContract selectByHelpInfoAndUserV2(HelpContract helpContract) {
        return helpContractMapper.selectByHelpInfoAndUserV2(helpContract);
    }
}
