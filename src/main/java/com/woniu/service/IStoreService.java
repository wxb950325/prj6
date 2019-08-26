package com.woniu.service;

import com.woniu.entity.PageBean;
import com.woniu.entity.Store;

import java.util.List;

public interface IStoreService {
//	public Store login(Store store);
	public List findAll(PageBean pagebean);
	public void save(Store store,Integer[] chk);
	public void delete(Integer sid);
	public void revoke(Integer sid);
	
	public Store findById(Integer sid);
	public void update(Store store,Integer[] chk);
}
