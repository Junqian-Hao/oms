package com.nuc.oms.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table
public class User implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer uid;
    /**
     * 没用
     */
    @Column
    private Integer gid;

    @Column
    private String username;

    @Column
    private String password;

    @Column
    private String nickname;

    /**
     * 积分
     */
    @Column
    private Integer upoInter;
    /**
     * 以用空间
     */
    @Column
    private Double uspace;

    private Integer level;

    private Double totalSpace;


    public Integer getLevel() {
        return level;
    }

    public Double getTotalSpace() {
        return totalSpace;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getUpoInter() {
        return upoInter;
    }

    public void setUpoInter(Integer upoInter) {
        this.upoInter = upoInter;
        if (upoInter < 100) {
            this.level = 1;
            this.totalSpace = 100d;
        } else if (100 <= upoInter && upoInter <= 1000) {
            this.level = 2;
            this.totalSpace = 500d;
        } else {
            this.level = 3;
            this.totalSpace = 1024d;
        }
    }

    public Double getUspace() {
        return uspace;
    }

    public void setUspace(Double uspace) {
        this.uspace = uspace;
    }
}
