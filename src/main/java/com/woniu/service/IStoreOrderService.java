package com.woniu.service;

import java.util.List;

import com.woniu.entity.PageBean;
import com.woniu.entity.Store;
import com.woniu.entity.StoreOrder;

public interface IStoreOrderService {

	public void save(StoreOrder storeOrder);
	public void update(StoreOrder storeOrder);
	public List findAll(PageBean pagebean);
	public void delete(Integer storeOid);
	public void revoke(Integer storeOid);
	public StoreOrder findOne(Integer storeOid);
}
