package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.entity.Brand;
import com.woniu.mapper.BrandMapper;
import com.woniu.service.IBrandService;
@Service
public class BrandServiceImpl implements IBrandService {
	
	@Resource
	private BrandMapper brandMapper;
	
	@Override
	public void save(Brand brand) {
		brand.setState(0);
		brandMapper.insertSelective(brand);
	}

	@Override
	public void delete(Integer bid) {
		Brand brand=brandMapper.selectByPrimaryKey(bid);
		brand.setState(1);
		brandMapper.updateByPrimaryKeySelective(brand);
	}

	@Override
	public void revoke(Integer bid) {
		Brand brand=brandMapper.selectByPrimaryKey(bid);
		brand.setState(0);
		brandMapper.updateByPrimaryKeySelective(brand);
	}

	@Override
	public void update(Brand brand) {
		brandMapper.updateByPrimaryKeySelective(brand);
	}

	@Override
	public Brand find(Integer bid) {
		return brandMapper.selectByPrimaryKey(bid);
	}

	@Override
	public List<Brand> findAll() {
		return brandMapper.selectByExample(null);
	}

}
