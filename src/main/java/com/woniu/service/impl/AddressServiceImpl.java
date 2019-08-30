package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.Address;
import com.woniu.entity.AddressExample;
import com.woniu.mapper.AddressMapper;
import com.woniu.service.IAddressService;

@Service
@Transactional
public class AddressServiceImpl implements IAddressService {

	@Resource
	private AddressMapper addressMapper;
	
	
	@Override
	public List findByUid(Integer uid) {
		AddressExample example = new AddressExample();
		example.createCriteria().andUidEqualTo(uid);
		List<Address> list = addressMapper.selectByExample(example);
		return list;
	}


	@Override
	public int delete(Integer aid) {
		return addressMapper.deleteByPrimaryKey(aid);
	}


	@Override
	public Address findAddByAid(Integer aid,Integer uid) {
		return addressMapper.findAddByAid(aid,uid);
	}


	@Override
	public void update(Address address) {
		addressMapper.updateByPrimaryKeySelective(address);
	}


	@Override
	public void save(Address address) {
		addressMapper.insertSelective(address);
	}

}
