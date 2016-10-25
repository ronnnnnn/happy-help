package com.zyfz.service;

import com.zyfz.domain.Prize;

import java.util.List;

/**
 * Created by ron on 16-10-23.
 */
public interface IPrizeService extends IBaseService<Prize> {
    public List<Prize> findByKeyLike(String prizeNum);
}
