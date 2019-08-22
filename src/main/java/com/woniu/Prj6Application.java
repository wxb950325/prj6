package com.woniu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.woniu.mapper")
public class Prj6Application {

	public static void main(String[] args) {
		SpringApplication.run(Prj6Application.class, args);
	}

}
