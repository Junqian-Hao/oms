package com.nuc.oms.service;

import com.nuc.oms.entity.User;

public interface UserService {
    /**
     * 用户登录
     * @param user 用户
     * @return 登录结果
     */
    User login(User user);
}
