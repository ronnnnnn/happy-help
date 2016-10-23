package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserservice;
import com.zyfz.service.impl.PasswordHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-18.
 */
@RequestMapping("/user")
@Controller
public class UserController extends BaseController{

    @Resource
    IUserservice userservice;

    @Resource
    PasswordHelper passwordHelper;

    /**super前缀的为管理员
     * 相关页面的跳转
     * @return
     */
    @RequestMapping(value = "/superuser/list")
    public String toSuperUserList(){
        return "admin/user/superUserList";
    }

    @RequestMapping(value = "/normaluser/list")
    public String toNormalUserList(){
        return "admin/user/normalUserList";
    }

    @RequestMapping(value = "/password/panel")
    public String toPasswordEditPanel(){
        return "admin/user/superUserPasswordEdit";
    }

    @RequestMapping(value = "/normal/password/panel")
    public String toNormalPasswordEditPanel(){
        return "admin/user/normalUserPasswordEdit";
    }

    @RequestMapping(value = "/superuser/editpanel")
    public String toSuperUserEditPanel(){
        return "admin/user/superUserEditPanel";
    }

    @RequestMapping(value = "/normaluser/editpanel")
    public String toNormalUserEditPanel(){
        return "admin/user/normalUserEditPanel";
    }

    @RequestMapping(value = "/rank/honer")
    public String toHonerRank(){
        return "admin/user/rank/honerUserList";
    }

    @RequestMapping(value = "/honer/panel")
    public String toHonerEditPanel(){
        return "admin/user/rank/superUserHonerEdit";
    }
    @RequestMapping(value = "/contribute/panel")
    public String toContributeEditPanel(){
        return "admin/user/rank/UserContributeEdit";
    }
    @RequestMapping(value = "/rank/contribute")
    public String toHonerContribute(){
        return "admin/user/rank/contributeUserList";
    }

    @RequestMapping(value = "/superuser/all")
    public void getAllSuperUser(PageModel pageModel, HttpServletResponse response){
        super.writeJson(userservice.getAllSuperUser(pageModel),response);
    }

    @RequestMapping(value = "/normaluser/all")
    public void getAllNormalUser(PageModel pageModel, HttpServletResponse response){
        super.writeJson(userservice.getAllNormalUser(pageModel),response);
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @RequestMapping(method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUser(@RequestBody User user){
       return userservice.update(user);
    }

    /**
     * 新增用户，user里面的isAdmin标识是否管理员，默认否
     * @param user
     * @return
     */

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addUser(@RequestBody User user){
        User safeUsername = userservice.findByUsername(user.getUsername());
        User safePhone = userservice.findByPhone(user.getPhone());
        if(safePhone != null && safeUsername != null){
            return false;
        }else {
            passwordHelper.encryptPassword(user);
            Integer sava = userservice.save(user);
            return sava;
        }
    }

    /**
     * 改密码
     * @param user
     * @return
     */
    @RequestMapping(value = "/password",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUserPassword(@RequestBody User user){
        try{
            userservice.changePassword(user.getId(),user.getPassword());
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 批量删除用户
     * @param ids
     * @return
     */
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object removeByUserIds(@PathVariable("ids") String ids){
        return userservice.deleteByIds(ids);
    }

    /**
     * key可以是用户名或是手机号，支持模糊查找
     * @param key
     * @param pageModel
     * @param response
     */
    @RequestMapping(value = "/key")
    public void getUserByKey(String key,PageModel pageModel,HttpServletResponse response){
        super.writeJson(userservice.getUserLike(pageModel,key),response);
    }
    //修改荣誉值

    @RequestMapping(value="/honer",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUserHoner(@RequestBody User user){
        try{
            userservice.changeHoner(user.getId(),user.getHonerScore());
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    //修改贡献值

    @RequestMapping(value="/contribute",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUserContribute(@RequestBody User user){
        try{
            userservice.changeContribute(user.getId(),user.getContributeScore());
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }




}
