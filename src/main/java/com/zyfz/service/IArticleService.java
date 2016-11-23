package com.zyfz.service;

import com.zyfz.domain.Article;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-10-26.
 */
public interface IArticleService extends IBaseService<Article>{

    public Datagrid getAllAritcleWithUser(PageModel pageModel);

    public Datagrid getArticlByContextLike(PageModel model,String title);
}
