package com.nuc.oms.entity;

import java.util.List;

public class Page<E> {
    //页面总数
    private int pagenum;
    //总页数
    private int totalpage;
    //页面
    private int thispage;
    private List<E> objectList=null;

    public Page<E> getPageList(int pagenum, int thispage, List<E> objectList) {
        this.pagenum = pagenum;
        this.thispage = thispage;
        if (objectList.size() % pagenum == 0)
            totalpage = objectList.size() / pagenum;
        else
            totalpage = objectList.size() / pagenum + 1;
        if (thispage > 0 && thispage <= totalpage) {
            if (thispage == totalpage && objectList.size() % pagenum != 0)
                this.objectList = objectList.subList((thispage - 1)*pagenum, (thispage - 1)*pagenum + objectList.size() % pagenum);
            else
                this.objectList = objectList.subList((thispage - 1)*pagenum, thispage*pagenum);
            return this;
        } else {
            return new Page<E>();
        }
    }

    public int getPagenum() {
        return pagenum;
    }

    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }

    public int getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(int totalpage) {
        this.totalpage = totalpage;
    }

    public int getThispage() {
        return thispage;
    }

    public void setThispage(int thispage) {
        this.thispage = thispage;
    }

    public List<E> getObjectList() {
        return objectList;
    }

    public void setObjectList(List<E> objectList) {
        this.objectList = objectList;
    }
}
