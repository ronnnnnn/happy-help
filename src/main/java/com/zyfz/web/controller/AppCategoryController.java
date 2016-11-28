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
import java.util.ArrayList;
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
            List<Category> categories = categoryService.getAllWithList();
            List<Category> categoryList = new ArrayList<Category>();
            for (Category category : categories){
                if (category.getCategoryCode().intern() != "0".intern()){
                    categoryList.add(category);
                }
            }
            super.writeJson(new ResponseMessage<List<Category>>(0,"success",categoryList),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(500301,"请求失败",map),response);
        }
    }

}
