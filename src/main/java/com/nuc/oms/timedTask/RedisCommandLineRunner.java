package com.nuc.oms.timedTask;

import com.nuc.oms.entity.Music;
import com.nuc.oms.jpa.MusicJPA;
import com.nuc.oms.service.Imp.UpvoteServiceImp;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 项目启动时将数据库中数据初始化到redis
 */
@Component
public class RedisCommandLineRunner implements CommandLineRunner {
    private Logger logger = LoggerFactory.getLogger(RedisCommandLineRunner.class);
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Autowired
    MusicJPA musicJPA;
    @Override
    public void run(String... args) throws Exception {
        logger.info("redis数据库初始化");
        List<Music> all = musicJPA.findAll();
        for (Music music : all) {
            stringRedisTemplate.opsForValue().set(UpvoteServiceImp.generateKey(music.getMid()), String.valueOf(music.getMgood()));
        }
    }
}
