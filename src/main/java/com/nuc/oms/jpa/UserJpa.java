package com.nuc.oms.jpa;

import com.nuc.oms.entity.User;

public interface UserJpa extends BaseJPA<User, Integer> {
    User findByUsernameAndPassword(String userName,String password);

    User findByUsername(String userNmae);
}
