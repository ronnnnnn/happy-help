package com.zyfz.web.controller;

import com.zyfz.domain.Comment;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ICommentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-12-8.
 */
@Controller
public class AppCommentController extends BaseController {

    @Resource
    ICommentService commentService;

    @RequestMapping(value = "/api/v1/anon/{type}/comment",method = RequestMethod.GET)
    public void getServerComment(@PathVariable String type,
                                 @RequestParam(value = "serviceId",required = false)Integer serviceId,
                                 @RequestParam(value = "gooddeedsId",required = false)Integer gooddeedsId,
                                 @RequestParam(value = "pn",required = false)Integer pn,
                                 HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (pn == null){
                pageModel = new PageModel(1,5);
            } else {
                pageModel = new PageModel(pn,5);
            }
            if (type.intern() == "server".intern() && serviceId != null) {
                super.writeJson(new ResponseMessage<Datagrid>(0, "success", commentService.getCommentWithUserByTypeId(serviceId, "2", pageModel)), response);
            }else if (type.intern() == "article".intern() && gooddeedsId != null){
                super.writeJson(new ResponseMessage<Datagrid>(0, "success", commentService.getCommentWithUserByTypeId(gooddeedsId, "1", pageModel)), response);
            }
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(501001,"请求失败",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/{type}/new-comment",method = RequestMethod.POST)
    public void addComment(@PathVariable String type,
                           @RequestParam("userId")Integer userId,
                           @RequestParam("targetId")Integer targetId,
                           @RequestParam("content")String content,
                           HttpServletResponse response){
        try {
            if (type == "article"){
                Comment comment = new Comment(content,new Date(),"1",targetId,userId);
                commentService.save(comment);
            } else if (type == "server"){
                Comment comment = new Comment(content,new Date(),"2",targetId,userId);
                commentService.save(comment);
            }
            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(501001,"请求失败",map),response);
        }
    }
}
