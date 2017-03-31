package com.zyfz.web.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import java.util.Set;

/**
 * Created by ron on 17-3-30.
 */
@Component
public class RedisDbUtil {

    @Autowired
    private ShardedJedisPool shardedJedisPool;



    // session 在redis过期时间是30分钟30*60
    private  int expireTime = 60*60*12;
    // 计数器的过期时间默认2天
    private  int countExpireTime = 2*24*3600;

    private  Logger logger = LoggerFactory.getLogger(RedisDbUtil.class);

    //保存字符串数据
    public  void setString(String key,String value){
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
            shardedJedis.set(key,value);
        }
    }

    //获取字符串数据
    public String getString(String key){
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
           return shardedJedis.get(key);
        }
    }

    //删除字符串数据
    public void delString(String key){
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
            shardedJedis.del(key);
        }
    }

    //设置byte类型的数据
    public void setObjectData(byte[] key,byte[] value){
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
            if (!shardedJedis.exists(key)){
                shardedJedis.set(key,value);
            }
            //设置过期时间
            shardedJedis.expire(key,expireTime);
        }
    }

    //更新byte类型的数据的过期时间
    public void updateObjectData(byte[] key){
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
           shardedJedis.expire(key,expireTime);
        }
    }

    //获取byte类型数据
    public byte[] getObjectData(byte[] key){
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
            return shardedJedis.get(key);
        }
    }

    public void delObjectData(byte[] key){
        try(ShardedJedis jedis = shardedJedisPool.getResource()){
            jedis.del(key);
        }
    }

    //获取所有的keys
    public Set<String> getAllKeys(String pattern){
        try (ShardedJedis shardedJedis = shardedJedisPool.getResource()){
            return shardedJedis.hkeys(pattern);
        }
    }

    //key对应的整数加1
    public void inc(String key){
        try (ShardedJedis jedis = shardedJedisPool.getResource()){
            if (jedis != null) {
                if (!jedis.exists(key)) {
                    jedis.set(key, "1");
                } else {
                    jedis.incr(key);
                }
            }
        }
    }

}
