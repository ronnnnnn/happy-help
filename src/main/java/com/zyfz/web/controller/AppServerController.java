package com.zyfz.web.controller;

import com.zyfz.domain.*;
import com.zyfz.model.*;
import com.zyfz.service.*;
import com.zyfz.service.impl.LuceneHelper;
import com.zyfz.service.impl.LuceneIndexUpdateTask;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.zyfz.global.SystemMessageString.*;

/**
 * Created by ron on 16-12-3.
 */
@Controller
public class AppServerController extends BaseController {

    private static org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(AppServerController.class);

    @Resource
    IServerInfoService serverInfoService;

    @Resource
    ICategoryService categoryService;

    @Resource
    IServerContractService serverContractService;

    @Resource
    IUserservice userservice;

    @Resource
    ISettingService settingService;

    @Resource
    ICommentService commentService;

    @Resource
    ISystemMessageService systemMessageService;

    @Resource
    LuceneHelper luceneHelper;

    @Resource
    ThreadPoolTaskExecutor threadPool;

    /**
     * 添加服务
     * @param appServerModel
     * @param response
     * @param request
     */

    @RequestMapping(value = "/api/v1/server",method = RequestMethod.POST)
    public void addServer(AppServerModel appServerModel, HttpServletResponse response, HttpServletRequest request){
       try {
           ServerInfo serverInfo = new ServerInfo();
           //内容
           serverInfo.setHhUserId(appServerModel.getUserId());
           //用户
           serverInfo.setContext(appServerModel.getContent());
           //处理地址
           String[] address = appServerModel.getAddress().split(",");//格式：省，市，区
           if (address.length == 1){
               serverInfo.setProvince(address[0]);
           }
           if (address.length == 2){
               serverInfo.setProvince(address[0]);
               serverInfo.setCity(address[1]);
           }
           if (address.length == 3){
               serverInfo.setProvince(address[0]);
               serverInfo.setCity(address[1]);
               serverInfo.setArea(address[2]);
           }
           if (appServerModel.getDetailAddress() != null){
               serverInfo.setAddress(appServerModel.getDetailAddress());
           }
           //联系方式
           serverInfo.setPhone(appServerModel.getContactPhone());
           //图片
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
           //处理服务时间段
           String[] times = appServerModel.getTimeRange().split(",");
           SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm");
           Date mStartTime = sim.parse(times[0]);
           Date mEndTime = sim.parse(times[1]);
           serverInfo.setServerTimeStart(mStartTime);
           serverInfo.setServerTimeEnd(mEndTime);
           Integer serverInfoId = serverInfoService.save(serverInfo);
           //添加lucene索引
           serverInfo.setId(serverInfoId);
           LuceneIndexUpdateTask luceneIndexUpdateTask = new LuceneIndexUpdateTask(serverInfo,luceneHelper);
           threadPool.execute(luceneIndexUpdateTask);
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
            if (resultMap.get("userId") != null ){
                if ( Integer.valueOf((String) resultMap.get("userId")) != 0){
                    serverInfo.setHhUserId(Integer.valueOf((String) resultMap.get("userId")));
                }
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
            if (resultMap.get("pn") != null){
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
                                @RequestParam(value = "pn",required = false)Integer page,
                                @RequestParam(value = "status",required = false)Integer status,
                                HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (page == null || page == 0){
                pageModel = new PageModel(1,5);
            }else {
                pageModel = new PageModel(page,5);
            }

            super.writeJson(new ResponseMessage<Datagrid>(0,"success",serverInfoService.select4AppInMine(new ServerContract(status,userId),pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }

    /**
     *用户操作(预约,确认完成)
     */
    @RequestMapping(value = "/api/v1/custom/serverInfo",method = RequestMethod.POST)
    public void updateContract(AppServerContractModel appServerContractModel,HttpServletResponse response){
        User visitorUser = userservice.getOneById(new User(appServerContractModel.getUserId()));
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
                //处理消息,发送服务发布者
                List<String> pageMessage = new ArrayList<String>(); //pageMessage用户打开消息对应页面,格式(服务ID,预约者ID)
                pageMessage.add(String.valueOf(appServerContractModel.getServiceId()));
                pageMessage.add(String.valueOf(appServerContractModel.getUserId()));
                ServerInfo serverInfo = serverInfoService.getOneById(new ServerInfo(appServerContractModel.getServiceId()));
                SystemMessage systemMessage = new SystemMessage("serverinfo",
                        serverInfo.getHhUserId(),
                        new Date(),
                        SERVER_REQUEST_TITLE,
                        "您提供的服务,"+visitorUser.getNickname()+"("+visitorUser.getUsername()+")已预约",
                        StringUtils.collectionToDelimitedString(pageMessage,","));
                systemMessageService.save(systemMessage);
            } else if (mServerContract.getStatus() == 2){

                //确认完成
                mServerContract.setStatus(3);
                serverContractService.update(mServerContract);
                //评星
                ServerInfo serverInfo = serverInfoService.getOneById(new ServerInfo(appServerContractModel.getServiceId()));
                User user = userservice.getOneById(new User(serverInfo.getHhUserId()));
                Double star = 1d;
                try {
                   star = Double.valueOf(settingService.selectBySysTypeAndTypeName(new Setting("公共服务","评星分数")).getTypeValue());
                }catch (Exception e){
                   e.printStackTrace();
                }
                Double contributeScore = user.getContributeScore() + appServerContractModel.getStarCount()*star;
                user.setContributeScore(contributeScore);
                userservice.update(user);
                //评价
                if (appServerContractModel.getContent() != null){
                    String content = appServerContractModel.getContent();
                    Comment comment = new Comment(content,new Date(),"2",appServerContractModel.getServiceId(),appServerContractModel.getUserId());
                    commentService.save(comment);
                }
                //处理消息,发送服务发布者
                List<String> pageMessage = new ArrayList<String>(); //pageMessage用户打开消息对应页面,格式(服务ID,预约者ID)
                pageMessage.add(String.valueOf(appServerContractModel.getServiceId()));
                pageMessage.add(String.valueOf(appServerContractModel.getUserId()));
                SystemMessage systemMessage = new SystemMessage("serverinfo",
                        serverInfo.getHhUserId(),
                        new Date(),
                        SERVER_REQUEST_TITLE,
                        "您提供的服务,"+visitorUser.getNickname()+"("+visitorUser.getUsername()+")已确认完成",
                        StringUtils.collectionToDelimitedString(pageMessage,","));
                systemMessageService.save(systemMessage);
            }


            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }

    }

    /**
     * 发布者操作
     * @param userId 发布者id
     * @param userIdOfBespeak 预约者id
     * @param serviceId
     * @param status
     * @param response
     */
    @RequestMapping(value = "/api/v1/publish/serverContract",method = RequestMethod.POST)
    public void handleServerContract(@RequestParam(value= "userId",required = true)Integer userId,
                                     @RequestParam(value= "userIdOfBespeak",required = true)Integer userIdOfBespeak,
                                     @RequestParam(value= "serviceId",required = true)Integer serviceId,
                                     @RequestParam(value = "status",required = true)Integer  status,
                                     HttpServletResponse response
                                     ){
        try{
            ServerContract serverContractts = new ServerContract();
            serverContractts.setHhServerInfoId(serviceId);
            serverContractts.setHhUserId(userIdOfBespeak);
            ServerContract mServerContract = serverContractService.getByUserAndServer(serverContractts);
            mServerContract.setStatus(status);
            serverContractService.update(mServerContract);

            ServerInfo serverInfo = serverInfoService.getOneById(new ServerInfo(serviceId));
            //处理消息,发送服务预约者 pageMessage serverInfoId
            List<Integer> pageMsg = new ArrayList<Integer>();
            pageMsg.add(serviceId);
            pageMsg.add(userIdOfBespeak);

            String contentMsg = null;
            if (status == 1){
                contentMsg = "您预约的服务("+serverInfo.getContext()+")"+"商家已接单";
            } else if(status == 2){
                contentMsg = "您预约的服务("+serverInfo.getContext()+")"+"商家已完成";
            }

            SystemMessage systemMessage = new SystemMessage("serverinfo",
                    userIdOfBespeak,
                    new Date(),
                    SERVER_CHECK_TITLE,
                    contentMsg,
                   StringUtils.collectionToDelimitedString(pageMsg,","));
            systemMessageService.save(systemMessage);

            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/anon/contract",method = RequestMethod.GET)
    public void getContractUser(@RequestParam(value = "serviceId",required = true) Integer serviceId,
                                @RequestParam(value = "pn",required = false)Integer pn,
                                HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (pn == null || pn == 0){
                pageModel = new PageModel(1,5);
            }else {
                pageModel = new PageModel(pn,5);
            }
            logger.info("===========1========");
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",serverContractService.selectByServerId(serviceId,pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/anon/server/search",method = RequestMethod.GET)
    @ResponseBody
    public void getSearch(@RequestParam("key")String key,HttpServletResponse response){
        try {
            long start = System.currentTimeMillis();
            //luceneHelper.index();
            //List<String> ids = luceneHelper.searchByTerm("context",key,5);
            Set<String> ids = luceneHelper.searchIndexFile(key);
            List<ServerInfo> serverInfos = new ArrayList<ServerInfo>();
            for (String id : ids ){
                serverInfos.add(serverInfoService.getOneById(new ServerInfo(Integer.valueOf(id))));
            }
            Long size = Long.valueOf(serverInfos.size());
            Datagrid datagrid = new Datagrid(size,serverInfos);

            System.out.println(" Spend time:"+(System.currentTimeMillis() - start) + " ms");
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",datagrid),response);
        }  catch (Exception e) {
            e.printStackTrace();
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/anon/server/detail",method=RequestMethod.GET)
    public void getDetailMsg(@RequestParam("messageId")Integer messageId,HttpServletResponse response){
        try {
            SystemMessage systemMessage = systemMessageService.getOneById(new SystemMessage(messageId));
            systemMessage.setIsRead(true);
            systemMessageService.update(systemMessage);
            String[] pageMSG = systemMessage.getPagemessage().split(",");
            super.writeJson(new ResponseMessage<ServerInfo>(0,"success",serverInfoService.selectByUniq(Integer.valueOf(pageMSG[0]))),response);
        }catch (Exception e){
            e.printStackTrace();
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }


    @RequestMapping(value = "/api/v1/server/status",method = RequestMethod.PATCH)
    public void updateServerInfoStatus(@RequestParam("id")Integer id,HttpServletResponse response){
        try {
            ServerInfo serverInfo = serverInfoService.getOneById(new ServerInfo(id));
            if(serverInfo.getIsDeleted()){
                serverInfo.setIsDeleted(false);
            }else {
                serverInfo.setIsDeleted(true);
            }
            serverInfoService.update(serverInfo);
            super.writeJson(new ResponseMessage<String>(0,"success!",""),response);
        }catch (Exception e){
            e.printStackTrace();
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }
    }
}
