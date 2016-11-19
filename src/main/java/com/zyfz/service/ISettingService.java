package com.zyfz.service;

import com.zyfz.domain.Setting;

import java.util.List;

/**
 * Created by ron on 16-10-23.
 */
public interface ISettingService extends IBaseService<Setting>{
    public List<Setting> getSettingsBySysType(String sysType);
}
