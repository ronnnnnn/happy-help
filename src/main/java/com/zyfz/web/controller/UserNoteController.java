package com.zyfz.web.controller;

import com.zyfz.domain.UserNote;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserNoteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-12-20.
 */

@Controller
public class UserNoteController extends BaseController {

    @Resource
    IUserNoteService userNoteService;

    @RequestMapping(value = "/user/note/list",method = RequestMethod.GET)
    public String getListPanel(){
        return "admin/note/list";
    }

    @RequestMapping(value = "/note/date",method = RequestMethod.POST)
    public void getDate(PageModel pageModel, HttpServletResponse response){
        super.writeJson(userNoteService.getAll(pageModel),response);
    }

    @ResponseBody
    @RequestMapping(value = "/note/{ids}",method = RequestMethod.DELETE)
    public Object deleteByIds(@PathVariable String ids){
        String[] mids = ids.split(",");
        for (String mid : mids){
            userNoteService.deleteOneById(new UserNote(Integer.valueOf(mid)));
        }
        return true;
    }

    @RequestMapping(value = "/note/search/{searchKey}",method = RequestMethod.POST)
    public void getSearchDate(@PathVariable String searchKey,PageModel pageModel,HttpServletResponse response){
        super.writeJson(userNoteService.selectSearchKey(searchKey,pageModel),response);
    }
}
