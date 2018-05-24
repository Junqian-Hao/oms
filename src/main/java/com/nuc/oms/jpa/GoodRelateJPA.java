package com.nuc.oms.jpa;

import com.nuc.oms.entity.GoodRelate;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;

public interface GoodRelateJPA extends BaseJPA<GoodRelate, Integer> {
    GoodRelate findByUserAndMusic(User user, Music music);
}
