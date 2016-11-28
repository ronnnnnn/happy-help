package com.zyfz.service;

import com.zyfz.domain.TaskContract;

/**
 * Created by ron on 16-11-28.
 */
public interface ITaskContractService extends IBaseService<TaskContract> {

    public TaskContract getByHhUserIdAndTaskInfoId(TaskContract taskContract);
}
