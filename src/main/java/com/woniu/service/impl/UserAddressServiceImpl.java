package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.mapper.UserAddressMapper;
import com.woniu.service.IUserAddressService;
@Service
public class UserAddressServiceImpl implements IUserAddressService {
	@Resource
	private UserAddressMapper userAddressMapper;
	
	@Override
	public List findByUid(int uid) {
		return userAddressMapper.findByUid(uid);
	}

}
