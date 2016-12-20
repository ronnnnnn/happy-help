package com.zyfz.web.controller;

import com.zyfz.domain.UserNote;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IUserNoteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-12-20.
 */
@Controller
public class AppUserNoteController extends BaseController {

    @Resource
    IUserNoteService userNoteService;

    @RequestMapping(value = "/api/v1/user/note",method = RequestMethod.POST)
    public void savaUserNote(UserNote userNote , HttpServletResponse response){
        try {
            userNote.setCreateTime(new Date());
            userNoteService.save(userNote);
            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String,String>();
            map.put("msg","请求失败");
            super.writeJson(new ResponseMessage< Map<String,String>>(400,"fail",map),response);
        }

    }
}
