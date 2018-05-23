package com.nuc.oms.service;

import com.nuc.oms.entity.Music;

import java.util.List;
import java.util.Map;

public interface MusicService {
    /**
     * 查询首页数据
     */
    Map<String,List<Music>> firstpage();
}
