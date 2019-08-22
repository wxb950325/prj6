package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.Store;
import com.woniu.service.IProvinceService;
import com.woniu.service.IStoreService;
import com.woniu.service.impl.StoreServiceImpl;

@Controller
@RequestMapping("/before/store/")
public class StoreController {
	@Resource
	private IStoreService StoreServiceImpl;
	@Resource
	private IProvinceService provinceServiceImpl;

	// 添加商户
	@RequestMapping("save")
	public String save(Store store, Integer[] chk, ModelMap map) {
		StoreServiceImpl.save(store, chk);
		return "redirect:findAll";
	}

	// 删除
	@RequestMapping("delete")
	public String delete(Integer sid) {
		StoreServiceImpl.delete(sid);
		return "redirect:findAll";
	}

	// 恢复
	@RequestMapping("revoke")
	public String revoke(Integer sid) {
		StoreServiceImpl.revoke(sid);
		return "redirect:findAll";
	}

	// 商户查所有
	@RequestMapping("findAll")
	public String findAll(ModelMap map) {
		List list = StoreServiceImpl.findAll();
		map.put("list", list);
		return "/before/store/list";
	}

	// 商户查所有
	@RequestMapping("findById")
	public String findById(Integer sid,ModelMap map) {
		Store store = StoreServiceImpl.findById(sid);
		map.put("store", store);
		return "forward:goInput";
	}

	// 省市区级查所有
	@RequestMapping("goInput")
	public String goInput(ModelMap map) {
		List prov = provinceServiceImpl.findAll();
		List city = provinceServiceImpl.findAllCity();
		List zone = provinceServiceImpl.findAllZone();
		map.put("prov", prov);
		map.put("city", city);
		map.put("zone", zone);
		return "/before/store/input";
	}

}
