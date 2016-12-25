package com.zyfz.service.impl;

import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * Created by ron on 16-12-23.
 */
@Component
public class LuceneIndexAllTask implements Runnable {

    private Date oldDate;

    public LuceneIndexAllTask(){
        //记录第一次实例化时间
        this.oldDate = new Date();
    }

    @Resource
    LuceneHelper luceneHelper;

    @Override
    public void run() {
        try {
            if ((new Date().getTime() - oldDate.getTime()) > 360000){
                System.out.print("开始重新构建索引");
                //删除所有索引
                luceneHelper.deleteAllIndex();
                //重新构建所有索引
                luceneHelper.index();
                System.out.print("构建索引结束");
                oldDate = new Date();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
