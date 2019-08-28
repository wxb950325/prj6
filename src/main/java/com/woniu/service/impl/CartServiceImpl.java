package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.Cart;
import com.woniu.entity.CartExample;
import com.woniu.mapper.CartMapper;
import com.woniu.service.ICartService;

@Service
@Transactional
public class CartServiceImpl implements ICartService {
	
	@Resource
	private CartMapper  cartMapper;
	
	@Override
	public void save(Cart cart) {
		// TODO Auto-generated method stub
		cart.setIsdelete(1);
		cartMapper.insertSelective(cart);
	}

	@Override
	public Cart find(Integer cid) {
		// TODO Auto-generated method stub
		return cartMapper.selectByPrimaryKey(cid);
	}

	@Override
	public List<Cart> find() {
		// TODO Auto-generated method stub
		return cartMapper.findAll();
	}

	@Override
	public void delete(Integer cid) {     //软删除
		// TODO Auto-generated method stub
		Cart c = cartMapper.selectByPrimaryKey(cid);
		System.out.println(c);
		c.setIsdelete(0);
		cartMapper.updateByPrimaryKeySelective(c);
	}

	@Override
	public void update(Cart cart) {
		// TODO Auto-generated method stub
		cartMapper.updateByPrimaryKeySelective(cart);
	}

	@Override
	public void clear(Integer uid) {
		// TODO Auto-generated method stub
		CartExample example = new CartExample();
		example.createCriteria().andUidEqualTo(uid);
		List<Cart> carts = cartMapper.selectByExample(example);
		for (Cart cart : carts) {
			cart.setIsdelete(0);
		}
		
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		List<Cart> carts = cartMapper.selectByExample(null);
		for (Cart cart : carts) {
			cart.setIsdelete(0);
			cartMapper.updateByPrimaryKeySelective(cart);
		}
	}
	
	
}
	
	