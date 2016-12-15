package com.zyfz.service.impl;

import com.zyfz.domain.Push;
import com.zyfz.miPush.util.MiPushUtils;
import com.zyfz.model.AppPushModel;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by ron on 16-12-14.
 */
@Scope("prototype")
public class PushTask implements Runnable {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(PushTask.class);

    private String targetPush;
    private String targetAlias;
    private String[] userTopic;
    private AppPushModel appPushModel;
    private List<Push> pushes;
    private String extraValue;

    public PushTask(String targetUser,String targetPush,String[] userTopic) {
        this.targetPush = targetPush;
        this.targetAlias = targetUser;
        this.userTopic = userTopic;
    }

    public PushTask(String targetPush, AppPushModel appPushModel, List<Push> pushes,String extraValue) {
        this.targetPush = targetPush;
        this.appPushModel = appPushModel;
        this.pushes = pushes;
        this.extraValue = extraValue;
    }

    @Override
    public void run() {
        MiPushUtils miPushUtils = new MiPushUtils();
        try {
            miPushUtils.sendMessageToAliasesV2(pushes,targetPush,appPushModel,extraValue);
        } catch (Exception e) {
            e.printStackTrace();
            logger.info(e.toString());
        }
    }
}
