package com.woniu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Message;
import com.woniu.entity.PageBean;
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
	public @ResponseBody Message delete(Integer sid) {
		Message msg = null;
		try {
			StoreServiceImpl.delete(sid);
			msg = new Message(true, "商户删除成功");
		} catch (Exception e) {
			msg = new Message(false, "商户删除失败");
		}
		
		return msg;
	}

	// 恢复
	@RequestMapping("revoke")
	public Message revoke(Integer sid) {
		Message msg = null;
		try {
			StoreServiceImpl.revoke(sid);
			msg = new Message(true, "商户恢复成功");
		} catch (Exception e) {
			msg = new Message(false, "商户恢复失败"+e.getMessage());
		}
		
		return msg;
	}

	// 商户查所有
	@RequestMapping("findAll")
	public @ResponseBody Map findAll(PageBean pagebean) {
		List rows = StoreServiceImpl.findAll(pagebean);
		Map map = new HashMap();
		map.put("total", pagebean.getCount());
		map.put("rows", rows);
		return map;
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
//		List city = provinceServiceImpl.findAllCity();
//		List zone = provinceServiceImpl.findAllZone();
		map.put("prov", prov);
//		map.put("city", city);
//		map.put("zone", zone);
		return "/before/store/input";
	}

}

