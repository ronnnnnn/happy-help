package com.zyfz.model;

import com.zyfz.domain.TaskContract;
import com.zyfz.domain.TaskInfo;

/**
 * Created by ron on 16-11-30.
 */
public class AppTaskInfoAllModel {
    private TaskInfo taskInfo;
    private TaskContract taskContract;

    public AppTaskInfoAllModel() {
    }

    public AppTaskInfoAllModel(TaskInfo taskInfo, TaskContract taskContract) {
        this.taskInfo = taskInfo;
        this.taskContract = taskContract;
    }

    public TaskInfo getTaskInfo() {
        return taskInfo;
    }

    public void setTaskInfo(TaskInfo taskInfo) {
        this.taskInfo = taskInfo;
    }

    public TaskContract getTaskContract() {
        return taskContract;
    }

    public void setTaskContract(TaskContract taskContract) {
        this.taskContract = taskContract;
    }
}
