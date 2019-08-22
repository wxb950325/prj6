package com.woniu.service;

import java.util.List;

import com.woniu.entity.Store;

public interface IStoreService {
//	public Store login(Store store);
	public List findAll();
	public void save(Store store,Integer[] chk);
	public void delete(Integer sid);
	public void revoke(Integer sid);
	
	public Store findById(Integer sid);
	public void update(Store store,Integer[] chk);
}
