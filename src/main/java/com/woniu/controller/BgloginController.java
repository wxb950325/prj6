package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.woniu.entity.Tree;
import com.woniu.entity.Userinfo;
import com.woniu.service.IBgloginService;
import com.woniu.service.ITreeService;


@Controller
@RequestMapping("/backgroundSite")
public class BgloginController {
    
	@Resource
	private IBgloginService BgloginService;
	@Resource
	private ITreeService treeService;
	
	@RequestMapping("/bglogin")
	
	public String  bglogin(Userinfo userinfo,HttpSession session) throws JsonProcessingException {
		   userinfo = BgloginService.bglogin(userinfo);
		   if(userinfo == null) {
			   return "backgroundSite/bgindex";
		   }else {
			   List trees =  userinfo.getTrees();
			   ObjectMapper mapper = new ObjectMapper();
			   String json = mapper.writeValueAsString(trees);
			   System.out.println(json);
			   session.setAttribute("json", json);
			   session.setAttribute("userinfo", userinfo);
			   return"redirect:/backgroundSite/bgMainMenu.jsp";
		   }
		 
	}
}
