package com.nuc.oms.timedTask;

import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.MusicJPA;
import com.nuc.oms.jpa.UserJPA;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

/**
 * 定时将redis数据刷入mysql
 */
@Component
@Transactional
public class RedisTask {
    private Logger logger = LoggerFactory.getLogger(RedisTask.class);
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Autowired
    MusicJPA musicJPA;
    @Autowired
    UserJPA userJPA;



    @Scheduled(fixedDelay = 100000)        //fixedDelay = 1000表示当前方法执行完毕1000ms后，Spring scheduling会再次调用该方法
    public void testFixDelay() {
        logger.info("redis数据刷新计划");
        Set<String> keys = stringRedisTemplate.keys("like:*");
        flushlike(keys);
        keys = stringRedisTemplate.keys("times:*");
        flushtimes(keys);
        keys = stringRedisTemplate.keys("points:*");
        flushpoints(keys);
    }

    public void flushlike(Set<String> keys){
        for (String key : keys) {
            try {
                String s = stringRedisTemplate.opsForValue().get(key);
                String mid = key.replaceAll("like:", "");
                Music music = musicJPA.getOne(Integer.valueOf(mid));
                music.setMgood(Integer.valueOf(s));
                User user = music.getUser();
                user = userJPA.getOne(user.getUid());
                user.setUpointer(user.getUpointer() + 1);
                userJPA.save(user);
                musicJPA.save(music);
            } catch (Exception e) {
                logger.error("redis数据刷入异常", e);
            }
        }
    }
    public void flushtimes(Set<String> keys){
        for (String key : keys) {
            try {
                String s = stringRedisTemplate.opsForValue().get(key);
                String mid = key.replaceAll("times:", "");
                Music music = musicJPA.getOne(Integer.valueOf(mid));
                music.setMtimes(Integer.valueOf(s));
                musicJPA.save(music);
            } catch (Exception e) {
                logger.error("redis数据刷入异常", e);
            }
        }
    }

    public void flushpoints(Set<String> keys){
        for (String key : keys) {
            try {
                String s = stringRedisTemplate.opsForValue().get(key);
                String uid = key.replaceAll("points:", "");
                User user=userJPA.getOne(Integer.valueOf(uid));
                user.setUpointer(Integer.valueOf(s));
                userJPA.save(user);
            } catch (Exception e) {
                logger.error("redis数据刷入异常", e);
            }
        }
    }
}
