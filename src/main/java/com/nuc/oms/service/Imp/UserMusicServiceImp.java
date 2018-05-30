package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.MusicJPA;
import com.nuc.oms.jpa.UserJPA;
import com.nuc.oms.service.MusicService;
import com.nuc.oms.service.UserMusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserMusicServiceImp implements UserMusicService {
    RedisTemplate redisTemplate;
    @Autowired
    MusicJPA musicJPA;
    @Autowired
    MusicService musicService;
    @Autowired(required = false)
    public void setRedisTemplate(RedisTemplate redisTemplate) {
        RedisSerializer stringSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(stringSerializer);
        redisTemplate.setValueSerializer(stringSerializer);
        redisTemplate.setHashKeySerializer(stringSerializer);
        redisTemplate.setHashValueSerializer(stringSerializer);

        this.redisTemplate = redisTemplate;
    }

    @Override
    public Music uploadMusic(Music music, User user) {
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
        music=musicJPA.save(music);
        redisTemplate.opsForValue().set("times:"+music.getMid(),music.getMtimes().toString());
        redisTemplate.opsForValue().set("like:"+music.getMid(),music.getMtimes().toString());
        return music;
    }

    @Override
    public Music findbyMid(Integer mid) {
        return musicJPA.getOne(mid);
    }
}
