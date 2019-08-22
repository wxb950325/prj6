package com.example.demo;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.woniu.Prj6Application;
import com.woniu.mapper.UserinfoMapper;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Prj6Application.class)
public class Prj6ApplicationTests {

	@Resource
	private UserinfoMapper userinfoMapper;
	
	@Test
	public void contextLoads() {
		int i = userinfoMapper.countByExample(null);
		System.out.println(i);
	}
	

}
