package com.zyfz.miPush.util;

import com.xiaomi.xmpush.server.*;

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
     * 根据regid发送一条短信
     *
     * @param title
     * @param content
     * @param regId
     * @param deviceType
     * @throws Exception
     */
    /**
     * 调用小米推送
     */


//    private Result sendMessage(String title, String content, String regId, int deviceType) throws Exception {
//        Constants.useSandbox();
//        Sender sender = null;
//        sender = new Sender(ANDROID_APP_SECRET); //需要根据appSecert来发送
//        Message message = buildMessage(title, content, deviceType);
//        Result result = sender.send(message, regId, 0); //根据regID，发送消息到指定设备上，不重试。
//        return result;
//    }
//
//    /**
//     * TargetedMessage封装了MiPush推送服务系统中的消息Message对象，和该Message对象所要发送到的目标
//     *
//     * @param pushBeans
//     * @param userMobile
//     * @param deviceType
//     * @return
//     * @throws ChaEChaException
//     */

    /**
     * 构建android推送信息
     *
     * @param title
     * @param content
     * @return
     */
    private Message buildMessage2Android(String title, String content) throws Exception {
        Message message = new Message.Builder()
                .title(title)   //通知栏展示的通知的标题
                .description(content).payload(content)  //通知栏展示的通知描述
                .restrictedPackageName(ANDROID_PACKAGE_NAME)//设置包名
                .passThrough(PASS_THROUGH)  //消息使用透传方式
                .notifyType(NOTIFY_TYPE) // 使用默认提示音提示
                .enableFlowControl(true)//控制消息是否需要进行平缓发送
                .build();
        return message;
    }


}