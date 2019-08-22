package com.woniu.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.Store;
import com.woniu.service.IStoreService;

@Controller
@RequestMapping("/before/store")
public class StoreController {
		
	@Resource
	private IStoreService StoreServiceImpl;
	
	@RequestMapping("/storeinsert")
	public String insert(Store store) {
		
		StoreServiceImpl.insert(store);
		return "before/store/storelist";
	}
}
