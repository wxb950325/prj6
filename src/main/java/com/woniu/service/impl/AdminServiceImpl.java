package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.Admin;
import com.woniu.mapper.AdminMapper;
import com.woniu.service.IAdminService;

@Service
@Transactional
public class AdminServiceImpl implements IAdminService {

	@Resource
	private AdminMapper adminMapper;
	
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.login(admin);
	}

	@Override
	public Admin findById(Integer aid) {
		// TODO Auto-generated method stub
		return adminMapper.selectByPrimaryKey(aid);
	}

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return adminMapper.selectByExample(null);
	}

	@Override
	public void delete(Integer aid) {
		// TODO Auto-generated method stub
		adminMapper.deleteByPrimaryKey(aid);
	}

	@Override
	public void updata(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.updateByPrimaryKeySelective(admin);
	}

}
