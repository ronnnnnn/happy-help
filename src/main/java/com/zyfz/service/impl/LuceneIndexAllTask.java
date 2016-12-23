package com.zyfz.service.impl;

import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
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
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(oldDate);
        int oth = calendar.get(Calendar.HOUR);
        int otm = calendar.get(Calendar.MINUTE);
        calendar.setTime(new Date());
        int nth = calendar.get(Calendar.HOUR);
        int ntm = calendar.get(Calendar.MINUTE);

        try {
            if ((ntm - otm) > 2){
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
