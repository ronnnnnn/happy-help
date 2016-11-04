package com.zyfz.web.controller;

import com.zyfz.domain.Article;
import com.zyfz.model.Json;
import com.zyfz.model.PageModel;
import com.zyfz.service.IArticleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * Created by ron on 16-10-26.
 */
@RequestMapping("/article")
@Controller
public class ArticleController extends BaseController {

    @Resource
    IArticleService articleService;

    @RequiresPermissions("article:view")
    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toAriclePanel(){
        return "admin/article/list";
    }

    @RequiresPermissions("article:update")
    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toAricleEditPanel(){
        return "admin/article/edit";
    }

    @RequiresPermissions("article:view")
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public void getArticleList(PageModel pageModel, HttpServletResponse response){
        super.writeJson(articleService.getAllAritcleWithUser(pageModel),response);
    }

    @RequiresPermissions("article:view")
    @RequestMapping(value = "/search/{articleKey}",method = RequestMethod.POST)
    public void getArticleByLike(@PathVariable String articleKey, PageModel pageModel,HttpServletResponse response){
        super.writeJson(articleService.getArticlByTitleLike(pageModel,articleKey),response);
    }

    @RequiresPermissions("article:create")
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addArticle(Article article){

        try{
            article.setCreateTime(new Date());
            return articleService.save(article);
        }catch(Exception e){
            e.printStackTrace();
            return e.toString();
        }
    }

    @RequiresPermissions("article:update")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateArticle(@RequestBody  Article article){
        try{
            return articleService.update(article);
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }
    }

    @RequiresPermissions("article:delete")
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteByIds(@PathVariable String ids){
        try{
            String mids[] = ids.split(",");
            int count = 0;
            for(String mid : mids){
                Article article = new Article();
                article.setId(Integer.valueOf(mid));
                articleService.deleteOneById(article);
                count++;
            }
            return count;
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }

    }


    @RequiresPermissions("article:update")
    @RequestMapping(value = "/pass/{ids}",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateStatusByIds(@PathVariable String ids){
        try{
            String mids[] = ids.split(",");
            int count = 0;
            for(String mid : mids){
                Article article = new Article();
                article.setId(Integer.valueOf(mid));
                article.setIsPass(true);
                articleService.update(article);
            }
            return count;
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }

    }

    /**
     * 上传图片到服务器
     * @param file
     * @param response
     * @param request
     */
    @RequestMapping(value = "/image",method = RequestMethod.POST)
    public void importImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request){
        Json json = new Json();
        try {
            String imageName = super.saveUploadFile(request,file, "article", "jpg");
            json.setObj(imageName);
            json.setSuccess(true);
            json.setMsg("导入成功！");
        } catch (Exception e) {
            json.setMsg(e.toString());
        }

        super.writeJson(json,response);
    }
}
