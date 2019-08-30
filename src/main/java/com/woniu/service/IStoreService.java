package com.woniu.service;

import com.woniu.entity.PageBean;
import com.woniu.entity.Store;

import java.util.List;

public interface IStoreService {
//	public Store login(Store store);
	List findAll(PageBean pagebean);
	void save(Store store,Integer[] chk);
	void delete(Integer sid);
	void revoke(Integer sid);
	
	Store findById(Integer sid);
	void update(Store store,Integer[] chk);
	List<Store> findOneByUid(int uid);
}
