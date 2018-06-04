package com.nuc.oms.service.Imp;

import com.nuc.oms.service.UpvoteService;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@FixMethodOrder(MethodSorters.JVM)
public class UpvoteServiceImpTest {
    @Autowired
    UpvoteService upvoteService;


//
//    @Test
//    public void incrementBymid() {
//        int i = 0;
//        long l = System.currentTimeMillis();
//        while (i < 1000) {
//            upvoteService.incrementBymid(1);
//            i++;
//        }
//        long l1 = System.currentTimeMillis();
//        System.out.println(l1 - l);
//
//    }
//
//    @Test
//    public void decrementBymid() {
//        int i = 0;
//        long l = System.currentTimeMillis();
//        while (i < 1000) {
//            upvoteService.decrementBymid(1);
//            i++;
//        }
//        long l1 = System.currentTimeMillis();
//        System.out.println(l1 - l);
//    }
}