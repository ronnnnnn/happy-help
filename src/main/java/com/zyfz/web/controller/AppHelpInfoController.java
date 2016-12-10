package com.zyfz.web.controller;

import com.zyfz.domain.Category;
import com.zyfz.domain.HelpInfo;
import com.zyfz.model.AppHelpInfoModel;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.IHelpInfoService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ron on 16-11-19.
 */
@Controller
public class AppHelpInfoController extends BaseController{

    @Resource
    IUserservice userservice;

    @Resource
    IHelpInfoService helpInfoService;

    @Resource
    ICategoryService categoryService;

    @RequestMapping(value = "/api/v1/helpInfo",method = RequestMethod.POST)
    public void addHelpInfo(@ModelAttribute  AppHelpInfoModel appHelpInfoModel, HttpServletRequest request, HttpServletResponse response){
        try {

            HelpInfo helpInfo = new HelpInfo();
            /**
             * 处理图片
             */
            List<String> imageUrl = new ArrayList<String>();
            MultipartFile[] multipartFiles = appHelpInfoModel.getImages();
            String mimageUrl = null;
            if (multipartFiles != null){
                for (MultipartFile multipartFile : multipartFiles){
                    String imageUrlName = super.saveUploadFile(request,multipartFile,"helpInfo","jpg");
                    imageUrl.add(imageUrlName);
                }
                mimageUrl = StringUtils.collectionToDelimitedString(imageUrl,",");
            }else {
                mimageUrl = "nono";
            }

            helpInfo.setImageUrl(mimageUrl);
            helpInfo.setHhCategoryId(categoryService.getByCategoryName(appHelpInfoModel.getCategoryName()).getId());
            helpInfo.setHhUserId(userservice.findByUsername(appHelpInfoModel.getUsername()).getId());
            helpInfo.setContext(appHelpInfoModel.getAssistanceContent());
            helpInfo.setProvince(appHelpInfoModel.getProvince());
            helpInfo.setCity(appHelpInfoModel.getProvince());
            helpInfo.setArea(appHelpInfoModel.getArea());
            helpInfo.setDetailPosition(appHelpInfoModel.getContactAddress());
            helpInfo.setPhome(appHelpInfoModel.getContactPhone());
            helpInfo.setNeedUserNumber(Integer.valueOf(appHelpInfoModel.getMaxPersons()));
            helpInfo.setAreaRange(appHelpInfoModel.getPushRange());

            helpInfoService.save(helpInfo);
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","成功返回!");
            super.writeJson(new ResponseMessage<Map<String,String>>(0,"success",map),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","系统内部错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(0,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/anon/helpInfo-list",method = RequestMethod.GET)
    public void getHelpInfoList(@RequestParam(value = "userId",required = false)Integer userId,
                                @RequestParam(value ="pn",required = false)Integer pn,
                                @RequestParam(value ="categoryName",required = false)String categoryName,
                                @RequestParam(value ="isCompeleted",required = false)Boolean isCompeleted,
                                @RequestParam(value ="isDeleted",required = false)Boolean isDeleted,
                                @RequestParam(value ="city",required = false)String city,
                                HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (pn == null || pn == 0){
                pageModel = new PageModel(1,5);
            } else {
                pageModel = new PageModel(pn,5);
            }
            HelpInfo helpInfo = new HelpInfo();
            if (userId != null && userId != 0){
                helpInfo.setHhUserId(userId);
            }
            if (categoryName != null){
                try {
                    helpInfo.setHhCategoryId(categoryService.getByCategoryName(categoryName).getId());
                }catch (Exception e){
                    Map<String,String> map = new HashMap<String, String>();
                    map.put("MSG","无此类别!");
                    super.writeJson(new ResponseMessage<Map<String,String>>(401201,"无此类别!",map),response);
                }
            }
            if (city != null){
                helpInfo.setCity(city);
            }
            if (isCompeleted != null){
                helpInfo.setIsCompeleted(isCompeleted);
            }
            if (isDeleted != null){
                helpInfo.setIsDeleted(isDeleted);
            } else {
                helpInfo.setIsDeleted(false);
            }
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",helpInfoService.selectAllWithParam(pageModel,helpInfo)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","系统内部错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }

    }
}
