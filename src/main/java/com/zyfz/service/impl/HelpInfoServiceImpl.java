package com.zyfz.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.HelpContractMapper;
import com.zyfz.dao.HelpInfoMapper;
import com.zyfz.domain.HelpContract;
import com.zyfz.domain.HelpInfo;
import com.zyfz.domain.Setting;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IHelpInfoService;
import com.zyfz.service.ISettingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-10-31.
 */
@Service
public class HelpInfoServiceImpl implements IHelpInfoService {
    @Resource
    HelpInfoMapper helpInfoMapper;

    @Resource
    HelpContractMapper helpContractMapper;

    @Resource
    ISettingService settingService;

    @Override
    public Integer save(HelpInfo helpInfo) {
        helpInfo.setCreateTime(new Date());
        helpInfoMapper.insertSelective(helpInfo);
        return helpInfo.getId();
    }

    @Override
    public Integer update(HelpInfo helpInfo) {
        return helpInfoMapper.updateByPrimaryKeySelective(helpInfo);
    }

    @Override
    public Datagrid getHelpInfoWithUserByCIDAndTime(Integer categoryId, Date startTime, Date endTime, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<HelpInfo> helpInfos = helpInfoMapper.selectWithUserByCIDAndTime(categoryId,startTime,endTime);
        PageInfo pageInfo = new PageInfo(helpInfos);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(helpInfos);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public HelpInfo getOneById(HelpInfo helpInfo) {
        return helpInfoMapper.selectByPrimaryKey(helpInfo.getId());
    }

    @Override
    public Integer deleteOneById(HelpInfo helpInfo) {
        return helpInfoMapper.deleteByPrimaryKey(helpInfo.getId());
    }

    @Override
    public Datagrid getHelpInfoWithUserByKey(String key,PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        String mKey = "%"+key+"%";
        List<HelpInfo> helpInfos = helpInfoMapper.selectWithUserByKey(mKey);
        PageInfo pageInfo = new PageInfo(helpInfos);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(helpInfos);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid selectAllWithParam(PageModel pageModel, HelpInfo helpInfo) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<HelpInfo> helpInfos = helpInfoMapper.selectAllWithParam(helpInfo);
        PageInfo pageInfo = new PageInfo(helpInfos);
        return new Datagrid(pageInfo.getTotal(),helpInfos);
    }

    @Override
    public HelpInfo selectByUniq(Integer usrId, Date createTime) {
        return helpInfoMapper.selectByUniq(usrId,createTime);
    }

    @Override
    public List<HelpInfo> selectByCategory(Integer cid) {
        return helpInfoMapper.selectByCategory(cid);
    }

    @Override
    public List<HelpInfo> selectByTime() {
        Integer timeoutValue = 8;
        try {
            Setting setting = settingService.selectBySysTypeAndTypeName(new Setting("紧急求助","失效时间"));
            timeoutValue = Integer.valueOf(setting.getTypeValue());
        }catch (Exception e){
            e.printStackTrace();
        }
        HelpInfo helpInfo = new HelpInfo();
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.HOUR_OF_DAY,-timeoutValue);
        Date date = calendar.getTime();
        helpInfo.setCreateTime(date);
        return helpInfoMapper.selectByTime(helpInfo);
    }

    @Override
    public HelpInfo selectByUniq(Integer id) {
        HelpInfo helpInfo = helpInfoMapper.selectByPrimaryKey(id);
        List<HelpContract> helpContracts = helpContractMapper.selectByHelpInfo(helpInfo.getId());
        helpInfo.setHelpContracts(helpContracts);
        return helpInfo;
    }
}
