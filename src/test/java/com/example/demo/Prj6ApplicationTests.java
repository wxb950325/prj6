package com.example.demo;



import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.woniu.Prj6Application;
import com.woniu.mapper.ProductMapper;

import com.woniu.service.IBrandService;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Prj6Application.class)
public class Prj6ApplicationTests {

	@Resource
	private IBrandService bsi;
	
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
