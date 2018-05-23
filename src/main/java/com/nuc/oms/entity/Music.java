package com.nuc.oms.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table
public class Music implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer mid;
    /**
     * 用户
     */
    @ManyToOne
    @JoinColumn(name = "uid",referencedColumnName = "uid")
    private User user;
    /**
     * 类别
     */
    @ManyToOne
    @JoinColumn(name = "cid",referencedColumnName = "cid")
    private Category category;
    /**
     * 标题
     */
    @Column
    private String mtitle;
    /**
     * 简介
     */
    @Column
    private String msummary;
    /**
     * 封面图片
     */
    @Column
    private String mpicurl;
    /**
     * 歌曲url
     */
    @Column
    private String murl;
    /**
     * 点赞次数
     */
    @Column
    private Integer mgood;
    /**
     * 播放次数
     */
    @Column
    private Integer mtimes;
    /**
     * 上传时间
     */
    @Column
    private Date muploaddate;
    /**
     * 删除标识
     */
    @Column
    private Integer is_deleted;

    public static final Integer DELETED = 1;
    public static final Integer NO_DELETED = 0;


    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getMtitle() {
        return mtitle;
    }

    public void setMtitle(String mtitle) {
        this.mtitle = mtitle;
    }

    public String getMsummary() {
        return msummary;
    }

    public void setMsummary(String msummary) {
        this.msummary = msummary;
    }

    public String getMpicurl() {
        return mpicurl;
    }

    public void setMpicurl(String mpicurl) {
        this.mpicurl = mpicurl;
    }

    public String getMurl() {
        return murl;
    }

    public void setMurl(String murl) {
        this.murl = murl;
    }

    public Integer getMgood() {
        return mgood;
    }

    public void setMgood(Integer mgood) {
        this.mgood = mgood;
    }

    public Integer getMtimes() {
        return mtimes;
    }

    public void setMtimes(Integer mtimes) {
        this.mtimes = mtimes;
    }

    public Date getMuploaddate() {
        return muploaddate;
    }

    public void setMuploaddate(Date muploaddate) {
        this.muploaddate = muploaddate;
    }

    public Integer getIs_deleted() {
        return is_deleted;
    }

    public void setIs_deleted(Integer is_deleted) {
        this.is_deleted = is_deleted;
    }
}
