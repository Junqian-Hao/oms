package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.GoodRelate;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.GoodRelateJPA;
import com.nuc.oms.jpa.UserJPA;
import com.nuc.oms.service.UpvoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class UpvoteServiceImp implements UpvoteService {
    RedisTemplate redisTemplate;
    @Autowired
    GoodRelateJPA goodRelateJPA;
    @Autowired
    UserJPA userJPA;

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
    public boolean like(Integer mid, Integer uid) {
        //redis自增记数
        incrementBymid(mid);
        //记录点赞关系
        GoodRelate goodRelate = new GoodRelate();
        User user = new User();
        user.setUid(uid);
        Music music = new Music();
        music.setMid(mid);
        GoodRelate byUserAndMusic = goodRelateJPA.findByUserAndMusic(user, music);
        if (byUserAndMusic != null) {
            return false;
        }
        goodRelate.setMusic(music);
        goodRelate.setUser(user);
        goodRelateJPA.save(goodRelate);
        //积分自增
        /*User one = userJPA.getOne(uid);
        one.setUpointer(one.getUpointer()+1);
        userJPA.save(one);*/
        incrementByuid(uid);
        return true;
    }

    @Override
    public boolean unlike(Integer mid, Integer uid) {
        //点赞数减一
        decrementBymid(mid);
        //删除点赞关系
        User user = new User();
        user.setUid(uid);
        Music music = new Music();
        music.setMid(mid);
        GoodRelate byUserAndMusic = goodRelateJPA.findByUserAndMusic(user, music);
        if (byUserAndMusic == null) {
            return false;
        }
        goodRelateJPA.delete(byUserAndMusic);
        //扣除相应积分
        /*User one = userJPA.getOne(uid);
        one.setUpointer(one.getUpointer()-1);
        userJPA.save(one);*/
        decrementByuid(uid);
        return true;
    }

    @Override
    public Long incrementBymid(Integer mid) {
        return redisTemplate.opsForValue().increment(generateKey(mid), 1);
    }

    @Override
    public Long incrementByuid(Integer uid){
        return redisTemplate.opsForValue().increment(generatePointKey(uid),1);
    }


    @Override
    public Long decrementBymid(Integer mid) {
        return redisTemplate.opsForValue().increment(generateKey(mid), -1);
    }

    @Override
    public Long decrementByuid(Integer uid){
        return redisTemplate.opsForValue().increment(generatePointKey(uid),-1);
    }

    public static String generateKey(Integer mid) {
        return "like:" + mid;
    }

    public static String generatePointKey(Integer uid){
        return "points:"+uid;
    }
}
