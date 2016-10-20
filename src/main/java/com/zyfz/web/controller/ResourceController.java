package com.zyfz.web.controller;

import com.zyfz.domain.Resources;
import com.zyfz.service.IResourceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created by ron on 16-10-20.
 */
@RequestMapping("/resources")
@Controller
public class ResourceController {
    @Resource
    IResourceService resourceService;

    @ModelAttribute("types")
    public Resources.ResourceType[] resourceTypes(){
        return Resources.ResourceType.values();
    }

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model){
        model.addAttribute("resourceList",resourceService.findAll());
        return  "admin/resources/list";
    }
    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.GET)
    public String showAppendChildForm(@PathVariable("parentId") Integer parentId, Model model) {
        Resources mr = new Resources();
        mr.setId(parentId);
        Resources parent = resourceService.getOneById(mr);
        model.addAttribute("parent", parent);
        Resources child = new Resources();
        child.setParentId(parentId.longValue());
        child.setParentIds(parent.makeSelfAsParentIds());
        model.addAttribute("resource", child);
        model.addAttribute("op", "新增子节点");
        return "admin/resources/add";
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.POST)
    @ResponseBody
    public Object create(@RequestBody Resources resources) {
        resourceService.save(resources);
        return true;
    }

    @RequiresPermissions("resource:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        Resources resources = new Resources();
        resources.setId(id);
        Resources child =  resourceService.getOneById(resources);
        model.addAttribute("resource",child);
        Resources resources1 = new Resources();
        resources1.setId(child.getParentId().intValue());
        model.addAttribute("parent",resourceService.getOneById(resources1));
        return "admin/resources/edit";
    }

    @RequiresPermissions("resource:update")
    @ResponseBody
    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public Object update(@RequestBody  Resources resource) {
        resourceService.update(resource);
        return true;
    }

    @RequiresPermissions("resource:delete")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object delete(@PathVariable("id") Integer id) {
        Resources resources = new Resources();
        resources.setId(id);
        resourceService.deleteOneById(resources);
        return true;
    }

}
