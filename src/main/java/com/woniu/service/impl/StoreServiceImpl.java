package com.woniu.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.PageBean;
import com.woniu.entity.Store;
import com.woniu.mapper.StoreMapper;
import com.woniu.service.IStoreService;

@Service
public class StoreServiceImpl implements IStoreService {
	
	@Resource
	private StoreMapper storeMapper;
	@Override
	@Transactional(readOnly = true)
	public List findAll(PageBean pagebean) {
		List list = storeMapper.selectByExample(null,new RowBounds(pagebean.getOffset(), pagebean.getLimit()));
		int count = storeMapper.countByExample(null);
		pagebean.setCount(count);
		return list;
	}
	@Override
	@Transactional
	public void save(Store store, Integer[] chk) {
		//插入store表中
		storeMapper.insert(store);
	}
	//删除
	@Override
	public void delete(Integer sid) {
//		Store store = new Store();
//		store.setSid(sid);
//		store.setIsdelete(0);
//		storeMapper.updateByPrimaryKeySelective(store);
		Store store = storeMapper.selectByPrimaryKey(sid);
		System.out.println("store"+store);
		int i = store.getIsdelete();
		System.out.println("i"+i);
		if(i == 1) {
			i = 0;
		}else {
			i = 1;
		}
		store.setIsdelete(i);
		storeMapper.updateByPrimaryKey(store);
	}
	@Override
	public void revoke(Integer sid) {
		// TODO Auto-generated method stub
		Store store = storeMapper.selectByPrimaryKey(sid);
		store.setIsdelete(0);
		storeMapper.insertSelective(store);
	}
	@Override
	public Store findById(Integer sid) {
		
		return storeMapper.selectByPrimaryKey(sid);
	}
	@Override
	public void update(Store store, Integer[] chk) {
	
		storeMapper.updateByPrimaryKeySelective(store);
		
	}
	@Override
	public List findOneByUid(int uid) {
		
		return storeMapper.findOneByUid(uid);
	}

}
