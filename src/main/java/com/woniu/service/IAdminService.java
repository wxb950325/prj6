package com.woniu.service;

import java.util.List;

import com.woniu.entity.Admin;

public interface IAdminService {
	
	public Admin login(Admin admin);
	
	Admin findById(Integer aid);
	List findAll();
	void delete(Integer aid);
	void updata(Admin admin);
	
}
