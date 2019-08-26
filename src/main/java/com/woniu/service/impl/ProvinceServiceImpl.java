package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.mapper.ProvinceMapper;
import com.woniu.service.IProvinceService;

@Service
public class ProvinceServiceImpl implements IProvinceService {
	
	@Resource
	private ProvinceMapper provinceMapper;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return provinceMapper.selectByExample(null);
	}

	@Override
	public int selectByName(String pname) {
		
		return provinceMapper.selectByName(pname);
	}


}
