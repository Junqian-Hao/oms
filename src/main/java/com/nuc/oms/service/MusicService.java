package com.nuc.oms.service;

import com.nuc.oms.entity.Music;

import java.util.List;
import java.util.Map;

public interface MusicService {
    /**
     * 查询首页数据
     */
    Map<String,List<Music>> firstpage();

    /**
     * 侧边栏
     */
    Map<String,List<Music>> rightslide();

    /**
     * 根据ID查询相关音乐
     */
    Music getMusicByMid(int Mid);

    /**
     * 查询分类相关音乐
     */
    List<Music> getMusicByCategory(String cname);

    /**
     * 搜索音乐
     */
    List<Music> searchMusic(String input);
}
