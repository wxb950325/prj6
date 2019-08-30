package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.woniu.entity.Admin;
import com.woniu.entity.Userinfo;
import com.woniu.service.IAdminService;
import com.woniu.service.ITreeService;

@Controller
public class LoginController {

	@Resource
	private IAdminService adminServiceImpl;
	
	@Resource
	private ITreeService treeService;
	
	@RequestMapping("/login")
	public String login(Admin admin,HttpSession session) throws Exception {
		admin = adminServiceImpl.login(admin);
		if(admin == null) {
			return "index";
			
		}else {
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(admin.getTrees());
			session.setAttribute("admin", admin);
			session.setAttribute("json", json);
			return "redirect:/admin/index.jsp";
			
		}
		
	}
	
}
