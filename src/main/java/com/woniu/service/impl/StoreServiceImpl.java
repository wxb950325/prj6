package com.woniu.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.Store;
import com.woniu.mapper.StoreMapper;
import com.woniu.service.IStoreService;

@Service
public class StoreServiceImpl implements IStoreService {
	
	@Resource
	private StoreMapper storeMapper;
	@Override
	@Transactional(readOnly = true)
	public List findAll() {
		// TODO Auto-generated method stub
		return storeMapper.selectByExample(null);
	}
	@Override
	@Transactional
	public void save(Store store, Integer[] chk) {
		//插入store表中
		storeMapper.insert(store);
	}
	@Override
	public void delete(Integer sid) {
		Store store = new Store();
		store.setSid(sid);
		store.setIsdelete(0);
		storeMapper.updateByPrimaryKeySelective(store);
	}
	@Override
	public void revoke(Integer sid) {
		// TODO Auto-generated method stub
		Store store = new Store();
		store.setSid(sid);
		store.setIsdelete(1);
		storeMapper.updateByPrimaryKeySelective(store);
	}
	@Override
	public Store findById(Integer sid) {
		// TODO Auto-generated method stub
		return storeMapper.selectByPrimaryKey(sid);
	}
	@Override
	public void update(Store store, Integer[] chk) {
		// TODO Auto-generated method stub
		
	}

}
