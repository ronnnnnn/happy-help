package com.zyfz.service;

import com.github.pagehelper.PageInfo;
import com.zyfz.domain.TaskInfo;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

import java.util.List;

/**
 * Created by ron on 16-10-28.
 */
public interface ITaskInfoService extends IBaseService<TaskInfo> {
     public Datagrid getTaskInfoWithUserByCategory(Integer categoryId,Boolean isFree,Boolean isCompeleted , Boolean isTop, PageModel pageModel);

     public Datagrid getTaskInfoWithUserByKey(String taskinfoKey,PageModel pageModel);

     public Datagrid getTaskInfoWithUserByCategoryAndStatus(TaskInfo taskInfo,PageModel pageModel);

     public Datagrid getMTaskInfoWithUser(PageModel pageModel, Integer userId);

     public List<TaskInfo> selectByCategory(Integer cid);
}
