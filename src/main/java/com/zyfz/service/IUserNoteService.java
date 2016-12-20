package com.zyfz.service;

import com.zyfz.domain.UserNote;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-12-20.
 */
public interface IUserNoteService extends IBaseService<UserNote> {
    public Datagrid selectSearchKey(String searchKey, PageModel pageModel);
}
