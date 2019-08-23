package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List findAll() {
		// TODO Auto-generated method stub
		return storeOrderMapper.selectByExample(null);
	}

	//删除
	@Override
	public void delete(Integer storeOid) {
		StoreOrder sOrder = new StoreOrder();
		sOrder.setStoreOid(storeOid);
		sOrder.setIsdelete(0);
		storeOrderMapper.updateByPrimaryKeySelective(sOrder);
		
	}

	//恢复
	@Override
	public void revoke(Integer storeOid) {
		StoreOrder sOrder = new StoreOrder();
		sOrder.setStoreOid(storeOid);
		sOrder.setIsdelete(1);
		storeOrderMapper.updateByPrimaryKeySelective(sOrder);
		
	}

}
