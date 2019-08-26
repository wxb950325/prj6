package com.woniu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.entity.Userinfo;
import com.woniu.mapper.UserinfoMapper;
import com.woniu.service.IBgloginService;

@Service
public class BgloginServiceImpl implements IBgloginService {
	
	@Resource
	private UserinfoMapper userinfoMapper;

	@Override
	public Userinfo bglogin(Userinfo userinfo) {

		return userinfoMapper.bglogin(userinfo) ;
	}

}
