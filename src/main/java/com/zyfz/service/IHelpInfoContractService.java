package com.zyfz.service;

import com.zyfz.domain.HelpContract;

import java.util.List;

/**
 * Created by ron on 16-12-14.
 */
public interface IHelpInfoContractService extends IBaseService<HelpContract> {
    public List<HelpContract> selectByHelpInfo(Integer helpInfoId);

    public HelpContract selectByHelpInfoAndUserV1(HelpContract helpContract);

    public HelpContract selectByHelpInfoAndUserV2(HelpContract helpContract);
}
