package com.zyfz.miPush.thread;

import com.zyfz.domain.Push;
import com.zyfz.model.AppPushModel;

import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Created by ron on 16-12-14.
 * 单例(饿汉)
 */
public class ThreadPoolCore {

    private ThreadPoolExecutor executor;

    private ThreadPoolCore() {
        executor = new ThreadPoolExecutor(3, 10, 200, TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<Runnable>(3));
    }

    private static ThreadPoolCore threadPoolCore = new ThreadPoolCore();

    public static ThreadPoolCore getInstance(){
        return threadPoolCore;
    }

    //private static ThreadPoolExecutor executor;

    public void pushPool(List<Push> pushes, String targetPush, AppPushModel appPushModel){
////        executor = new ThreadPoolExecutor(3, 10, 200, TimeUnit.MILLISECONDS,
////                new ArrayBlockingQueue<Runnable>(3));
//
//        PushTask pushTask = new PushTask(targetPush,appPushModel,pushes);
//        for (int i = 0 ; i < 20 ; i++){
//            MyTask myTask = new MyTask(i);
//            executor.execute(myTask);
//        }
//        System.out.println("线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
//                    executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
//
//
//        executor.shutdown();
//        System.out.print("done===============");

//        for (int i = 0; i < 100; i++) {
            ThreadPoolManager threadPoolManager = ThreadPoolManager.newInstance();
            threadPoolManager.addExecuteTask(new MyTask(1));
            System.out.println("线程池中线程数目：" + threadPoolManager.getPoolSize() + "，队列中等待执行的任务数目："
                    + threadPoolManager.getQueue() + "，已执行玩别的任务数目：" + threadPoolManager.getCompletedTaskCount());
        //}
        //threadPoolManager.shutdown();

    }

}
