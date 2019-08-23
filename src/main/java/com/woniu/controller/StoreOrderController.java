package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.service.IStoreOrderService;
import com.woniu.service.impl.StoreOrderServiceImpl;

@Controller
@RequestMapping("/before/store/")
public class StoreOrderController {

	@Resource
	private IStoreOrderService StoreOrderServiceImpl;
	
	
	//商户订单查所有
	@RequestMapping("findAllOrder")
	public String findAllOrder(ModelMap map) {
		List orderList = StoreOrderServiceImpl.findAll();
		map.put("orderList", orderList);
		return "/before/store/s_orderList";
	}
	
	//商户订单删除
	@RequestMapping("deleteOrder")
	public String deleteOrder(Integer storeOid) {
		StoreOrderServiceImpl.delete(storeOid);
		return "redirect:findAllOrder";
	}
	
	//商户订单恢复
	@RequestMapping("revokeOrder")
	public String revokeOrder(Integer storeOid) {
		StoreOrderServiceImpl.revoke(storeOid);
		return "redirect:findAllOrder";
	}
}
