package com.zyfz.service;

import com.zyfz.domain.Comment;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-10-27.
 */
public interface ICommentService extends IBaseService<Comment> {
    public Datagrid getCommentWithUserByTypeId(Integer articleId,String type,PageModel pageModel);

    public Datagrid getCommentWithUserByTypeIdAndKey(Integer articleId,String type,String commentKey,PageModel pageModel);
}
