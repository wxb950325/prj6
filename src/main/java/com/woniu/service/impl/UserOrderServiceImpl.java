package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.woniu.entity.PageBean;
import com.woniu.entity.UserOrder;
import com.woniu.mapper.UserOrderMapper;
import com.woniu.service.IUserOrderService;

@Service
public class UserOrderServiceImpl implements IUserOrderService {
	@Resource
	private UserOrderMapper userOrderMapper;
	
	@Override
	public void save(UserOrder userOrder) {
		userOrderMapper.insertSelective(userOrder);
	}

	@Override
	public void delete(Integer userOid) {
		UserOrder userOrder=userOrderMapper.selectByPrimaryKey(userOid);
		userOrder.setIsdelete(1);
		userOrderMapper.updateByPrimaryKeySelective(userOrder);
	}

	@Override
	public void update(UserOrder userOrder) {
		userOrderMapper.updateByPrimaryKeySelective(userOrder);
	}

	@Override
	public void deleteBatch(Integer[] userOids) {
		userOrderMapper.deleteBatch(userOids);
	}

	@Override
	public UserOrder find(Integer userOid) {
		return userOrderMapper.selectByPrimaryKey(userOid);
	}

	@Override
	public List<UserOrder> findAll(PageBean pageBean) {
		List<UserOrder> list = userOrderMapper.selectByExample(null,new RowBounds(pageBean.getOffset(), pageBean.getLimit()));
		int count = userOrderMapper.countByExample(null);
		pageBean.setCount(count);
		return list;
	}

}
