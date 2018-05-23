package com.nuc.oms.entity;

import javax.persistence.*;

@Entity
@Table
public class GoodRelate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer grid;

    @OneToOne
    @JoinColumn(name = "uid",referencedColumnName = "uid")
    private User user;
    @OneToOne
    @JoinColumn(name = "mid",referencedColumnName = "mid")
    private Music music;

    public Integer getGrid() {
        return grid;
    }

    public void setGrid(Integer grid) {
        this.grid = grid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Music getMusic() {
        return music;
    }

    public void setMusic(Music music) {
        this.music = music;
    }
}
