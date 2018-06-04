package com.nuc.oms.jpa;

import com.nuc.oms.entity.Category;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MusicJPA extends BaseJPA<Music,Integer>{
    @Query(value = "select * from music order by mgood desc limit 8",nativeQuery = true)
    List<Music> findBymgoodDESC();

    @Query(value = "select * from music order by mtimes desc limit 5",nativeQuery = true)
    List<Music> findBytimesDESC();

    @Query(value = "select * from music limit 5",nativeQuery = true)
    List<Music> findTop5music();

    List<Music> findTop5ByCategoryOrderByMgoodDesc(Category category);

    List<Music> findTop8ByCategoryOrderByMgoodDesc(Category category);

    Music findMusicByMid(int mid);

    @Query(value = "select * from music where mtitle like CONCAT('%',:inputkey,'%') or mauthor like CONCAT('%',:inputkey,'%')" ,nativeQuery = true)
    List<Music> searchMusic(@Param("inputkey")String input);

    List<Music> findByUser(User user);

    Music findByMurlLikeOrMpicurlLike(String name, String name1);

}
