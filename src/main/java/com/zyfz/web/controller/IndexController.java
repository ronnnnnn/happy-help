package com.zyfz.web.controller;

import com.zyfz.domain.Resources;
import com.zyfz.domain.User;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IResourceService;
import com.zyfz.service.IUserservice;
import com.zyfz.web.util.JsonView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.*;

/**
 * Created by ron on 16-9-20.
 */
@Controller
public class IndexController {

    private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(IndexController.class);

    @Resource
    IUserservice userservice;
    @Resource
    IResourceService resourceService;

//    @RequestMapping("/")
//    public String index(HttpServletRequest request, Model model){
//        Serializable cookie = request.getSession().getId();
//        User user = (User)request.getAttribute("user");
//        user.setCookie(cookie + "");
//        userservice.update(user); //登录成功后保存用户的sessionId
//
//        Set<String> perssions = userservice.findPermissions(((User)request.getAttribute("user")).getUsername());
//        List<Resources> menus = resourceService.findMenus(perssions);
//        List<Resources> rootMenus = resourceService.finaRootMenu();
//        Map<String,List<Resources>> menuMap = new LinkedHashMap<String,List<Resources>>();
//        for (int i = 0; i < rootMenus.size(); i++) {
//            Resources rootResource = rootMenus.get(i);
//            List<Resources> childMenus = new ArrayList<Resources>();
//            for (Resources childResource : menus){
//                if(childResource.getParentId() == rootResource.getId().longValue()){
//                    childMenus.add(childResource);
//                }
//            }
//            if (childMenus.size() != 0){
//                menuMap.put(rootResource.getMname(),childMenus);
//            }
//        }
//        model.addAttribute("menus",menuMap);
//        return "admin/index";
//
//    }


    /**
     * 登录成功后进行跳转
     * @param request
     * @return
     */
    @RequestMapping("/")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response){
        Serializable cookie = request.getSession().getId();
        User user = (User)request.getAttribute("user");
        user.setCookie(cookie + "");
        userservice.update(user); //登录成功后保存用户的sessionId

        //管理员跳转到管理界面
        if(user.getIsAdmin() == true){
            Set<String> perssions = userservice.findPermissions(((User)request.getAttribute("user")).getUsername());
            List<Resources> menus = resourceService.findMenus(perssions);
            List<Resources> rootMenus = resourceService.finaRootMenu();
            Map<String,List<Resources>> menuMap = new LinkedHashMap<String,List<Resources>>();
            for (int i = 0; i < rootMenus.size(); i++) {
                Resources rootResource = rootMenus.get(i);
                List<Resources> childMenus = new ArrayList<Resources>();
                for (Resources childResource : menus){
                    if(childResource.getParentId() == rootResource.getId().longValue()){
                        childMenus.add(childResource);
                    }
                }
                if (childMenus.size() != 0){
                    menuMap.put(rootResource.getMname(),childMenus);
                }
            }

            ModelAndView modelAndView = new ModelAndView("admin/index");
            modelAndView.addObject("menus",menuMap);

            return modelAndView;
        }else {  //app普通用户返回json数据
            return JsonView.Render(new ResponseMessage<String>(0,"success",null),response);
        }

    }

}
