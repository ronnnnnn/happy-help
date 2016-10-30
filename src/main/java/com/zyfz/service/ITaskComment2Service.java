package com.zyfz.service;

import com.zyfz.domain.TaskComment2;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

import java.util.List;

/**
 * Created by ron on 16-10-29.
 */
public interface ITaskComment2Service extends IBaseService<TaskComment2> {
    public Datagrid getListByCommentId(Integer commentId, PageModel pageModel);
}
