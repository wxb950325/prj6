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
	@Transactional(readOnly = true)
	public List findAll() {
		return productMapper.selectByExample(null);
	}
}
