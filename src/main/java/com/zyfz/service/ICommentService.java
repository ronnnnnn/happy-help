package com.zyfz.service;

import com.zyfz.domain.Comment;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-10-27.
 */
public interface ICommentService extends IBaseService<Comment> {
    public Datagrid getCommentWithUserByArticle(Integer articleId,PageModel pageModel);

    public Datagrid getCommentWithUserByArticleAndKey(Integer articleId,String commentKey,PageModel pageModel);
}
