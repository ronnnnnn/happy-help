package com.zyfz.web.controller;

import com.zyfz.domain.Category;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ICategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.support.StringMultipartFileEditor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ron on 16-11-14.
 */
@Controller
public class AppCategoryController extends BaseController {

    @Resource
    ICategoryService categoryService;

    /**
     * 获取分类
     * @param response
     */
    @RequestMapping(value = "/api/v1/anon/category",method = RequestMethod.GET)
    public void getCategory(HttpServletResponse response){
        try {
            super.writeJson(new ResponseMessage<List<Category>>(0,"success",categoryService.getAllWithList()),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(500301,"系统内部错误",map),response);
        }
    }

}
