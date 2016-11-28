package com.zyfz.web.controller;

import com.zyfz.domain.Category;
import com.zyfz.domain.HelpInfo;
import com.zyfz.model.AppHelpInfoModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.IHelpInfoService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
}
