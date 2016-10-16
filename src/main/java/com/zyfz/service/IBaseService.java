package com.zyfz.service;

import java.util.List;

/**
 * Created by ron on 16-10-13.
 */
public interface IBaseService<T> {

    public Integer save(T t);

    public Integer update(T t);

    public List<T> getAll();

    public T getOneById(T t);

    public Integer deleteOneById(T t);
    

}
