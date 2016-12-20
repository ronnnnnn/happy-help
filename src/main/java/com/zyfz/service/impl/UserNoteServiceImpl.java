package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.UserNoteMapper;
import com.zyfz.domain.UserNote;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserNoteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-20.
 */
@Service
public class UserNoteServiceImpl implements IUserNoteService {
    @Resource
    UserNoteMapper userNoteMapper;

    @Override
    public Integer save(UserNote userNote) {
        return userNoteMapper.insertSelective(userNote);
    }

    @Override
    public Integer update(UserNote userNote) {
        return userNoteMapper.updateByPrimaryKeySelective(userNote);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<UserNote> userNotes = userNoteMapper.selectAll();
        PageInfo pageInfo = new PageInfo(userNotes);
        return new Datagrid(pageInfo.getTotal(),userNotes);
    }

    @Override
    public UserNote getOneById(UserNote userNote) {
        return userNoteMapper.selectByPrimaryKey(userNote.getId());
    }

    @Override
    public Integer deleteOneById(UserNote userNote) {
        return userNoteMapper.deleteByPrimaryKey(userNote.getId());
    }

    @Override
    public Datagrid selectSearchKey(String searchKey, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        String mSearchKey = "%" + searchKey + "%";
        List<UserNote> userNotes = userNoteMapper.selectSearchKey(mSearchKey);
        PageInfo pageInfo = new PageInfo(userNotes);
        return new Datagrid(pageInfo.getTotal(),userNotes);
    }
}
