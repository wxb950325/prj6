package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.Product;
import com.woniu.service.IProductManagementService;

@Controller
@RequestMapping("/backgroundSite/")
public class ProductManagementController {
	 @Resource
     private IProductManagementService   ProductManagementService;
	 @RequestMapping("findAll")	
	 public String findAll(ModelMap map) {
		 List<Product> list = ProductManagementService.findAll();
		 System.out.println(list.toString());
		 map.put("list", list);
		 Object object = map.get(0);
		 System.out.println(object);
		 return "backgroundSite/List";
	 }
}
