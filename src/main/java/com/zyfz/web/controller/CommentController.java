package com.zyfz.web.controller;

import com.zyfz.domain.Comment;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICommentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-27.
 */
@RequestMapping("/comment")
@Controller
public class CommentController extends BaseController {

    @Resource
    ICommentService commentService;

    @RequiresPermissions("comment:view")
    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(){
        return "admin/comment/articleComentlist";
    }

    @RequiresPermissions("comment:view")
    @RequestMapping(value = "/server/list-panel",method = RequestMethod.GET)
    public String toserverCommentListPanel(){
        return "admin/comment/serverComentlist";
    }

    @RequiresPermissions("comment:update")
    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toEditPanel(){
        return "admin/comment/edit";
    }

    @RequiresPermissions("comment:view")
    @RequestMapping(value = "/list/{typeId}/{type}",method = RequestMethod.POST)
    public void getCommentWithUserByArticleId(@PathVariable Integer typeId,@PathVariable String type, PageModel pageModel, HttpServletResponse response){
        super.writeJson(commentService.getCommentWithUserByTypeId(typeId,type,pageModel),response);
    }

    @RequiresPermissions("comment:view")
    @RequestMapping(value = "/list/{typeId}/{type}/{commentKey}",method = RequestMethod.POST)
    public void getCommentWithUserByArticleIdAndKey(@PathVariable Integer typeId,@PathVariable String type,@PathVariable String commentKey, PageModel pageModel, HttpServletResponse response){
        super.writeJson(commentService.getCommentWithUserByTypeIdAndKey(typeId,type,commentKey,pageModel),response);
    }

    @RequiresPermissions("comment:delete")
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteByIdS(@PathVariable String ids){
        String mids[] = ids.split(",");
        Integer count = 0;
        for (String mid : mids){
            Comment comment = new Comment();
            comment.setId(Integer.valueOf(mid));
            commentService.deleteOneById(comment);
            count++;
        }
        return count;
    }

    @RequiresPermissions("comment:update")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateArticle(@RequestBody Comment comment){
        try{
            return commentService.update(comment);
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }
    }

}
