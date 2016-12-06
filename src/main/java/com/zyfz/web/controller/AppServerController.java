package com.zyfz.web.controller;

import com.zyfz.domain.Category;
import com.zyfz.domain.ServerContract;
import com.zyfz.domain.ServerInfo;
import com.zyfz.domain.TaskContract;
import com.zyfz.model.*;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.IServerContractService;
import com.zyfz.service.IServerInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ron on 16-12-3.
 */
@Controller
public class AppServerController extends BaseController {

    @Resource
    IServerInfoService serverInfoService;

    @Resource
    ICategoryService categoryService;

    @Resource
    IServerContractService serverContractService;

    @RequestMapping(value = "/api/v1/server",method = RequestMethod.POST)
    public void addServer(AppServerModel appServerModel, HttpServletResponse response, HttpServletRequest request){
       try {
           ServerInfo serverInfo = new ServerInfo();
           serverInfo.setHhUserId(appServerModel.getUserId());
           serverInfo.setContext(appServerModel.getContent());
           String[] address = appServerModel.getAddress().split(",");//格式：省，市，区
           serverInfo.setProvince(address[0]);
           serverInfo.setCity(address[1]);
           serverInfo.setArea(address[2]);
           if (appServerModel.getDetailAddress() != null){
               serverInfo.setAddress(appServerModel.getDetailAddress());
           }
           serverInfo.setPhone(appServerModel.getContactPhone());
           MultipartFile[] images = appServerModel.getImages();
           List<String> mImages = new ArrayList<String>();
           if ( images != null){
               for (MultipartFile image : images){
                   String mImage = super.saveUploadFile(request,image,"serverInfo","jpg");
                   mImages.add(mImage);
               }
           }
           if (appServerModel.getTitle() != null){
               serverInfo.setTitle(appServerModel.getTitle());
           }
           serverInfo.setImageUrl(StringUtils.collectionToDelimitedString(mImages,","));
           serverInfo.setHhCategoryId(categoryService.getByCategoryName(appServerModel.getCategory()).getId());
           serverInfoService.save(serverInfo);
           Map<String,String> map = new HashMap<String, String>();
           map.put("MSG","添加成功！");
           super.writeJson(new ResponseMessage<Map<String,String>>(0,"success",map),response);
       }catch (Exception e){
           Map<String,String> map = new HashMap<String, String>();
           map.put("errMsg",e.toString());
           super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
       }

    }

    /**
     * 获取我的服务及服务列表
     * @param params
     * @param response
     */
    @RequestMapping(value = "/api/v1/anon/ServerInfo",method = RequestMethod.GET)
    public void getServerInfo(@RequestParam Map<String, Object> params,HttpServletResponse response){
        try {
            Map<String, Object> resultMap = new HashMap<String, Object>();
            resultMap = params;
            ServerInfo serverInfo = new ServerInfo();
            if (Integer.valueOf((String) resultMap.get("userId")) != null || Integer.valueOf((String) resultMap.get("userId")) != 0){
                serverInfo.setHhUserId(Integer.valueOf((String) resultMap.get("userId")));
            }
            if (resultMap.get("isPass") != null){
                serverInfo.setIsPass(Boolean.valueOf((String) resultMap.get("isPass")));
            }
            if (resultMap.get("isDeleted") != null){
                serverInfo.setIsDeleted(Boolean.valueOf((String) resultMap.get("isDeleted")));
            }
            if (resultMap.get("hhCategoryName") != null){
                Integer categoryId = categoryService.getByCategoryName((String)resultMap.get("hhCategoryName")).getId();
                serverInfo.setHhCategoryId(categoryId);
            }
            if (resultMap.get("province") != null){
                serverInfo.setProvince((String) resultMap.get("province"));
            }
            if (resultMap.get("city") != null){
                serverInfo.setCity((String) resultMap.get("city"));
            }
            if (resultMap.get("area") != null){
                serverInfo.setArea((String) resultMap.get("area"));
            }
            PageModel pageModel = null;
            if (Integer.valueOf((String) resultMap.get("pn") )!= null){
                pageModel = new PageModel(Integer.valueOf((String) resultMap.get("pn")),5);
            } else {
                pageModel = new PageModel(1,5);
            }
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",serverInfoService.get4App(serverInfo,pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }

    /**
     * 获取我的服务订单
     */
    @RequestMapping(value = "/api/v1/my-order/serverInfo",method = RequestMethod.GET)
    public void getMyServerInfo(@RequestParam(value = "userId",required = true)Integer userId ,
                                @RequestParam(value = "page",required = false)Integer page,
                                HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (page == null || page == 0){
                pageModel = new PageModel(1,5);
            }else {
                pageModel = new PageModel(page,5);
            }
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",serverInfoService.select4AppInMine(new ServerContract(null,userId),pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }

    /**
     *
     */
    @RequestMapping(value = "/api/v1/custom/serverInfo",method = RequestMethod.POST)
    public void updateContract(AppServerContractModel appServerContractModel,HttpServletResponse response){

        try {
            ServerContract serverContractts = new ServerContract();
            serverContractts.setHhServerInfoId(appServerContractModel.getServiceId());
            serverContractts.setHhUserId(appServerContractModel.getUserId());
            ServerContract mServerContract = serverContractService.getByUserAndServer(serverContractts);
            if (mServerContract == null){
                ServerContract serverContract = new ServerContract();
                serverContract.setStatus(0);
                serverContract.setHhUserId(appServerContractModel.getUserId());
                serverContract.setHhServerInfoId(appServerContractModel.getServiceId());
                serverContractService.save(serverContract);
            } else {
                mServerContract.setStatus(3);
                serverContractService.update(mServerContract);
            }
            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }

    }


}
