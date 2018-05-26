package com.nuc.oms.controller;

import com.nuc.oms.entity.GoodRelate;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import com.nuc.oms.service.MusicService;
import com.nuc.oms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserCntroller {
    Logger log = LoggerFactory.getLogger(UserCntroller.class);
    @Autowired
    UserService userService;
    @Autowired
    MusicService musicService;

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(User user, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/firstpageRequest");
        userService.upadte(user);
        User user1 = (User) session.getAttribute("user");
        if (user1.getUid().intValue() == user.getUid().intValue()) {
            session.setAttribute("user", user);
        }
        return modelAndView;
    }

    @RequestMapping("/userinfo")
    public ModelAndView UserInfor(HttpSession session) {
        log.info("访问个人信息页面");
        ModelAndView modelAndView = new ModelAndView("userinfo");
        User user = (User) session.getAttribute("user");
        User byID = userService.findByID(user.getUid());
        modelAndView.addObject("nickname", byID.getNickname());
        modelAndView.addObject("username", byID.getUsername());
        int level = byID.getLevel();
        if (level == 1) {
            modelAndView.addObject("level", "壹");
        } else if (level == 2) {
            modelAndView.addObject("level", "贰");
        } else if (level == 3) {
            modelAndView.addObject("level", "叁");
        } else {
            modelAndView.addObject("level", "未知");
        }
        modelAndView.addObject("uspace", byID.getUspace().intValue());
        modelAndView.addObject("totalSpace", byID.getTotalSpace().intValue());
        modelAndView.addObject("rlpercent", ((int) (byID.getUspace() / byID.getTotalSpace()*100))+"%");

        List<Music> musicByUser = musicService.findMusicByUser(byID);
        modelAndView.addObject("myMusics", musicByUser);

        List<GoodRelate> goodRelateByUser = musicService.findGoodRelateByUser(byID);
        modelAndView.addObject("mygood", goodRelateByUser);

        return modelAndView;
    }
}
