package com.zyfz.miPush.thread;

import com.zyfz.miPush.util.StringArray;

/**
 * Created by ron on 16-12-14.
 */
public class PushTask implements Runnable {

    private String targetPush;
    private String targetAlias;
    private String[] userTopic;

    public PushTask(String targetUser,String targetPush,String[] userTopic) {
        this.targetPush = targetPush;
        this.targetAlias = targetUser;
        this.userTopic = userTopic;
    }

    @Override
    public void run() {
        //紧急求助消息和用户订阅的主题有交集进行推送
        if (StringArray.hasIntersectV2(userTopic,targetPush)){
            System.out.println("消息正在推送给" + targetAlias + "主题为" + targetPush);
        }
    }
}
