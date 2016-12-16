package com.zyfz.service;

import com.zyfz.domain.ServerContract;
import com.zyfz.domain.ServerInfo;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

import java.util.List;

/**
 * Created by ron on 16-11-1.
 */
public interface IServerInfoService extends IBaseService<ServerInfo>{

    public Datagrid getServerInfoByCategoryId(Integer categoryId,PageModel pageModel);

    public Datagrid getServerInfoByKey(String key,PageModel pageModel);

    public Datagrid get4App(ServerInfo serverInfo,PageModel pageModel);

    public Datagrid select4AppInMine(ServerContract serverContract, PageModel pageModel);

    public List<ServerInfo> selectByCategory(Integer cid);

}
