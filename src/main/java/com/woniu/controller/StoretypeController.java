package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.Storetype;
import com.woniu.mapper.StoretypeMapper;
import com.woniu.service.impl.StoretypeServiceImpl;

@Controller
@RequestMapping("/before/storeType")
public class StoretypeController {
		
	@Resource
	private StoretypeServiceImpl storetypeServiceImpl;
	
	@RequestMapping("/storeRegiste")
	public String getStoretype(HttpSession session) {
		List<Storetype> storetypes = storetypeServiceImpl.storetypes();
		session.setAttribute("storetypes", storetypes);
		return "before/store/registe";
		
	}
	
	
}
