package com.woniu.controller;

import java.math.BigDecimal;
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
import com.woniu.entity.Product;
import com.woniu.entity.UserOrder;
import com.woniu.service.IAddressService;
import com.woniu.service.IProductService;
import com.woniu.service.IUserOrderService;


@Controller
@Transactional
@RequestMapping("/before/order/")
public class UserOrderController {
	
	@Resource
	private IProductService productService;
	
	@Resource
	private IAddressService addressService;
	
	@Resource
	private IUserOrderService userOrderService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("goInput")
	public @ResponseBody Map goInput(HttpSession session) {
		//从session中获取用户信息中的用户ID，查出用户地址
//		int uid=(int) session.getAttribute("uid");
		List<Address> rows=addressService.findByUid(1);
		//将获取到的所有地址信息发送到前端
		Map map=new HashMap();
		map.put("rows", rows);
		return map;
	}
	
	@SuppressWarnings({ "null", "unchecked", "rawtypes" })
	@RequestMapping("goOrder")
	public @ResponseBody List goOrder(HttpSession session,int aid) {
		List<UserOrder> list=null;
		//从session中获取用户信息中的用户ID
//		int uid=(int) session.getAttribute("uid");
		int uid=1;
		aid=1;
		
		UserOrder userOrder=new UserOrder();
		Date date=new Date();
		
		//订单时间就是当前时间，支付状态默认0为未支付
		userOrder.setOrderTime(date);
		userOrder.setPayStatus(0);
		userOrder.setIsdelete(0);
		
		//存入收货地址
		String address=addressService.findAddByAid(aid, uid).getAddress();
		userOrder.setAddress(address);
		
		//从session中获取购物车内商品id和商品数量;
		//用户ID加订单生成的当前时间就是订单编号，这样能确保唯一性
		BigDecimal orderMoney=new BigDecimal(0);
		Map<Integer,Integer> cart=(Map<Integer,Integer>)session.getAttribute("carts");
		for(Map.Entry<Integer,Integer> entry:cart.entrySet()) {
			int pid=entry.getKey();
			Integer pnum=entry.getValue();
			Product product=productService.find(pid);
			BigDecimal sellingPrice=product.getSellingPrice();
			orderMoney=sellingPrice.multiply(new BigDecimal(pnum));
			
			//将用户ID、商品数量、商品id、订单金额、订单编号存入用户订单对象中
			userOrder.setUid(uid);
			userOrder.setpNum(pnum);
			userOrder.setPid(pid);
			userOrder.setOrderMoney(orderMoney);
			String orderNum=date.getTime()+""+uid+pid;
			userOrder.setOrderNum(orderNum);
			
			//将生成的订单对象存入数据库中
			userOrderService.save(userOrder);
			
			//将订单对象放入集合中，再将集合发送到前端
			list.add(userOrder);
		}
		
		return list;
	}
	
	@RequestMapping("goPay")
	public void goPay() {
		
	}
}
