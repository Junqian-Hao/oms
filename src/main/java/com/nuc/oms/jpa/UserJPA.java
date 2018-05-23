package com.nuc.oms.jpa;

import com.nuc.oms.entity.User;

public interface UserJPA extends BaseJPA<User, Integer> {
    User findByUsernameAndPassword(String userName,String password);

    User findByUsername(String userNmae);
}
