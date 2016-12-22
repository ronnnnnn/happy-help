package com.zyfz.dao;

import com.zyfz.domain.UserWithdraw;
import com.zyfz.domain.UserWithdrawExample;
import java.util.List;

import jdk.nashorn.internal.runtime.ListAdapter;
import org.apache.ibatis.annotations.Param;

public interface UserWithdrawMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(UserWithdraw record);

    int insertSelective(UserWithdraw record);

    UserWithdraw selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserWithdraw record);

    int updateByPrimaryKey(UserWithdraw record);

    List<UserWithdraw> selectAll();

    List<UserWithdraw> selectBySelective(UserWithdraw userWithdraw);
}