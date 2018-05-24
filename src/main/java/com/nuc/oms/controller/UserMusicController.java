package com.nuc.oms.controller;

import com.nuc.oms.MyWebAppConfigurer;
import com.nuc.oms.entity.Music;
import com.nuc.oms.service.UserMusicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

@Controller
public class UserMusicController {
    @Autowired
    UserMusicService userMusicService;

    Logger log = LoggerFactory.getLogger(UserMusicController.class);

    @RequestMapping("/user/uploadMusic")
    public ModelAndView uploadMusic(Music music, MultipartFile musicfile, MultipartFile mpic) {
        ModelAndView modelAndView = new ModelAndView("redirect:/firstpageRequest");
        String musicUrl = saveFile(musicfile);
        String mpicurl = saveFile(mpic);
        music.setMurl(musicUrl);
        music.setMpicurl(mpicurl);
        userMusicService.uploadMusic(music);
        return modelAndView;

    }

    @RequestMapping("/music/{mid}")
    public void getMusic(@PathVariable Integer mid, HttpServletResponse httpServletResponse) throws IOException {
        log.info("播放："+mid);
        byte[] buffer = new byte[8192];
        int bytesRead = 0;
        Music music = userMusicService.findbyMid(mid);
        String murl = music.getMurl();
        String s = murl.replaceAll("omsFile/", "");
        File serverfile = new File(MyWebAppConfigurer.picsPath() + s);
        FileInputStream fileInputStream = new FileInputStream(serverfile);
        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("audio/mpeg");
        ServletOutputStream responseOutputStream =
                httpServletResponse.getOutputStream();
        while((bytesRead = fileInputStream.read(buffer, 0, 8192)) != -1){
            responseOutputStream.write(buffer, 0, bytesRead);
        }
        responseOutputStream.flush();
        responseOutputStream.close();
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
