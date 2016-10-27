package com.zyfz.web.controller;

import com.zyfz.domain.Article;
import com.zyfz.domain.Comment;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICommentService;
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

    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(){
        return "admin/comment/list";
    }

    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toEditPanel(){
        return "admin/comment/edit";
    }

    @RequestMapping(value = "/list/{articleId}",method = RequestMethod.POST)
    public void getCommentWithUserByArticleId(@PathVariable Integer articleId, PageModel pageModel, HttpServletResponse response){
        super.writeJson(commentService.getCommentWithUserByArticle(articleId,pageModel),response);
    }

    @RequestMapping(value = "/list/{articleId}/{commentKey}",method = RequestMethod.POST)
    public void getCommentWithUserByArticleIdAndKey(@PathVariable Integer articleId,@PathVariable String commentKey, PageModel pageModel, HttpServletResponse response){
        super.writeJson(commentService.getCommentWithUserByArticleAndKey(articleId,commentKey,pageModel),response);
    }

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
