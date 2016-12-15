package com.zyfz.miPush.thread;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Created by ron on 16-12-14.
 */
public class SingletonExecutor {

    private static ThreadPoolExecutor executor = new ThreadPoolExecutor(3, 10, 200, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<Runnable>(3));

    public static ThreadPoolExecutor getExecutor(){
        return executor;
    }
}
