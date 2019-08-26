package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Userinfo;
import com.woniu.service.IUserService;

@Controller
@Transactional
@RequestMapping("/before/userinfo")
public class UserinfoController {

	@Resource
	private IUserService userServiceImpl;
	
	@RequestMapping("/main/update")
	public String update(Userinfo info) {
		userServiceImpl.update(info);
		return "/before/userinfo/main/mainInfo";
	}
	
	@RequestMapping("registe")
	public String registe(Userinfo info) {
		boolean flag = userServiceImpl.registe(info);
		if(flag) {
			return "redirect:/before/userinfo/login.jsp";
		}else {
			return "redirect:/before/userinfo/registe.jsp";
		}
	}
	
	@RequestMapping("login")
	public String login(Userinfo info,HttpSession session) {
		boolean flag = userServiceImpl.login(info,session);
		if(flag) {
			//获取用户id插入到商户字段中
			List findByPhone = userServiceImpl.findByPhone(info);
			Userinfo userinfo = (Userinfo) findByPhone.get(0);
			Integer uid = userinfo.getUid();
			session.setAttribute("uid", uid);
			return "redirect:/before/comment.jsp";
		}else {
			return "redirect:/before/userinfo/login.jsp";
		}
	}
	
	@RequestMapping("/main/myinfo")
	public @ResponseBody Userinfo myinfo(HttpSession session,ModelMap map) {
		System.out.println(1111);
		Object loginInfo = session.getAttribute("loginInfo");
		if(loginInfo==null) {
			return null;
		}else {
			Userinfo loginUser = (Userinfo)loginInfo;
			List findByPhone = userServiceImpl.findByPhone(loginUser);
			Userinfo mainInfo = (Userinfo) findByPhone.get(0);
			return mainInfo;
		}
	}
	
	@RequestMapping("/main/findById")
	public String findById(Integer uid,ModelMap map) {
		Userinfo findByIdInfo = userServiceImpl.findById(uid);
		map.put("findByIdInfo", findByIdInfo);
		
		return "/before/userinfo/main/updateBasic";
	}
	
}
