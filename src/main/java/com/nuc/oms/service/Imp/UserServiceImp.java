package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.UserJPA;
import com.nuc.oms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService {
    @Autowired
    UserJPA userJPA;

    @Override
    public User login(User user) {
        return userJPA.findByUsernameAndPassword(user.getUsername(), user.getPassword());

    }

    @Override
    public User register(User user) {
        user.setUpointer(0);
        user.setUspace(0d);
        User byUsername = userJPA.findByUsername(user.getUsername());
        if (byUsername != null) {
            return null;
        } else {
            return userJPA.save(user);
        }
    }

    @Override
    public User upadte(User user) {
        if (user == null || user.getUid() == null || user.getUid() == 0) {
            return null;
        }
        return userJPA.save(user);
    }

    @Override
    public void decreasePoints(User user) {
        user.setUpointer(user.getUpointer()-20);
        userJPA.save(user);
    }
}
