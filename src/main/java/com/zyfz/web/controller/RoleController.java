package com.zyfz.web.controller;

import com.zyfz.domain.Role;
import com.zyfz.service.IRoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ron on 16-10-18.
 */
@RequestMapping("/role")
@Controller
public class RoleController extends BaseController {
    @Resource
    IRoleService roleService;

    @RequestMapping(value = "/{value}",method = RequestMethod.GET)
    public void getRoleByIds(@PathVariable String value, HttpServletResponse response){
        String[] ids = value.split(",");
        List<Role> roles = new ArrayList<Role>();
        for(String id : ids){
            int mid = Integer.valueOf(id);
            Role mRole = new Role();
            mRole.setId(mid);
            Role sysRole = roleService.getOneById(mRole);
            roles.add(sysRole);
        }
        super.writeJson(roles,response);
    }

    @RequestMapping(value = "/all/list",method = RequestMethod.GET)
    public void getAllRoles(HttpServletResponse response){
       super.writeJson(roleService.getAllRoles(),response);
    }
}
