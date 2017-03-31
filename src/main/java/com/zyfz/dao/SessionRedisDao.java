package com.zyfz.dao;

import com.zyfz.web.util.RedisDbUtil;
import com.zyfz.web.util.SessionConvertUtil;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by ron on 17-3-30.
 */

/**
 * 将session交予redis进行持久化
 */
public class SessionRedisDao extends EnterpriseCacheSessionDAO {

    Logger logger = LoggerFactory.getLogger(SessionRedisDao.class);

    @Autowired
    private RedisDbUtil redisDbUtil;

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = super.doCreate(session);
        //将session保存至redis
        redisDbUtil.setObjectData(sessionId.toString().getBytes(), SessionConvertUtil.sessionToByte(session));
        logger.info("=========redisDao(createSession)===========" + "sessionId:" + session.getId());
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        logger.info("=========redisDao(readSession)===========" + "sessionId:" + sessionId);
        //先从缓存中取得session,取不到再从redis取
        Session session = super.doReadSession(sessionId);
        if (session == null){
            byte[] bytes = redisDbUtil.getObjectData(sessionId.toString().getBytes());
            if (bytes != null) {
                SimpleSession simpleSession = SessionConvertUtil.byteToSession(bytes);
                //恢复过期会话
                simpleSession.setExpired(false);
                simpleSession.setStopTimestamp(null);
                simpleSession.setLastAccessTime(new Date());
                session = simpleSession;
                //更新过期时间
                redisDbUtil.updateObjectData(sessionId.toString().getBytes());
            }
        }
        return session;
    }

    @Override
    protected void doUpdate(Session session) {
        logger.info("=========redisDao(updateSession)===========" + "sessionId:" + session.getId());
        super.doUpdate(session);
        //更新session
        redisDbUtil.setObjectData(session.getId().toString().getBytes(),SessionConvertUtil.sessionToByte(session));
    }

    @Override
    protected void doDelete(Session session) {
        logger.info("=========redisDao(deleteSession)===========" + "sessionId:" + session.getId());
        super.doDelete(session);
       // redisDbUtil.delObjectData(session.getId().toString().getBytes());
    }
}
