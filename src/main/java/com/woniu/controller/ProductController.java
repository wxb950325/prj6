package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.woniu.entity.Product;
import com.woniu.service.IProductService;

@Controller 
@Transactional
@RequestMapping("/admin/product/")
public class ProductController {
	
	@Resource
	private IProductService productService;
	
	@RequestMapping("save")
	public String save(Product product,ModelMap map) {
		productService.save(product);
		System.out.println("ProductController.save()");
		return "redirect:findAll";
	}
	
	@RequestMapping("update")
	public String update(Product product,ModelMap map) {
		productService.update(product);
		return "redirect:findAll";
	}
	
	@RequestMapping("findAll")
	public String findAll(ModelMap map) {//geishanghu
		List<Product> list = productService.find();
		for (Product product : list) {
			System.out.println(product);
		}
		map.put("list", list);
		return "/admin/product/list";
	}
	
	@RequestMapping("findById")
	public String findById(Integer pid,ModelMap map) {
		Product product = productService.find(pid);
		map.put("product", product);
		System.out.println(product);
		return "/admin/product/input";
	}
	
	
	@RequestMapping("delete")
	public String delete(Integer pid) {
		productService.delete(pid);
		return "redirect:findAll";
	}
	
	@RequestMapping("revoke")
	public String revoke(Integer pid) {
		productService.revoke(pid);
		return "redirect:findAll";
	}
	
	@RequestMapping("goInput")
	public String goInput(ModelMap map) {
		List<Product> list = productService.find();
		map.put("list", list);
		return "/admin/product/input";
	}
}