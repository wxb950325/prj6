package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.Userinfo;
import com.woniu.entity.UserinfoExample;
import com.woniu.entity.UserinfoExample.Criteria;
import com.woniu.mapper.UserinfoMapper;
import com.woniu.service.IUserService;
import com.woniu.service.impl.UserServiceImpl;

@Controller
@Transactional
@RequestMapping("/before/userinfo")
public class UserinfoController {

	@Resource
	private IUserService userServiceImpl;
	
	@RequestMapping("registe")
	public String registe(Userinfo info) {
		
		userServiceImpl.registe(info);
		
		return "redirect:/before/comment.jsp";
	}
	
	
}
