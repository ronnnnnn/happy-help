package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.PrizeMapper;
import com.zyfz.domain.Prize;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPrizeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-10-23.
 */
@Service
public class PrizeServiceImpl implements IPrizeService {

    @Resource
    PrizeMapper prizeMapper;

    @Override
    public Integer save(Prize prize) {
        return prizeMapper.insertSelective(prize);
    }

    @Override
    public Integer update(Prize prize) {
        return prizeMapper.updateByPrimaryKeySelective(prize);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<Prize> prizes = prizeMapper.selectAll();
        PageInfo pageInfo = new PageInfo();
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(prizes);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Prize getOneById(Prize prize) {
        return prizeMapper.selectByPrimaryKey(prize.getId());
    }

    @Override
    public Integer deleteOneById(Prize prize) {
        return prizeMapper.deleteByPrimaryKey(prize.getId());
    }
}
