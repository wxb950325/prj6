package com.woniu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.woniu.entity.Address;
import com.woniu.entity.Userinfo;

public interface IAddressService {
	
	List findByUid(Integer uid);
	int delete(Integer aid);
	Address findAddByAid(Integer aid, Integer uid);
	void update(Address address);
	void save(Address address);
	
	
}
