package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.entity.Product;
import com.woniu.mapper.ProductMapper;
import com.woniu.service.IProductManagementService;
@Service
public class IProductManagementServiceImpl implements IProductManagementService {
	
   @Resource
   private  ProductMapper   productMapper;
	@Override
	public List<Product> findAll() {
		
		return  productMapper.selectByExample(null);
	}
	@Override
	public void audit(Integer pid) {
		Product product = new Product();
		product.setPid(pid);
		product.setIsaudit(1);
		productMapper.updateByPrimaryKeySelective(product);
	}
	@Override
	public void revoke(Integer pid) {
		Product product = new Product();
		product.setPid(pid);
		product.setIsaudit(0);
		productMapper.updateByPrimaryKeySelective(product);
		
	}
	

}
