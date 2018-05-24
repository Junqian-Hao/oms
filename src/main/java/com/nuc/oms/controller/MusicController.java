package com.nuc.oms.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import com.nuc.oms.service.MusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 音乐相关控制器
 */

@Controller
@SessionAttributes("user")
public class MusicController {
    Logger log = LoggerFactory.getLogger(MusicController.class);
    @Autowired
    private MusicService musicService;

    @RequestMapping("/firstpageRequest")
    public ModelAndView getFirstPage(HttpServletRequest request){
        User login=(User)request.getSession().getAttribute("user");
        log.info("进入首页");
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("user",login);
        modelAndView.addObject("firstPageMap",musicService.firstpage());
        modelAndView.addObject("rightslideMap",musicService.rightslide());
        return modelAndView;
    }
 
    @RequestMapping("/singlemusicView")
    public ModelAndView singlemusicPage(HttpServletRequest request){
        log.info("进入音乐");
        int Mid=Integer.parseInt(request.getParameter("Mid"));
        User user=(User)request.getSession().getAttribute("user");
        ModelAndView modelAndView=new ModelAndView("showmusic");
        modelAndView.addObject("music",musicService.getMusicByMid(Mid));
        modelAndView.addObject("rightslideMap",musicService.rightslide());
        return modelAndView;
    }

    @RequestMapping("/addmusictime")
    public void addtime(@RequestBody String json){
        Map<String,String> returnMap=new LinkedHashMap<>();
        JSONObject object= JSON.parseObject(json);
        Integer mid=object.getInteger("mid");
        musicService.addTimes(mid);
    }

    @RequestMapping("/categorymusicView")
    public ModelAndView categorymusicPage(HttpServletRequest request){
        log.info("进入分类音乐");
        log.info(request.getParameter("cname"));
        String cname=request.getParameter("cname");
        ModelAndView modelAndView=new ModelAndView(cname);
        modelAndView.addObject("categorymusicList",musicService.getMusicByCategory(cname));
        return modelAndView;
    }

    @RequestMapping("/searchMusic")
    public ModelAndView searchMusicPage(HttpServletRequest request){
        log.info("搜索音乐");
        String input=request.getParameter("input");
        ModelAndView modelAndView=new ModelAndView("search");
        modelAndView.addObject("searchMusicList",musicService.searchMusic(input));
        return modelAndView;
    }
    @RequestMapping("/testSearch")
    @ResponseBody
    public List<Music> testttt(HttpServletRequest request){
        String input=request.getParameter("input");
        return musicService.searchMusic(input);
    }
}
