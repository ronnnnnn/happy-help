package com.zyfz.quartz;

import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by ron on 17-3-31.
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations="file:src/main/resources/spring/spring-config-quartz.xml")
public class QuartzTest {

    public static void main(String[] args){
        ApplicationContext context = new ClassPathXmlApplicationContext("file:src/main/resources/spring/spring-config-quartz.xml");
    }

}
