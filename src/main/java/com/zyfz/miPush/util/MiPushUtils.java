package com.zyfz.miPush.util;

import com.xiaomi.xmpush.server.*;
import com.zyfz.domain.Push;
import com.zyfz.model.AppPushModel;

import java.util.ArrayList;
import java.util.List;

import static com.zyfz.miPush.config.MiPushConfig.*;

/**
 * http://dev.xiaomi.com/docs/push/push_server/
 * http://dev.xiaomi.com/docs/push/push_quick/
 * 小米推送工具类
 *
 */
public class MiPushUtils {
    /**
     * 根据regid发送一条短信
     *
     * @param title
     * @param content
     * @param regId
     * @param deviceType
     * @throws Exception
     */
    private final static int PASS_THROUGH_MESSAGE = 0;//1表示透传消息
    private final static int NOTIFICATION_MESSAGE = 0;//0表示通知栏消息
    private final static int PASS_THROUGH = NOTIFICATION_MESSAGE;//1表示透传消息，0表示通知栏消息

    private final static int DEFAULT_ALL = -1;
    private final static int DEFAULT_SOUND = 1; // 使用默认提示音提
    private final static int DEFAULT_VIBRATE = 2; // 使用默认震动提示
    private final static int DEFAULT_LIGHTS = 4; // 使用默认led灯光提示
    private final static int NOTIFY_TYPE = DEFAULT_ALL;


    public final static int TYPE_ANDROID = 0;
    public final static int TYPE_IOS = 1;


    /**
     * 构建android推送信息
     *
     * @param title
     * @param content
     * @return
     */
    private Message buildMessage(String title, String content,String messagePayload) throws Exception {
        Message message = new Message.Builder()
                .title(title)   //通知栏展示的通知的标题
                .description(content).payload(content)  //通知栏展示的通知描述
                .payload(messagePayload)
                .restrictedPackageName(ANDROID_PACKAGE_NAME)//设置包名
                .passThrough(PASS_THROUGH)  //消息使用透传方式
                .notifyType(NOTIFY_TYPE) // 使用默认提示音提示
                .enableFlowControl(true)//控制消息是否需要进行平缓发送
                .build();
        return message;
    }

    /**
     * 根据别名推送
     * @param pushes  用户别名表实体
     * @param appPushModel  推送内容
     * @throws Exception
     */

    private void sendMessageToAliases(List<Push> pushes, AppPushModel appPushModel) throws Exception {
        Constants.useOfficial();
        Sender sender = new Sender(ANDROID_APP_SECRET);
        List<String> aliasList = new ArrayList<String>();
        for (Push push : pushes){
            aliasList.add(push.getAlias());  //alias非空白，不能包含逗号，长度小于128。
        }
        Message message = this.buildMessage(appPushModel.getTitle(),appPushModel.getContent(),appPushModel.getMessagePayload());
        sender.sendToAlias(message, aliasList, 0); //根据aliasList，发送消息到指定设备上，不重试。
    }

    private void sendBroadcast(String topic,AppPushModel appPushModel) throws Exception {
        Constants.useOfficial();
        Sender sender = new Sender(ANDROID_APP_SECRET);
        Message message = this.buildMessage(appPushModel.getTitle(),appPushModel.getContent(),appPushModel.getMessagePayload());
        sender.broadcast(message, topic, 0); //根据topic，发送消息到指定一组设备上，不重试。
    }

}