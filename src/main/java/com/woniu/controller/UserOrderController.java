package com.woniu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Address;
import com.woniu.entity.UserOrder;
import com.woniu.entity.Userinfo;
import com.woniu.service.IAddressService;
import com.woniu.service.IUserOrderService;

@Controller
@Transactional
@RequestMapping("/before/order/")
public class UserOrderController {
	@Resource
	private IAddressService addressService;
	@Resource
	private IUserOrderService userOrderService;
	
	@RequestMapping("goInput")
	public @ResponseBody Map goInput(HttpSession session) {
		//从session中获取用户信息中的用户ID，查出用户地址
//		Userinfo userinfo=(Userinfo) session.getAttribute("userinfo");
//		int uid=userinfo.getUid();
		List<Address> rows=addressService.findByUid(1);
		//将获取到的所有地址信息发送到前端
		Map map=new HashMap();
		map.put("rows", rows);
		return map;
	}
	
	@RequestMapping("goOrder")
	public @ResponseBody UserOrder goOrder(HttpSession session,int aid) {
		//从session中获取用户信息中的用户ID
//		Userinfo userinfo=(Userinfo) session.getAttribute("userinfo");
		UserOrder userOrder=new UserOrder();
//		int uid=userinfo.getUid();
		userOrder.setUid(1);
		
		//用户ID加订单生成的当前时间就是订单编号，这样能确保唯一性
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String orderNum=1+sdf.format(date);
		userOrder.setOrderNum(orderNum);
		
		//订单时间就是当前时间，支付状态默认0为未支付
		userOrder.setOrderTime(date);
		userOrder.setPayStatus(0);
		
		
		//将生成的订单对象存入数据库中
		userOrderService.save(userOrder);
		
		Map map=new HashMap();
		map.put("userOrder", userOrder);
		return userOrder;
	}
	
	@RequestMapping("goPay")
	public void goPay() {
		
	}
}
