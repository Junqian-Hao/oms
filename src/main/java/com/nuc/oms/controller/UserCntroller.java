package com.nuc.oms.controller;

import com.nuc.oms.entity.User;
import com.nuc.oms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserCntroller {
    @Autowired
    UserService userService;

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(User user, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/firstpageRequest");
        userService.upadte(user);
        User user1 = (User) session.getAttribute("user");
        if (user1.getUid().intValue() == user.getUid().intValue()) {
            session.setAttribute("user",user);
        }
        return modelAndView;
    }
}
