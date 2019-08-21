package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.service.IProductService;

@Controller
@RequestMapping("/admin/product/")
public class ProductController {
	@Resource
	private IProductService productService;
	
	@RequestMapping("findAll")
	public String findAll(ModelMap map) {
		List list = productService.findAll();
		map.put("list", list);
		return "/admin/product/list";
	}
}
