package com.zyfz.service.impl;

/**
 * Created by ron on 16-12-15.
 */
public class MyTask implements Runnable{

    private int count;

    public MyTask(int count){
        this.count = count;
    }

    @Override
    public void run() {
        // TODO Auto-generated method stub

        for(int i=0; i<count; i++){
            System.out.println(Thread.currentThread().getName() + " : " + i);
        }
        System.out.println(Thread.currentThread().getName() + " end ");

    }

}
