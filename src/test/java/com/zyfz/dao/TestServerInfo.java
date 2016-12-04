package com.zyfz.dao;

import com.github.pagehelper.PageHelper;
import com.zyfz.domain.ServerInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-4.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/resources/spring/spring-mybatis.xml")
public class TestServerInfo {

    Logger log = LoggerFactory.getLogger(getClass());
    @Resource
    ServerInfoMapper  serverInfoMapper;

    @Test
    public void testSelect4App(){
        PageHelper.startPage(1,5);
        ServerInfo serverInfo = new ServerInfo();
        List<ServerInfo> serverInfos = serverInfoMapper.select4App(serverInfo);
        log.info(serverInfos.get(0).getContext());
    }
}
