package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.mapper.CityMapper;
import com.woniu.mapper.ProvinceMapper;
import com.woniu.mapper.ZoneMapper;
import com.woniu.service.IProvinceService;
@Service
public class ProvinceServiceImpl implements IProvinceService {
	//省
	@Resource
	private ProvinceMapper provinceMapper;
	//市
	@Resource
	private CityMapper cityMapper;
	//区
	@Resource
	private ZoneMapper zoneMapper;
	
	
	@Override
	@Transactional(readOnly = true)
	public List findAll() {
		// TODO Auto-generated method stub
		return provinceMapper.selectByExample(null);
	}
	@Override
	@Transactional(readOnly = true)
	public List findAllCity() {
		// TODO Auto-generated method stub
		return cityMapper.selectByExample(null);
	}
	@Override
	@Transactional(readOnly = true)
	public List findAllZone() {
		// TODO Auto-generated method stub
		return zoneMapper.selectByExample(null);
	}

}
