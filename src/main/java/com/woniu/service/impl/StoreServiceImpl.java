package com.woniu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.entity.Store;
import com.woniu.mapper.StoreMapper;
import com.woniu.service.IStoreService;

@Service
public class StoreServiceImpl implements IStoreService{
	
	@Resource
	private StoreMapper storeMapper;
	
	@Override
	public void insert(Store store) {
		
		storeMapper.insertSelective(store);
		
	}

}
