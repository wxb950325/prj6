package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.entity.Storetype;
import com.woniu.mapper.StoretypeMapper;
import com.woniu.service.IStoretypeService;

@Service
public class StoretypeServiceImpl implements IStoretypeService{

	@Resource
	private StoretypeMapper storetypeMapper;
	
	
	@Override
	public List<Storetype> storetypes() {
		
		return storetypeMapper.selectByExample(null);
	}

}
