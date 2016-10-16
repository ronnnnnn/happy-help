package com.zyfz.service;

import com.zyfz.domain.User;

import java.util.Set;

/**
 * Created by ron on 16-10-15.
 */
public interface IUserservice extends IBaseService<User>{

    public void changePassword(int userId, String newPassword); //修改密码

    public User findByUsername(String username); //根据用户名查找用户

    public User findByPhone(String phone); //根据用户名查找用户

    public Set<String> findRoles(String username);// 根据用户名查找其角色

    public Set<String> findPermissions(String username);// 根据用户名查找其权限

    public Integer deleteByIds(String ids);
}

