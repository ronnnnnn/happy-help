package com.zyfz.service;

import com.zyfz.domain.Push;

import java.util.List;

/**
 * Created by ron on 16-12-6.
 */
public interface IPushService extends IBaseService<Push> {
    public Push selectByUserId(Integer hhUserId);

    public List<Push> selectAll();

}
