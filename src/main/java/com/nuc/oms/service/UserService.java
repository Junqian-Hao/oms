package com.nuc.oms.service;

import com.nuc.oms.entity.User;

public interface UserService {
    /**
     * 用户登录
     * @param user 用户
     * @return 登录结果
     */
    User login(User user);

    /**
     * 用户注册
     * @param user 用户
     * @return 注册成功的用户
     */
    User register(User user);
}
