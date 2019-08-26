package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.service.IAddressService;

@Controller
@Transactional
@RequestMapping("/before/address")
public class AddressController {
	
	@Resource
	private IAddressService addressServiceImpl;
	
	@RequestMapping("/main/findByUid")
	public @ResponseBody List findByUid(Integer uid) {
		System.out.println(222);
		return addressServiceImpl.findByUid(uid);
	}
	
	@RequestMapping("/main/delete")
	public @ResponseBody int delete(Integer aid) {
		
		return addressServiceImpl.delete(aid);
	}
}
