package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.service.IAdminService;

@Controller
@RequestMapping("/admin/admin")
public class AdminController {
	
	@Resource
	private IAdminService adminServiceImpl;
	
	@RequestMapping("findAll")
	public @ResponseBody List findAll() {
		
		List adminList = adminServiceImpl.findAll();
		
		return adminList;
	}
}
