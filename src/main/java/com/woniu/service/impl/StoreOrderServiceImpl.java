package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.PageBean;
import com.woniu.entity.Store;
import com.woniu.entity.StoreOrder;
import com.woniu.mapper.StoreOrderMapper;
import com.woniu.service.IStoreOrderService;

@Service
public class StoreOrderServiceImpl implements IStoreOrderService {

	@Resource
	private StoreOrderMapper storeOrderMapper;
	
	//商户订单查所有
	@Override
	@Transactional(readOnly = true)
	public List findAll(PageBean pagebean) {
		// TODO Auto-generated method stub
		List list = storeOrderMapper.selectByExample(null,new RowBounds(pagebean.getOffset(),pagebean.getLimit()));
		int count = storeOrderMapper.countByExample(null);
		pagebean.setCount(count);
		return list;
	}

	//删除
	@Override
	public void delete(Integer storeOid) {
		StoreOrder sOrder = storeOrderMapper.selectByPrimaryKey(storeOid);
		int i = sOrder.getIsdelete();
		if(i==1) {
			i = 0;
		}else {
			i = 1;
		}
		sOrder.setIsdelete(i);
		storeOrderMapper.updateByPrimaryKey(sOrder);
		
	}

	//恢复
	@Override
	public void revoke(Integer storeOid) {
		StoreOrder sOrder = storeOrderMapper.selectByPrimaryKey(storeOid);
//		sOrder.setStoreOid(storeOid);
		sOrder.setIsdelete(0);
		storeOrderMapper.insertSelective(sOrder);
		
	}

	//查询一个
	@Override
	public StoreOrder findOne(Integer storeOid) {
		return storeOrderMapper.selectByPrimaryKey(storeOid);
	}

	@Override
	public void save(StoreOrder storeOrder) {
		storeOrder.setIsdelete(1);
		storeOrderMapper.insertSelective(storeOrder);
		
	}

	@Override
	public void update(StoreOrder storeOrder) {
		storeOrderMapper.updateByPrimaryKeySelective(storeOrder);
		
	}

}
