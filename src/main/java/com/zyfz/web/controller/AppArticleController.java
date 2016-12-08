package com.zyfz.web.controller;

import com.zyfz.domain.Article;
import com.zyfz.model.AppArticleModel;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by ron on 16-12-2.
 */
@Controller
public class AppArticleController extends BaseController {
    @Resource
    IArticleService articleService;

    /**
     * 请求好人好事文章列表
     * @param page
     * @param response
     */
    @RequestMapping(value = "/api/v1/anon/articles",method = RequestMethod.GET)
    public void getArticles(@RequestParam(value = "page",required = false)Integer page,
                            HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (page == null || page == 0){
                pageModel = new PageModel(1,5);
            }else {
                pageModel = new PageModel(page,5);
            }
            Article article = new Article();
            article.setIsPass(true);
            article.setIsDeleted(false);
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",articleService.getWithUserInApp(pageModel,article)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败",map),response);
        }
    }

    /**
     * 请求我的文章列表
     * @param page
     * @param isPass
     * @param isDelete
     * @param userId
     * @param response
     */
    @RequestMapping(value = "/api/v1/my/articles",method = RequestMethod.GET)
    public void getMyArticles(@RequestParam(value = "page",required = false)Integer page,
                            @RequestParam(value = "isPass",required = false)Boolean isPass,
                            @RequestParam(value = "isDelete",required = false)Boolean isDelete,
                            @RequestParam(value = "userId",required = false)Integer userId,
                            HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (page == null || page == 0){
                pageModel = new PageModel(1,5);
            }else {
                pageModel = new PageModel(page,5);
            }
            Article article = new Article();
            if (isPass != null) {
                article.setIsPass(isPass);
            }
            if (userId != null) {
                article.setHhUserId(userId);
            }
            if (isDelete != null) {
                article.setIsDeleted(isDelete);
            }
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",articleService.getWithUserInApp(pageModel,article)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/new/article",method = RequestMethod.POST)
    public void addArticle(AppArticleModel appArticleModel, HttpServletRequest request,HttpServletResponse response){
        try {
            Article article = new Article();
            if (appArticleModel.getGooddeedsContent()!=null){
                article.setContext(appArticleModel.getGooddeedsContent());
            }
            if (appArticleModel.getGooddeedsTitle()!=null){
                article.setTitle(appArticleModel.getGooddeedsTitle());
            }
            article.setHhUserId(appArticleModel.getUserId());
            article.setCreateTime(new Date());
            //处理图片
            List<String> imageUrl = new ArrayList<String>();
            if (appArticleModel.getImages() != null){
                for (MultipartFile image : appArticleModel.getImages()){
                    imageUrl.add(super.saveUploadFile(request,image,"Article","jpg"));
                }
                article.setImageUrl(StringUtils.collectionToDelimitedString(imageUrl,","));
            } else {
                article.setImageUrl("none");
            }

            articleService.save(article);
            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败",map),response);
        }
    }
}
