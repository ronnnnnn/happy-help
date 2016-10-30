package com.zyfz.service;

import com.zyfz.domain.TaskInfo;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-10-28.
 */
public interface ITaskInfoService extends IBaseService<TaskInfo> {
     public Datagrid getTaskInfoWithUserByCategory(Integer categoryId,Boolean isFree,Boolean isCompeleted , Boolean isTop, PageModel pageModel);
     public Datagrid getTaskInfoWithUserByKey(String taskinfoKey,PageModel pageModel);
}
