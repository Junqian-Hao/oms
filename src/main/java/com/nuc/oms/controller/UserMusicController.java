package com.nuc.oms.controller;

import com.nuc.oms.MyWebAppConfigurer;
import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.MusicJPA;
import com.nuc.oms.jpa.UserJPA;
import com.nuc.oms.service.UserMusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

@Controller
public class UserMusicController {
    @Autowired
    UserMusicService userMusicService;
    @Autowired
    UserJPA userJPA;
    @Autowired
    MusicJPA musicJPA;

    Logger log = LoggerFactory.getLogger(UserMusicController.class);

    @RequestMapping("/user/uploadMusic")
    public ModelAndView uploadMusic(Music music, @RequestParam("musicfile") MultipartFile musicfile
            , @RequestParam("mpic") MultipartFile mpic, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/firstpageRequest");
        User user = (User) session.getAttribute("user");
        music.setUser(user);
        user = userJPA.getOne(user.getUid());
        Double uspace = user.getUspace();
        Double size = (mpic.getSize() / 1024.0 / 1024)+(musicfile.getSize()/1024.0/1024);
        if ((uspace + size) > user.getTotalSpace()) {
            modelAndView = new ModelAndView("77150");
            modelAndView.addObject("error", "剩余空间不足");
            return modelAndView;
        }
        log.info("文件大小" + size);
        user.setUspace(user.getUspace()+size);

        if (music.getMid() == null) {
            String musicUrl = saveFile(musicfile);
            String mpicurl = saveFile(mpic);
            music.setMurl(musicUrl);
            music.setMpicurl(mpicurl);
            user.setUpointer(user.getUpointer()+50);
        } else {
            Music one = musicJPA.getOne(music.getMid());
            String name = musicfile.getOriginalFilename();
            String name1 = mpic.getOriginalFilename();
            if (name != null && !"".equals(name)) {
                String musicUrl = saveFile(musicfile);
                music.setMurl(musicUrl);
            } else{
                music.setMurl(one.getMurl());
            }
            if (name1 != null && !"".equals(name1)) {

                String mpicurl = saveFile(mpic);
                music.setMpicurl(mpicurl);
            } else {
                music.setMpicurl(one.getMpicurl());
            }
        }
        userJPA.save(user);
        userMusicService.uploadMusic(music,user);
        return modelAndView;

    }

//    @RequestMapping("/music/{mid}")
    public void getMusic(@PathVariable Integer mid, HttpServletResponse httpServletResponse) throws IOException {
        log.info("播放："+mid);
        byte[] buffer = new byte[8192];
        int bytesRead = 0;
        Music music = userMusicService.findbyMid(mid);
        String murl = music.getMurl();
        String s = murl.replaceAll("omsFile/", "");
        File serverfile = new File(MyWebAppConfigurer.picsPath() + s);
        FileInputStream fileInputStream = new FileInputStream(serverfile);
//        httpServletResponse.setHeader("Cache-Control", "no-store");
//        httpServletResponse.setHeader("Pragma", "no-cache");
//        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("audio/mpeg");
        ServletOutputStream responseOutputStream =
                httpServletResponse.getOutputStream();
        while((bytesRead = fileInputStream.read(buffer, 0, 8192)) != -1){
            responseOutputStream.write(buffer, 0, bytesRead);
        }
        responseOutputStream.flush();
        responseOutputStream.close();
    }
    @RequestMapping("/77151/{mid}")
    public ModelAndView updateMusic(@PathVariable Integer mid) throws IOException {
        ModelAndView modelAndView = new ModelAndView("77151");
        Music music = userMusicService.findbyMid(mid);
        modelAndView.addObject("music", music);
        return modelAndView;
    }
    public String saveFile(MultipartFile musicfile) {

        try {
            String filename = musicfile.getOriginalFilename().substring(musicfile.getOriginalFilename().lastIndexOf("."));
            String newfilename = UUID.randomUUID() + filename;
            String replace = newfilename.replace("-", "");

            File serverfile = new File(MyWebAppConfigurer.picsPath() + replace);

            musicfile.transferTo(serverfile);

            return "omsFile" + "/" + replace;

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }
}
