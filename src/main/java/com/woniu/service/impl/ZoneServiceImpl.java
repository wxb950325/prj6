package com.woniu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woniu.mapper.ZoneMapper;
import com.woniu.service.IZoneService;

@Service
public class ZoneServiceImpl implements IZoneService {
	
	@Resource
	private ZoneMapper zoneMapper;
	@Override
	public String selectByName(String zname,String cid) {
		
		return zoneMapper.selectByName(zname,cid);
	}

}
