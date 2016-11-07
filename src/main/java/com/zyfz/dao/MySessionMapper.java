package com.zyfz.dao;

import com.zyfz.domain.MySession;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MySessionMapper {

    int deleteByPrimaryKey(Long id);

    int insert(MySession record);

    int insertSelective(MySession record);

    MySession selectByPrimaryKey(Long id);

    MySession selectByCookie(String sessionId);

    int updateByPrimaryKeySelective(MySession record);

    int updateByPrimaryKeyWithBLOBs(MySession record);

    int updateByPrimaryKey(MySession record);
}