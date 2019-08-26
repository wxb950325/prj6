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
	public int selectByName(String zname) {
		
		return zoneMapper.selectByName(zname);
	}

}
