package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.Music;
import com.nuc.oms.jpa.MusicJPA;
import com.nuc.oms.service.MusicService;
import com.nuc.oms.service.UserMusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserMusicServiceImp implements UserMusicService {
    @Autowired
    MusicJPA musicJPA;
    @Autowired
    MusicService musicService;
    @Override
    public Music uploadMusic(Music music) {
        if (music.getMid() == null || music.getMid().intValue() == 0) {
            music.setIs_deleted(Music.NO_DELETED);
            music.setMuploaddate(new Date());
            music.setMtimes(0);
            music.setMgood(0);
        } else {
            Music one = musicJPA.getOne(music.getMid());
            music.setIs_deleted(one.getIs_deleted());
            music.setMuploaddate(one.getMuploaddate());
            music.setMtimes(one.getMtimes());
            music.setMgood(one.getMgood());
        }
        return musicJPA.save(music);
    }

    @Override
    public Music findbyMid(Integer mid) {
        musicService.addTimes(mid);
        return musicJPA.getOne(mid);
    }
}
