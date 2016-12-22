package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.UserWithdrawMapper;
import com.zyfz.domain.UserWithdraw;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserWithdrawServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-20.
 */
@Service
public class UserWithdrawServiceImpl implements IUserWithdrawServiceImpl {
    @Resource
    UserWithdrawMapper userWithdrawMapper;

    @Override
    public Integer save(UserWithdraw userWithdraw) {
        return userWithdrawMapper.insertSelective(userWithdraw);
    }

    @Override
    public Integer update(UserWithdraw userWithdraw) {
        return userWithdrawMapper.updateByPrimaryKeySelective(userWithdraw);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<UserWithdraw> userWithdraws = userWithdrawMapper.selectAll();
        PageInfo pageInfo = new PageInfo(userWithdraws);
        return new Datagrid(pageInfo.getTotal(),userWithdraws);
    }

    @Override
    public UserWithdraw getOneById(UserWithdraw userWithdraw) {
        return userWithdrawMapper.selectByPrimaryKey(userWithdraw.getId());
    }

    @Override
    public Integer deleteOneById(UserWithdraw userWithdraw) {
        return userWithdrawMapper.deleteByPrimaryKey(userWithdraw.getId());
    }

    @Override
    public Datagrid selectBySelective(UserWithdraw userWithdraw, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<UserWithdraw> userWithdraws = userWithdrawMapper.selectBySelective(userWithdraw);
        PageInfo pageInfo = new PageInfo(userWithdraws);
        return new Datagrid(pageInfo.getTotal(),userWithdraws);
    }
}
