package com.zyfz.dao;

import com.zyfz.domain.MySession;
import com.zyfz.domain.User;
import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.util.SerializationUtils;

import javax.annotation.Resource;
import java.io.*;
import java.util.Date;

/**
 * Created by ron on 16-11-5.
 */
public class MySimpleSessionDao extends EnterpriseCacheSessionDAO {
    @Resource
    private UserMapper userMapper;
    @Resource
    private MySessionMapper mySessionMapper;

    private Logger log = Logger.getLogger(MySimpleSessionDao.class);

    @Override
    public Serializable create(Session session) {
        Serializable cookie = super.create(session);
        MySession mySession = new MySession();
        SimpleSession simpleSession = (SimpleSession)session;
        log.info(simpleSession.getStartTimestamp());
        try {
            mySession.setSession(objectToBytes(simpleSession));
        } catch (IOException e) {
            e.printStackTrace();
        }
        mySession.setCookie(cookie.toString());
        mySessionMapper.insertSelective(mySession);
        mySession.setCookie(cookie.toString());
        return cookie;
    }

    @Override
    public Session readSession(Serializable sessionId) throws UnknownSessionException {
        Session session = null;
        try{
            session = super.readSession(sessionId);
        }catch (Exception e){

        }

        if (session == null){
            MySession mySession = mySessionMapper.selectByCookie(sessionId.toString());
            if (mySession != null){
                try {
                    session = (SimpleSession)bytesToObject(mySession.getSession());
                    ((SimpleSession)session).setExpired(false);
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                log.info(session.getStartTimestamp());
            }
        }else{
            if(isExpire(session)){
                User user = userMapper.selectByCookie(sessionId.toString());
                if (user != null){
                    ((SimpleSession)session).setLastAccessTime(new Date());
                }
            }
        }

        return session;
    }

    @Override
    public void update(Session session) throws UnknownSessionException{
        super.update(session);
        MySession mySession = mySessionMapper.selectByCookie(session.getId().toString());
        if(mySession  != null){
            SimpleSession simpleSession = (SimpleSession)session;
            try {
                mySession.setSession(objectToBytes(simpleSession));
            } catch (IOException e) {
                e.printStackTrace();
            }
            mySessionMapper.updateByPrimaryKeySelective(mySession);
        }
    }

    @Override
    public void delete(Session session) {
        super.delete(session);
    }

    private boolean isExpire(Session session){
        long timeout = session.getTimeout();
        long lastTime = session.getLastAccessTime().getTime();
        long current = new Date().getTime();
        if((lastTime + timeout) > current){
            return false;
        }
        return true;
    }

    private byte[] objectToBytes(Object object) throws IOException
    {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(object);
        byte[] bytes = baos.toByteArray();
        baos.close();
        oos.close();
        return bytes;
    }

    /**
     * 将字节数组转化为对象
     * @author lichmama
     * @param bytes
     * @return
     * @throws IOException
     * @throws ClassNotFoundException
     */
    @SuppressWarnings("unchecked")
    private <T> T bytesToObject(byte[] bytes) throws IOException, ClassNotFoundException
    {
        ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
        ObjectInputStream ois = new ObjectInputStream(bais);
        Object object = ois.readObject();
        bais.close();
        ois.close();
        return (T) object;
    }

}
