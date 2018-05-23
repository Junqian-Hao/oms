package com.nuc.oms.jpa;

import com.nuc.oms.entity.Category;
import com.nuc.oms.entity.Music;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MusicJPA extends BaseJPA<Music,Integer>{
    @Query(value = "select * from music order by mgood desc limit 5",nativeQuery = true)
    List<Music> findBymgoodDESC();

    @Query(value = "select * from music order by mtimes desc limit 8",nativeQuery = true)
    List<Music> findBytimesDESC();

    @Query(value = "select * from music limit 5",nativeQuery = true)
    List<Music> findTop5music();

    List<Music> findTop5ByCategoryOrderByMgoodDesc(Category category);

    Music findMusicByMid(int mid);
}
