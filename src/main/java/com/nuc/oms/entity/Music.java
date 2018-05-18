package com.nuc.oms.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table
public class Music {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int mid;
    @Column
    private int uid;
    @Column
    private String mtitle;
    @Column
    private String msummary;
    @Column
    private String murl;
    @Column
    private int mgood;
    @Column
    private int mtimes;
    @Column
    private Date muploaddate;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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

    public String getMurl() {
        return murl;
    }

    public void setMurl(String murl) {
        this.murl = murl;
    }

    public int getMgood() {
        return mgood;
    }

    public void setMgood(int mgood) {
        this.mgood = mgood;
    }

    public int getMtimes() {
        return mtimes;
    }

    public void setMtimes(int mtimes) {
        this.mtimes = mtimes;
    }

    public Date getMuploaddate() {
        return muploaddate;
    }

    public void setMuploaddate(Date muploaddate) {
        this.muploaddate = muploaddate;
    }
}
