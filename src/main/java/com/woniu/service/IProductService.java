package com.woniu.service;

import java.util.List;

import com.woniu.entity.PageBean;
import com.woniu.entity.Product;

public interface IProductService {
	  
	public void save(Product product);
	public void delete(Integer pid);
	public void revoke(Integer pid);
	public void update(Product product);
	
	public List<Product> findAll2Seller(PageBean pagebean);
	public List<Product> findAll2buyers();
	 
	public List<Product> find();
	
	public Product find(Integer pid);
	List<Product> findAll2beforeByTime();
	List<Product> findAll2beforeByPrice();
	List<Product> find(String pName);
	     
	
	List<Product> findBySid(Integer sid);
}
