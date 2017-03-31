package com.zyfz.web.util;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SimpleSession;

import java.io.*;

/**
 * Created by ron on 17-3-31.
 */
public class SessionConvertUtil {

    public static byte[] sessionToByte(Session session){
        byte[] bytes = null;
        try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()){
            try (ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream)){
                objectOutputStream.writeObject(session);
                bytes = byteArrayOutputStream.toByteArray();
            }catch (IOException E){
                E.printStackTrace();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
        return bytes;
    }

    public static SimpleSession byteToSession(byte[] bytes){
        SimpleSession  simpleSession = null;
        try (ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes)){
            try (ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream)){
                simpleSession = (SimpleSession) objectInputStream.readObject();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (IOException e){
            e.printStackTrace();
        }

        return simpleSession;
    }
}
