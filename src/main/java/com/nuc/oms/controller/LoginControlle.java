package com.nuc.oms.controller;

import com.nuc.oms.entity.User;
import com.nuc.oms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginControlle {
    Logger log = LoggerFactory.getLogger(LoginControlle.class);
    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(User user) {
        log.info("登录");
        ModelAndView modelAndView = new ModelAndView("test");
        User login = userService.login(user);
        modelAndView.addObject("user", login);
        return modelAndView;
    }
}
