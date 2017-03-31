package com.zyfz.jobs;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ron on 17-3-31.
 */
@Component
public class MyJob2 {
    public MyJob2(){
        System.out.println("hello MyJob 2  ***  " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    }

    @Scheduled(cron = "0/1 * *  * * ?")
    public void run(){
        System.out.println("hello MyJob 2 ***  " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
    }
}
