package com.nuc.oms.timedTask;

import com.nuc.oms.entity.Music;
import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.MusicJPA;
import com.nuc.oms.jpa.UserJPA;
import com.nuc.oms.service.Imp.MusicServiceImp;
import com.nuc.oms.service.Imp.UpvoteServiceImp;
import com.nuc.oms.service.UpvoteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.List;

/**
 * 项目启动时将数据库中数据初始化到redis
 */
@Component
public class RedisCommandLineRunner implements CommandLineRunner {
    private Logger logger = LoggerFactory.getLogger(RedisCommandLineRunner.class);
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Autowired
    MusicJPA musicJPA;
    @Autowired
    UserJPA userJPA;
    @Override
    public void run(String... args) throws Exception {
        logger.info("redis数据库初始化");
        List<Music> allmusic = musicJPA.findAll();
        for (Music music : allmusic) {
            stringRedisTemplate.opsForValue().set(UpvoteServiceImp.generateKey(music.getMid()), String.valueOf(music.getMgood()));
            stringRedisTemplate.opsForValue().set(MusicServiceImp.generateKey(music.getMid()),String.valueOf(music.getMtimes()));
        }
        List<User> alluser =userJPA.findAll();
        for(User user : alluser)
            stringRedisTemplate.opsForValue().set(UpvoteServiceImp.generatePointKey(user.getUid()),String.valueOf(user.getUpointer()));

        //清理文件
        File baseFile = new File("C://omsFile");
        File[] files = baseFile.listFiles();
        for (File file : files) {
            String name = file.getName();
            name = "%" + name + "%";
            Music byMurlLikeOrMpicurlLike = musicJPA.findByMurlLikeOrMpicurlLike(name, name);
            if (byMurlLikeOrMpicurlLike == null) {
                logger.info("删除文件"+name);
                boolean delete = file.delete();
                if (delete) {
                    logger.info("删除成功");
                } else {
                    logger.info("删除失败");
                }
            }
        }
    }
}
