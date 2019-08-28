package com.woniu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.entity.UserOrder;
import com.woniu.mapper.UserOrderMapper;
import com.woniu.service.IUserOrderService;

@Service
public class UserOrderServiceImpl implements IUserOrderService {
	@Resource
	private UserOrderMapper userOrderMapper;
	
	@Override
	public void save(UserOrder userOrder) {
		userOrderMapper.insertSelective(userOrder);
	}

}
