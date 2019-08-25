package com.woniu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Message;
import com.woniu.entity.PageBean;
import com.woniu.entity.StoreOrder;
import com.woniu.service.IStoreOrderService;
import com.woniu.service.impl.StoreOrderServiceImpl;

@Controller
@RequestMapping("/before/store/")
public class StoreOrderController {

	@Resource
	private IStoreOrderService StoreOrderServiceImpl;
	
	
	//商户订单查所有
	@RequestMapping("findAllOrder")
	public @ResponseBody Map findAllOrder(PageBean pagebean) {
		List rows = StoreOrderServiceImpl.findAll(pagebean);
		Map map = new HashMap();
		map.put("total", pagebean.getCount());
		map.put("rows", rows);
		return map;
	}
	
	//商户订单删除
	@RequestMapping("deleteOrder")
	public @ResponseBody Message deleteOrder(Integer storeOid) {
		Message msg = null;
		try {
			StoreOrderServiceImpl.delete(storeOid);
			msg = new Message(true, "订单删除成功");
		} catch (Exception e) {
			msg = new Message(false, "订单删除失败"+e.getMessage());
		}
//		StoreOrderServiceImpl.delete(storeOid);
//		return "redirect:findAllOrder";
		return msg;
	}
	
	//商户订单恢复
	@RequestMapping("revokeOrder")
	public @ResponseBody Message revokeOrder(Integer storeOid) {
		Message msg = null;
		try {
			StoreOrderServiceImpl.revoke(storeOid);
			msg = new Message(true, "订单恢复成功");
		} catch (Exception e) {
			msg = new Message(false, "订单恢复失败"+e.getMessage());
		}
		return msg;
	}
	
	@RequestMapping("findBySoid")
	public @ResponseBody StoreOrder findById(Integer storeOid) {
		StoreOrder storeOrder = StoreOrderServiceImpl.findOne(storeOid);
		return storeOrder;
	}
	
	//商户订单增加
		@RequestMapping("saveOrder")
		public @ResponseBody Message saveOrder(StoreOrder storeOrder) {
			Message msg = null;
			try {
				StoreOrderServiceImpl.save(storeOrder);
				msg = new Message(true, "订单增加成功");
			} catch (Exception e) {
				msg = new Message(false, "订单增加失败"+e.getMessage());
			}
			return msg;
		}
	
}
