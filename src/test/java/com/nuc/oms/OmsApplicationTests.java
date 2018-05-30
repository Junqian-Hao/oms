package com.nuc.oms;


import com.nuc.oms.entity.Category;
import com.nuc.oms.jpa.CategoryJPA;
import com.nuc.oms.jpa.MusicJPA;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(properties = "spring.main.web-application-type = reactive")
public class OmsApplicationTests {
	@Autowired
	private CategoryJPA categoryJPA;
	@Autowired
	private MusicJPA musicJPA;
	@Test
	public void contextLoads() {
		System.out.println(musicJPA.findTop5ByCategoryOrderByMgoodDesc(categoryJPA.findByCname("piano")).get(0).getMtitle());
	}

}
