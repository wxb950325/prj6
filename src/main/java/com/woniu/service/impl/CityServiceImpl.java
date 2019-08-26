package com.woniu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.mapper.CityMapper;
import com.woniu.service.ICityService;

@Service
public class CityServiceImpl implements ICityService {

	@Resource
	private CityMapper cityMapper;
	@Override
	public int selectByName(String cname) {
		// TODO Auto-generated method stub
		return cityMapper.selectByName(cname);
	}

}
