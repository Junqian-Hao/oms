package com.nuc.oms.service;

import com.nuc.oms.entity.GoodRelate;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.Page;
import com.nuc.oms.entity.User;

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
    Page<Music> searchMusic(String input,int thispage,int pagenum);

    /**
     * 音乐播放次数+1
     */
    void addTimes(Integer mid);

    /**
     * 查找用户上传的音乐
     * @param user
     * @return
     */
    List<Music> findMusicByUser(User user);

    /**
     * 查找用户点赞的歌曲
     * @param user
     * @return
     */
    List<GoodRelate> findGoodRelateByUser(User user);
}
