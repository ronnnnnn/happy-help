package com.zyfz.miPush.thread;

import com.zyfz.domain.Push;

import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Created by ron on 16-12-14.
 */
public class ThreadPoolCore {

    public static void pushPool(List<Push> pushes,String targetPush){
        ThreadPoolExecutor executor = new ThreadPoolExecutor(3, 10, 200, TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<Runnable>(3));

        for (Push push : pushes){
            PushTask pushTask = new PushTask(push.getAlias(),targetPush,push.getTopic().split(","));
            executor.execute(pushTask);
            System.out.println("线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
                    executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
        }

        executor.shutdown();
    }

}
