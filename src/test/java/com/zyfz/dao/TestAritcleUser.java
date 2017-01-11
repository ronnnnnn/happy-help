package com.zyfz.dao;

import com.zyfz.domain.Article;
import com.zyfz.domain.TaskContract;
import com.zyfz.domain.User;
import com.zyfz.service.ITaskContractService;
import com.zyfz.service.IUserservice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-10-26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/resources/spring/spring-mybatis.xml")
public class TestAritcleUser {
    Logger log = LoggerFactory.getLogger(getClass());

    @Resource
    ArticleMapper articleMapper;

    @Resource
    IUserservice userservice;

    @Resource
    ITaskContractService taskContractService;

    @Test
    public void testGetArticle(){
        List<Article> articles = articleMapper.selectAllWithUser();
        log.info(articles.get(0).toString());
    }

    @Test
    public void testAddMoney(){
        TaskContract taskContract = taskContractService.getOneById(new TaskContract(13));
        User user = userservice.getOneById(new User(42));
        Double finalMoney = user.getAccount() + taskContract.getMoney();
        log.info(finalMoney+"");
    }
}
