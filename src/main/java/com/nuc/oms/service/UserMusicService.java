package com.nuc.oms.service;

import com.nuc.oms.entity.Music;

public interface UserMusicService {
    /**
     * 上传音乐
     * @param music 音乐
     * @return 保存的音乐对象
     */
    Music uploadMusic(Music music);

    /**
     * 通过mid查找音乐,音乐播放次数会自增
     * @param mid
     * @return
     */
    Music findbyMid(Integer mid);
}
