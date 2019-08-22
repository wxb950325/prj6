package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.mapper.ProductMapper;
import com.woniu.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService{
	
	@Resource
	private ProductMapper productMapper;

	@Override
	public List findAll() {
		return productMapper.selectByExample(null);
	}

	@Override
	public int findByCount() {
		return productMapper.countByExample(null);
	}
}
