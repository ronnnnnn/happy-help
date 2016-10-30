package com.zyfz.service;

import com.zyfz.domain.TaskComment;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-10-29.
 */
public interface ITaskCommnetService extends IBaseService<TaskComment> {
    public Datagrid getTaskCommentByTaskId(Integer taskINfoId, PageModel pageModel);
}
