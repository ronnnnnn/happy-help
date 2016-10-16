package com.zyfz.service.impl;

import com.zyfz.dao.RoleMapper;
import com.zyfz.domain.Role;
import com.zyfz.domain.User;
import com.zyfz.service.IResourceService;
import com.zyfz.service.IRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by ron on 16-10-15.
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Resource
    RoleMapper roleMapper;

    @Resource
    IResourceService resourceService;

    @Override
    public Integer save(Role role) {
        return roleMapper.insertSelective(role);
    }

    @Override
    public Integer update(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public List<Role> getAll() {
        return roleMapper.selectAll();
    }

    @Override
    public Role getOneById(Role role) {
        return roleMapper.selectByPrimaryKey(role.getId());
    }

    @Override
    public Set<String> findRoles(int... roleIds) {
        Set<String> roles = new HashSet<String>();
        for (int roleId : roleIds){
            Role role = roleMapper.selectByPrimaryKey(roleId);
            if(role != null) {
                roles.add(role.getRole());
            }
        }
        return roles;
    }

    @Override
    public Integer deleteOneById(Role role) {
        return roleMapper.deleteByPrimaryKey(role.getId());
    }

    @Override
    public Set<String> findPermissions(int[] roleIds) {
        Set<Integer> permissionIds = new HashSet<Integer>();
        for(int roleId : roleIds){
            Role role = roleMapper.selectByPrimaryKey(roleId);
            String[] mpermissionIds = role.getResourceIds().split(",");
            for(String mpermissionId:mpermissionIds){
                permissionIds.add(Integer.valueOf(mpermissionId));
            }

        }
        return resourceService.findPermissions(permissionIds);
    }

    @Override
    public List<Role> getAllRoles() {
        return roleMapper.selectAll();
    }
}
