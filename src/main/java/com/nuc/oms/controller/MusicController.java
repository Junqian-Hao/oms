package com.nuc.oms.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.nuc.oms.MyWebAppConfigurer;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.Page;
import com.nuc.oms.entity.User;
import com.nuc.oms.service.MusicService;
import com.nuc.oms.service.UpvoteService;
import com.nuc.oms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
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
    @Autowired
    private UserService userService;

    @RequestMapping("/firstpageRequest")
    public ModelAndView getFirstPage(HttpServletRequest request) {
        User login = (User) request.getSession().getAttribute("user");
        log.info("进入首页");
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("user", login);
        modelAndView.addObject("firstPageMap", musicService.firstpage());
        modelAndView.addObject("rightslideMap", musicService.rightslide());
        return modelAndView;
    }

    @RequestMapping("/singlemusicView")
    public ModelAndView singlemusicPage(HttpServletRequest request) {
        log.info("进入音乐");
        int Mid = Integer.parseInt(request.getParameter("Mid"));
        User user = (User) request.getSession().getAttribute("user");
        ModelAndView modelAndView = new ModelAndView("showmusic");
        modelAndView.addObject("music", musicService.getMusicByMid(Mid));
        modelAndView.addObject("rightslideMap", musicService.rightslide());
        return modelAndView;
    }

    @RequestMapping("/addmusictime")
    @ResponseBody
    public Map<String, String> addtime(@RequestBody String json) {
        Map<String, String> returnMap = new LinkedHashMap<>();
        JSONObject object = JSON.parseObject(json);
        Integer mid = object.getInteger("mid");
        musicService.addTimes(mid);
        returnMap.put("code", "1");
        return returnMap;
    }

    @RequestMapping("/categorymusicView")
    public ModelAndView categorymusicPage(HttpServletRequest request) {
        log.info("进入分类音乐");
        log.info(request.getParameter("cname"));
        String cname = request.getParameter("cname");
        ModelAndView modelAndView = new ModelAndView(cname);
        modelAndView.addObject("categorymusicList", musicService.getMusicByCategory(cname));
        return modelAndView;
    }

    @RequestMapping("/searchMusic")
    @ResponseBody
    public Map<String,Object> searchMusicPage(@RequestBody String json, HttpServletRequest request) {
            Map<String,Object> returnMap=new LinkedHashMap<>();
            JSONObject object=JSON.parseObject(json);
            int thispage=object.getInteger("thispage");
            String input=object.getString("input");
            Page<Music> page=musicService.searchMusic(input,thispage,12);
            if(page!=null){
                returnMap.put("code","1");
                returnMap.put("totalpage",page.getTotalpage());
                returnMap.put("thispage",page.getThispage());
                returnMap.put("pagenum",page.getPagenum());
                returnMap.put("musiclist",page.getObjectList());
                return returnMap;
            }
            else {
                returnMap.put("code","0");
                return returnMap;
            }

    }
    @RequestMapping("/judgePoints")
    @ResponseBody
    public Map<String,String> judgePoints(HttpServletRequest request){
        Map<String,String> returnMap=new LinkedHashMap<>();
        User user=(User)request.getSession().getAttribute("user");
        if(user.getUpointer()>=20){
            userService.decreasePoints(user);
            request.getSession().setAttribute("user",user);
            returnMap.put("code","1");
            return returnMap;
        }
        else {
            returnMap.put("code","0");
            return returnMap;
        }
    }
    @RequestMapping("/downloadMusic")
    public void downLoadMusic(@RequestParam Integer mid,HttpServletRequest request, HttpServletResponse response) throws Exception {
        log.info("下载音乐");
        byte[] buffer = new byte[8192];
        int bytesRead = 0;
        Music music = musicService.getMusicByMid(mid);
        String murl = music.getMurl();
        String s = murl.replaceAll("omsFile/", "");
        File serverfile = new File(MyWebAppConfigurer.picsPath() + s);
        FileInputStream fileInputStream = new FileInputStream(serverfile);
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        //response.setContentType("audio/mpeg");
        String filename = (music.getMtitle() +
                music.getMurl().substring(music.getMurl().lastIndexOf('.')));
        filename = URLEncoder.encode(filename, "UTF-8");
        filename.replace("\\+", "%20");
        System.out.println(filename);
        response.setHeader("Content-Disposition", "attachment;filename=" + filename);
        ServletOutputStream responseOutputStream =
                response.getOutputStream();
        while ((bytesRead = fileInputStream.read(buffer, 0, 8192)) != -1) {
            responseOutputStream.write(buffer, 0, bytesRead);
        }
        responseOutputStream.flush();
        responseOutputStream.close();
    }
}
