package com.zyfz.service.impl;

/**
 * Created by ron on 16-12-15.
 */
import java.util.TimerTask;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

/**
 *
 * 主任务起动
 *
 * @author
 * @version
 */
public class MainExecutor extends TimerTask {

    private ThreadPoolTaskExecutor threadPool;

    @Override
    public void run() {
        // TODO Auto-generated method stub
        System.out.println("MainExecutor is start");
        try{
            Thread.sleep(5000);
        }catch(Exception e){
            e.printStackTrace();
        }
        threadPool.execute(new MyTask(10));
        threadPool.execute(new MyTask(10));
        threadPool.execute(new MyTask(10));

        //等待线程执行完毕
        while(threadPool.getActiveCount() > 0){
            try{
                Thread.sleep(1000);
            }catch(Exception e){
                e.printStackTrace();
            }
        }

        System.out.println("MainExecutor is end");

    }

    public ThreadPoolTaskExecutor getThreadPool() {
        return threadPool;
    }

    public void setThreadPool(ThreadPoolTaskExecutor threadPool) {
        this.threadPool = threadPool;
    }

    public static void main(String[] args) {
        new ClassPathXmlApplicationContext(new String[]{"task.context.xml"});
    }

}
