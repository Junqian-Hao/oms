package com.nuc.oms.controller;

import com.nuc.oms.service.MusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String getFirstPage(HttpServletRequest request){
        log.info("进入首页");
        request.setAttribute("firstPageMap",musicService.firstpage());
        return "/index";
    }



}
