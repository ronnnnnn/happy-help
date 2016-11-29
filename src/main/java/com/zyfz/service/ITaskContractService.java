package com.zyfz.service;

import com.sun.org.apache.bcel.internal.generic.PUSH;
import com.zyfz.domain.TaskContract;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-11-28.
 */
public interface ITaskContractService extends IBaseService<TaskContract> {

    public TaskContract getByHhUserIdAndTaskInfoId(TaskContract taskContract);

    public Datagrid getByTaskInfoId(Integer taskInfoId,PageModel pageModel);

}
