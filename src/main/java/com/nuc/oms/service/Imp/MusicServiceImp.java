package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.Page;
import com.nuc.oms.jpa.CategoryJPA;
import com.nuc.oms.jpa.MusicJPA;
import com.nuc.oms.service.MusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class MusicServiceImp implements MusicService {
    Logger log = LoggerFactory.getLogger(MusicServiceImp.class);
    RedisTemplate redisTemplate;
    @Autowired
    private MusicJPA musicJPA;
    @Autowired
    private CategoryJPA categoryJPA;

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
    public Map<String, List<Music>> firstpage() {
        Map<String,List<Music>> firstpagemap=new LinkedHashMap<>();
        List<Music> hotMusicList= musicJPA.findBymgoodDESC();
        firstpagemap.put("hotMusicList",hotMusicList);
        //暂时
        String categorys[]={"piano","guitar","comic","electric"};
        for (int i=0;i<categorys.length;i++){
            List<Music> categoryMusicList= musicJPA.findTop5ByCategoryOrderByMgoodDesc(categoryJPA.findByCname(categorys[i]));
            firstpagemap.put(categorys[i]+"MusicList",categoryMusicList);
            log.info(categoryMusicList.toString());
        }
        return firstpagemap;
    }
    public Map<String,List<Music>> rightslide(){
        Map<String,List<Music>> rightslideMap=new LinkedHashMap<>();
        List<Music> newMusicList= musicJPA.findTop5music();
        rightslideMap.put("newMusicList",newMusicList);
        List<Music> timesMusicList= musicJPA.findBytimesDESC();
        rightslideMap.put("timeMusicList",timesMusicList);
        return rightslideMap;
    }

    @Override
    public List<Music> getMusicByCategory(String cname) {
        return musicJPA.findTop8ByCategoryOrderByMgoodDesc(categoryJPA.findByCname(cname));
    }

    @Override
    public Music getMusicByMid(int Mid) {
        return musicJPA.findMusicByMid(Mid);
    }

    @Override
    public Page<Music> searchMusic(String input, int thispage, int pagenum) {
        return new Page<Music>().getPageList(pagenum,thispage,musicJPA.searchMusic(input));
    }

    @Override
    public void addTimes(Integer mid) {
        redisTemplate.opsForValue().increment(generateKey(mid),1);
    }

    public static String generateKey(Integer mid) {
        return "times:" + mid;
    }

}
