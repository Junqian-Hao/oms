package com.nuc.oms.controller;

import com.nuc.oms.entity.User;
import com.nuc.oms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginControlle {
    Logger log = LoggerFactory.getLogger(LoginControlle.class);
    @Autowired
    UserService userService;

    @RequestMapping("/{page}")
    public String nnnnn(@PathVariable String page) {
        log.info("访问" + page);
        return page;
    }

    @RequestMapping("/dologin")
    public ModelAndView login(User user, HttpSession session) {
        log.info("登录");
        ModelAndView modelAndView = new ModelAndView("redirect:/firstpageRequest");
        User login = userService.login(user);
        session.setAttribute("user", login);
        return modelAndView;
    }

    @RequestMapping("/register")
    @ResponseBody
    public Map<String, String> register(User user) {
        log.info("注册");
        Map<String, String> map = new HashMap<>();
        User register = userService.register(user);
        if (register != null) {
            map.put("code", "1");
        } else {
            map.put("code", "0");
        }
        return map;
    }

    @RequestMapping("/exit")
    public ModelAndView exit(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/firstpageRequest");
        session.setAttribute("user", null);
        return modelAndView;
    }
}
