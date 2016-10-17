package com.zyfz.web.controller;

import com.zyfz.domain.Resources;
import com.zyfz.domain.User;
import com.zyfz.service.IResourceService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Set;

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

    @RequestMapping("/")
    public String index(HttpServletRequest request, Model model){
        Set<String> perssions = userservice.findPermissions(((User)request.getAttribute("user")).getUsername());
        List<Resources> menus = resourceService.findMenus(perssions);

        model.addAttribute("menus",menus);
        return "admin/index";
    }
}
