package com.nuc.oms.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table
public class Category implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer cid;
    /**
     * 类别名称
     */
    @Column
    private String cname;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
