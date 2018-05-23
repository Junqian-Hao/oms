package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.Music;
import com.nuc.oms.jpa.CategoryJPA;
import com.nuc.oms.jpa.MusicJPA;
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
    private MusicJPA musicJPA;
    @Autowired
    private CategoryJPA categoryJPA;
    @Override
    public Map<String, List<Music>> firstpage() {
        Map<String,List<Music>> firstpagemap=new LinkedHashMap<>();
        List<Music> newMusicList= musicJPA.findTop5music();
        firstpagemap.put("newMusicList",newMusicList);
        List<Music> hotMusicList= musicJPA.findBymgoodDESC();
        firstpagemap.put("hotMusicList",hotMusicList);
        List<Music> timesMusicList= musicJPA.findBytimesDESC();
        firstpagemap.put("timeMusicList",timesMusicList);
        //暂时
        String categorys[]={"piano","guitar","comic","electric"};
        for (int i=0;i<categorys.length;i++){

            List<Music> categoryMusicList= musicJPA.findTop5ByCategoryOrderByMgoodDesc(categoryJPA.findByCname(categorys[i]));
            firstpagemap.put(categorys[i]+"MusicList",categoryMusicList);
            System.out.println(categorys[i]+"::::::");
            log.info(categoryMusicList.toString());
        }
        return firstpagemap;
    }
}
