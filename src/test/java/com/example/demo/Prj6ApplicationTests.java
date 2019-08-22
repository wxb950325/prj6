package com.example.demo;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.bind.annotation.RestController;

import com.woniu.Prj6Application;
import com.woniu.mapper.ProductMapper;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Prj6Application.class)
public class Prj6ApplicationTests {
	
	@Resource
	private ProductMapper pm;
	
	@Test
	public void contextLoads() {
		
	}

	@Test
	public void testxxx() {
		System.out.println(pm.countByExample(null));
	}
}
