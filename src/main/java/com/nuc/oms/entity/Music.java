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
    private int cid;
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
    @Column
    private int is_deleted;

}
