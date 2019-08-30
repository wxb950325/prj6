package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.woniu.entity.Province;
import com.woniu.service.IProvinceService;

@RestController  //RestController该注解可以直接返回json
@RequestMapping("/before/province")
public class ProvinceController {

	@Resource
	private IProvinceService provinceServiceImpl;
	
	@RequestMapping("findAll")
	public List findAll() {
		List<Province> list = provinceServiceImpl.findAll();
		
		return list;
	}
	
}
