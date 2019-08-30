package com.woniu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.woniu.entity.Cart;
import com.woniu.entity.PageBean;
import com.woniu.entity.ProdType;
import com.woniu.entity.Product;


public interface ICartService {
	
	public void save(Cart cart);
	
	public Cart find(Integer cid);
	
	public List<Cart> find();
	
	public void delete(Integer cid);
	
	public void update(Cart cart);
	
	public void clear(Integer uid);
	public void clear();
}
