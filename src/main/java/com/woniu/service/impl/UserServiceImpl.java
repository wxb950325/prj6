package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.Userinfo;
import com.woniu.entity.UserinfoExample;
import com.woniu.entity.UserinfoExample.Criteria;
import com.woniu.mapper.UserinfoMapper;
import com.woniu.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	@Resource
	private UserinfoMapper userinfoMapper;
	
	//注册
	@Override
	public boolean registe(Userinfo info) {
		// TODO Auto-generated method stub
		List<Userinfo> list = findByPhone(info);
		if(list==null||list.size()==0) {
			userinfoMapper.insertSelective(info);
			return true;
		}
		return false;
	}

	//登录
	@Override
	public boolean login(Userinfo loginInfo,HttpSession session) {
		List<Userinfo> list = findByPhone(loginInfo);
		if(list==null||list.size()==0) {
			return false;
		}
		if(loginInfo.getPhone()==null||loginInfo.getPhone().equals("")) {
			return false;
		}
		if(list.get(0).getUpass().equals(loginInfo.getUpass()) && list.get(0).getPhone().equals(loginInfo.getPhone())) {
			session.setAttribute("loginInfo", loginInfo);
			return true;
		}
		return false;
	}

	//根据电话号在数据库中查找
	@Override
	public List findByPhone(Userinfo info) {
		// TODO Auto-generated method stub
		UserinfoExample example = new UserinfoExample();
		Criteria c = example.createCriteria();
		c.andPhoneEqualTo(info.getPhone());
		List<Userinfo> list = userinfoMapper.selectByExample(example);
		return list;
	}

	@Override
	public Userinfo findById(Integer uid) {
		// TODO Auto-generated method stub
		Userinfo userinfo = userinfoMapper.selectByPrimaryKey(uid);
		return userinfo;
	}

	@Override
	public void update(Userinfo info) {
		// TODO Auto-generated method stub
		userinfoMapper.updateByPrimaryKeySelective(info);
	}

}
