package com.nuc.oms.service.Imp;

import com.nuc.oms.controller.MusicController;
import com.nuc.oms.entity.Music;
import com.nuc.oms.jpa.CategoryJPA;
import com.nuc.oms.jpa.MusicJpa;
import com.nuc.oms.service.MusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class MusicServiceImp implements MusicService {
    Logger log = LoggerFactory.getLogger(MusicServiceImp.class);
    @Autowired
    private MusicJpa musicJpa;
    @Autowired
    private CategoryJPA categoryJPA;
    @Override
    public Map<String, List<Music>> firstpage() {
        Map<String,List<Music>> firstpagemap=new LinkedHashMap<>();
        List<Music> newMusicList=musicJpa.findTop5music();
        firstpagemap.put("newMusicList",newMusicList);
        List<Music> hotMusicList=musicJpa.findBymgoodDESC();
        firstpagemap.put("hotMusicList",hotMusicList);
        List<Music> timesMusicList=musicJpa.findBytimesDESC();
        firstpagemap.put("timeMusicList",timesMusicList);
        //暂时
        String categorys[]={"piano","guitar","comic","electric"};
        for (String category:categorys){
            List<Music> categoryMusicList=musicJpa.findTop5ByCategoryOrderByMgoodDesc(categoryJPA.findByCname(category));
            firstpagemap.put(category+"MusicList",categoryMusicList);
            log.info(categoryMusicList.toString());
        }
        return firstpagemap;
    }
}
