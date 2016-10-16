package com.zyfz.service.impl;

import com.zyfz.dao.RoleMapper;
import com.zyfz.dao.UserMapper;
import com.zyfz.domain.Role;
import com.zyfz.domain.User;
import com.zyfz.service.IRoleService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by ron on 16-10-15.
 */
@Service
public class UserServiceImpl implements IUserservice{

    @Resource
    UserMapper userMapper;

    @Resource
    RoleMapper roleMapper;

    @Resource
    IRoleService roleService;

    @Resource
    PasswordHelper passwordHelper;

    @Override
    public Integer save(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public Integer update(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public void changePassword(int userId, String newPassword) {
         User user = userMapper.selectByPrimaryKey(userId);
         user.setPassword(newPassword);
         passwordHelper.encryptPassword(user);
         userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<User> getAll() {
        return userMapper.selectAll();
    }

    @Override
    public User getOneById(User user) {
        return userMapper.selectByPrimaryKey(user.getId());
    }

    @Override
    public User findByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public User findByPhone(String phone) {
        return userMapper.selectByPhone(phone);
    }

    @Override
    public Integer deleteOneById(User user) {
        return userMapper.deleteByPrimaryKey(user.getId());
    }

    @Override
    public Set<String> findRoles(String username) {

        User user = findByUsername(username);
        if(user == null){
            return Collections.EMPTY_SET;
        }
        Set<String> roles = new HashSet<String>();
        String[] roleIds = user.getRoleIds().split(",");
        for (String roleId : roleIds){
            Role role = roleMapper.selectByPrimaryKey(Integer.valueOf(roleId));
            roles.add(role.getRole());
        }
        return roles;
    }

    @Override
    public Set<String> findPermissions(String username) {

        User user = findByUsername(username);
        String[] roleIds = user.getRoleIds().split(",");
        int mroleids[] = new int[roleIds.length];
        for (int i = 0; i < roleIds.length ; i++) {
            mroleids[i] = Integer.valueOf(roleIds[i]);
        }
        return roleService.findPermissions(mroleids);
    }

    @Override
    public Integer deleteByIds(String ids) {
        String mids[] = ids.split(",");
        int count = 0;
        for(String id : mids){
            int mid = Integer.valueOf(id);
            userMapper.deleteByPrimaryKey(mid);
            count++;
        }
        return count;
    }


}
