package com.woniu.service;

import java.util.List;

import com.woniu.entity.Brand;
import com.woniu.entity.PageBean;

public interface IBrandService {
	
	public void save(Brand brand);
	public void delete(Integer bid);
	public void revoke(Integer bid);
	public void update(Brand brand);
	public void deleteBatch(Integer[] tids);
	public Brand find(Integer bid);
	public List<Brand> findAll(PageBean pageBean);
	
	List findByBrand(String brand);
     
}
