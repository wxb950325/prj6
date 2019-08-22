package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.Product;
import com.woniu.mapper.ProductMapper;
import com.woniu.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService {
	
	@Resource
	private ProductMapper productMapper;
	
	@Override
	@Transactional
	public void save(Product product) {
		// 插入Product
		product.setIsdelete(0);
		productMapper.insertSelective(product);
	}

	@Override
	public void delete(Integer pid) {
		// TODO Auto-generated method stub
		Product product = new Product();
		product.setPid(pid);
		product.setIsdelete(0);
		productMapper.updateByPrimaryKeySelective(product);
	}

	@Override
	public void revoke(Integer pid) {
		// TODO Auto-generated method stub
		Product product = new Product();
		product.setPid(pid);
		product.setIsdelete(1);
		productMapper.updateByPrimaryKeySelective(product);
	}

	@Override
	public void update(Product product) {
		// TODO Auto-generated method stub
		productMapper.updateByPrimaryKeySelective(product);
	}

	@Override
	public List<Product> find() {
		// TODO Auto-generated method stub
		return productMapper.selectByExample(null);
	}

	@Override
	public Product find(Integer pid) {
		// TODO Auto-generated method stub
		return productMapper.selectByPrimaryKey(pid);
	}


}
