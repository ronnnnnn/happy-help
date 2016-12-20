package com.zyfz.dao;

import com.zyfz.domain.UserNote;
import com.zyfz.domain.UserNoteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserNoteMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(UserNote record);

    int insertSelective(UserNote record);

    UserNote selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserNote record);

    int updateByPrimaryKey(UserNote record);

    List<UserNote> selectAll();

    List<UserNote> selectSearchKey(String searchKey);
}