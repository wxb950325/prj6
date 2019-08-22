package com.woniu.service;

import java.util.List;

import com.woniu.entity.Brand;

public interface IBrandService {
	public void save(Brand brand);
	public void delete(Integer bid);
	
	//revoke:撤回操作
	public void revoke(Integer bid);
	public void update(Brand brand);
	
	public Brand find(Integer bid);
	public List<Brand> findAll();
}
