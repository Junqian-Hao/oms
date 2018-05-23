package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.UserJpa;
import com.nuc.oms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService {
    @Autowired
    UserJpa userJpa;

    @Override
    public User login(User user) {
        return userJpa.findByUsernameAndPassword(user.getUsername(), user.getPassword());

    }

    @Override
    public User register(User user) {
        user.setUpointer(0);
        user.setUspace(0d);
        User byUsername = userJpa.findByUsername(user.getUsername());
        if (byUsername != null) {
            return null;
        } else {
            return userJpa.save(user);
        }
    }

}
