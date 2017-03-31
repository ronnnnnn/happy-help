package com.zyfz.dao;

import com.zyfz.web.util.RedisDbUtil;
import com.zyfz.web.util.SessionConvertUtil;
import org.apache.shiro.session.mgt.SimpleSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.*;

import java.util.Date;

/**
 * Created by ron on 17-3-30.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/resources/spring/spring-mybatis.xml")
public class RedisTest {

    Logger logger = LoggerFactory.getLogger(RedisTest.class);

    @Autowired
    private ShardedJedisPool shardedJedisPool;

    @Autowired
    private RedisDbUtil redisDbUtil;

    private  JedisPool jedisPool;

    @Before
    public  void initPool(){

        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(200);
        config.setMaxIdle(200);
        config.setMaxWaitMillis(5000);
        config.setTestOnBorrow(false);

        jedisPool = new JedisPool(config, "127.0.0.1", 6379, 10000, null);
    }

    @Test
    public void testSet(){
        Jedis jedis = jedisPool.getResource();
        jedis.set("redis-test","test");
    }

    @Test
    public void testGet(){
        Jedis jedis = jedisPool.getResource();
        String result = jedis.get("redis-test");
        System.out.println(result);
    }

    @Test
    public void testSet1(){
        ShardedJedis jedis = shardedJedisPool.getResource();
        jedis.set("redis-test1","test1");
    }

    @Test
    public void testGet1(){
        ShardedJedis jedis = shardedJedisPool.getResource();
        String result = jedis.get("redis-test1");
        System.out.println(result);
    }

    @Test
    public void shardedTest(){
        try (ShardedJedis jedis = shardedJedisPool.getResource()){
            jedis.set("cnblog", "cnblog");
            jedis.set("redis", "redis");
            jedis.set("test", "test");
            jedis.set("123456", "1234567");
            Client client1 = jedis.getShard("cnblog").getClient();
            Client client2 = jedis.getShard("redis").getClient();
            Client client3 = jedis.getShard("test").getClient();
            Client client4 = jedis.getShard("123456").getClient();

            ////打印key在哪个server中
            System.out.println("cnblog in server:" + client1.getHost() + " and port is:" + client1.getPort());
            System.out.println("redis  in server:" + client2.getHost() + " and port is:" + client2.getPort());
            System.out.println("test   in server:" + client3.getHost() + " and port is:" + client3.getPort());
            System.out.println("123456 in server:" + client4.getHost() + " and port is:" + client4.getPort());
        }
    }

    @Test
    public void testUtil(){
        redisDbUtil.setObjectData("296163".toString().getBytes(),"hahah".toString().getBytes());
    }

    @Test
    public void getObjectTest(){
//        SimpleSession simpleSession = SessionConvertUtil.byteToSession(redisDbUtil.getObjectData("81fb382c-6ca3-49e3-ba45-27cf2549dee1".toString().getBytes()));
//        logger.info("=====info====="+simpleSession.getId()+simpleSession.getStopTimestamp()+simpleSession.getLastAccessTime());
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
            long time =shardedJedis.ttl("494bc9bd-c254-4fcb-9a27-2e1fc9c80635".toString().getBytes());
            logger.info("============="+ time + "&&&" + time/3600 +"===============");
        }
    }
}
