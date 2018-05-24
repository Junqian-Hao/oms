package com.nuc.oms.service;

public interface UpvoteService {

    /**
     * 点赞
     * @param mid 音乐id
     * @param uid 用户id
     * @return 点赞结果
     */
    public boolean like(Integer mid, Integer uid);

    /**
     * 取消点赞
     * @param mid 音乐id
     * @param uid 用户id
     * @return 取消结果
     */
    public boolean unlike(Integer mid, Integer uid);


    /**
     * redis中自增点赞数方法
     * @param mid
     * @return
     */
    Long incrementBymid(Integer mid);

    /**
     * redis中自减点赞数方法
     * @param mid
     * @return
     */
    Long decrementBymid(Integer mid);

    /**
     * redis中积分自增方法
     */
    Long incrementByuid(Integer uid);

    /**
     *redis中积分减少方法
     */
    Long decrementByuid(Integer uid);
}
