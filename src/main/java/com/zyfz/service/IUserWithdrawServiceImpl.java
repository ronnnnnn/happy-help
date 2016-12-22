package com.zyfz.service;

import com.zyfz.domain.UserWithdraw;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-12-20.
 */
public interface IUserWithdrawServiceImpl extends IBaseService<UserWithdraw> {
   public Datagrid selectBySelective(UserWithdraw userWithdraw, PageModel pageModel);
}
