package com.nuc.oms.controller;

import com.nuc.oms.service.MusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 音乐相关控制器
 */

@Controller
public class MusicController {
    Logger log = LoggerFactory.getLogger(MusicController.class);
    @Autowired
    private MusicService musicService;

    @RequestMapping("/firstpageRequest")
    public ModelAndView getFirstPage(){
        log.info("进入首页");
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("firstPageMap",musicService.firstpage());
        modelAndView.addObject("rightslideMap",musicService.rightslide());
        return modelAndView;
    }

    @RequestMapping("/singlemusicView")
    public ModelAndView singlemusicPage(HttpServletRequest request){
        log.info("进入音乐");
        int Mid=Integer.parseInt(request.getParameter("Mid"));
        ModelAndView modelAndView=new ModelAndView("showmusic");
        modelAndView.addObject("music",musicService.getMusicByMid(Mid));
        modelAndView.addObject("rightslideMap",musicService.rightslide());
        return modelAndView;
    }


}
