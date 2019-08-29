package com.woniu.service;

import java.util.List;

import com.woniu.entity.PageBean;
import com.woniu.entity.UserOrder;

public interface IUserOrderService {
	public void save(UserOrder userOrder);
	
	public void delete(Integer userOid);
	public void update(UserOrder userOrder);
	public void deleteBatch(Integer[] userOids);
	public UserOrder find(Integer userOid);
	public List<UserOrder> findAll(PageBean pageBean);
	
}
