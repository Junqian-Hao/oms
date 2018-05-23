package com.nuc.oms.service.Imp;

import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.UserJPA;
import com.nuc.oms.service.UserService;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@FixMethodOrder(MethodSorters.JVM)
public class UserServiceImpTest {
    @Autowired
    UserService userService;
    @Autowired
    UserJPA userJPA;


    @Test
    public void register() {
        User user = new User();
        user.setUsername("test");
        user.setPassword("test");
        user.setNickname("test");
        User register = userService.register(user);
        assertNotNull(register);
        userJPA.delete(register);
    }

    @Test
    public void login() {
        User user = new User();
        user.setUsername("test");
        user.setPassword("test");
        user.setNickname("test");
        user.setUpoInter(0);
        user.setUspace(0d);
        User save = userJPA.save(user);
        User login = userService.login(save);
        assertNotNull(login);
        userJPA.delete(save);
    }


}