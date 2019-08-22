package com.woniu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.entity.Userinfo;
import com.woniu.mapper.UserinfoMapper;
import com.woniu.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Resource
	private UserinfoMapper userinfoMapper;
	
	@Override
	public void registe(Userinfo info) {
		// TODO Auto-generated method stub
		userinfoMapper.insertSelective(info);
	}

}
