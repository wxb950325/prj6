package com.woniu.service;

import java.util.List;

import com.woniu.entity.Product;

public interface IProductService {
	  
	public void save(Product product);
	public void delete(Integer pid);
	public void revoke(Integer pid);
	public void update(Product product);
	public List<Product> find();
	
	public Product find(Integer pid);
	     
}
