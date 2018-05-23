package com.nuc.oms.controller;

import com.nuc.oms.entity.User;
import com.nuc.oms.jpa.UserJpa;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringRunner.class)
@SpringBootTest
@FixMethodOrder(MethodSorters.JVM)
@WebMvcTest(LoginControlle.class)
public class LoginControlleTest {
    @Autowired
    LoginControlle loginControlle;
    @Autowired
    private WebApplicationContext wac;
    private MockMvc mockMvc;
    @Autowired
    UserJpa userJpa;

//    @Before
//    public void setup() {
//        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
//    }

//    @Test
//    public void login() throws Exception {
//        User user = new User();
//        user.setUsername("test");
//        user.setPassword("test");
//        user.setNickname("test");
//        user.setUpointer(0);
//        user.setUspace(0d);
//        User save = userJpa.save(user);
//        mockMvc.perform(MockMvcRequestBuilders.post("/login")
//                .param("username", "test")
//                .param("password", "test")
//                .accept(MediaType.ALL))
//                .andExpect(MockMvcResultMatchers.view().name("test"));
//        userJpa.delete(save);
//    }

//    @Test
//    public void register() throws Exception {
//        mockMvc.perform(MockMvcRequestBuilders.post("/register")
//                .param("username", "test")
//                .param("password", "test")
//                .param("nickname", "test")
//                .accept(MediaType.APPLICATION_JSON));
//    }
}