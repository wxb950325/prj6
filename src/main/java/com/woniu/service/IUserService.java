package com.woniu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.woniu.entity.Userinfo;

public interface IUserService {
	
	boolean registe(Userinfo info);
	boolean login(Userinfo info,HttpSession session);
	List findByPhone(Userinfo info);
	Userinfo findById(Integer uid);
	void update(Userinfo info);
}
