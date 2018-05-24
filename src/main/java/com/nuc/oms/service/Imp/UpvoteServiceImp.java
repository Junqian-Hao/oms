package com.nuc.oms.service.Imp;

import com.nuc.oms.service.UpvoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

@Service
public class UpvoteServiceImp implements UpvoteService {
    RedisTemplate redisTemplate;

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
        return true;
    }

    @Override
    public boolean unlike(Integer mid, Integer uid) {
        return false;
    }

    @Override
    public Long incrementBymid(Integer mid) {
        return redisTemplate.opsForValue().increment(generateKey(mid), 1);
    }

    @Override
    public Long decrementBymid(Integer mid) {
        return redisTemplate.opsForValue().increment(generateKey(mid), -1);
    }

    public static String generateKey(Integer mid) {
        return "like:" + mid;
    }
}
