package com.woniu.service;

import java.util.List;

public interface IStoreOrderService {

	public List findAll();
	public void delete(Integer storeOid);
	public void revoke(Integer storeOid);
}
