package com.woniu.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.woniu.entity.Cart;
import com.woniu.entity.Message;
import com.woniu.entity.PageBean;
import com.woniu.entity.Product;
import com.woniu.entity.Userinfo;
import com.woniu.service.ICartService;
import com.woniu.service.IProductService;
  
@Controller 
@Transactional
@RequestMapping("/before/cart/")
public class CartController {
	  
	@Resource
	private ICartService cartServiceImpl;
	
	@Resource
	private IProductService productServiceImpl;
	
	@RequestMapping("save")
	public @ResponseBody Message save(Cart cart,ModelMap map,HttpServletRequest request,HttpSession session){
		Message msg = null;
		try {
			System.out.println("CartController.save()");
			Integer pid = cart.getPid();
			Product pro = productServiceImpl.find(pid);
			String pname = pro.getpName();
			BigDecimal price = pro.getSellingPrice();
			String photo = pro.getPhoto();
//			Userinfo user = (Userinfo) session.getAttribute("uid");
//			Integer uid = user.getUid();
			//uid  和 sid暂时不加
			cart.setPname(pname);
			cart.setPrice(price);
			cart.setPhoto(photo);
//			cart.setUid(uid);
			cartServiceImpl.save(cart);
			
			msg = new Message(true, "添加购物车成功");
		} catch (Exception e) {
			msg = new Message(false, "加入购物车失败，请先登录~");
		}
		return msg;
	}
	
    //购物车的FindAll
	@RequestMapping("findAll")
	public String  findAll2Seller(ModelMap map,HttpSession session) {
		List<Cart> carts = cartServiceImpl.find();
		map.put("carts", carts);
		//将购物车中的商品id 和对应的数量存在 session 的map中
		Map<Integer,Integer> cartsMap = (Map<Integer,Integer>) session.getAttribute("carts");
		if(cartsMap==null) {
			cartsMap = new HashMap();
		}
		
		for (Cart cart : carts) {
				Integer pid = cart.getPid();  //获取购物车里的商品id
				Integer getpNum = cart.getpNum();  //获取购物车里的商品id对应的 数量
				Integer tempNum = cartsMap.get(pid);         //看看map里有没有存放该商品
				if(tempNum==null) {
					cartsMap.put(pid, getpNum);
				}else {
					getpNum+=tempNum;
					cartsMap.put(pid, getpNum);
				}
				
				System.out.println(getpNum+"~~~~~~~");
		}
		
		session.setAttribute("carts", cartsMap);
		return "before/gwc2";
	}
	
	//跳转到选择地址页面的方法  gopay
	@RequestMapping("selectAddress")
	public String  selectAddress(ModelMap map,HttpSession session) {   
		
		Map<Integer,Integer> cartsMap = (Map<Integer,Integer>) session.getAttribute("carts");
		Set<Integer> keySet = cartsMap.keySet();
		Iterator<Integer> it = keySet.iterator();
		while(it.hasNext()) {
			Integer pid = it.next();
			Integer pNum = (Integer) cartsMap.get(pid);
			System.out.println("pid:"+pid+"   "+"pNum:"+pNum);
		}
		return "redirect:/before/order/goInput";
	}
	
	//清空购物车的方法
	@RequestMapping("clear")
	public String clear(HttpSession session) {
//		Userinfo user = (Userinfo) session.getAttribute("uid");
//		Integer uid = user.getUid();
//		cartServiceImpl.clear(uid);
		//有用户登录 用上面的清空  无用户登录 用下面的清空
		cartServiceImpl.clear();
		//清空session中map里存放的商品id及对应的数量
		Map<Integer,Integer> cartsMap = (Map<Integer,Integer>) session.getAttribute("carts");
		if(cartsMap!=null) {
			cartsMap.clear();
		}
		return "redirect:/before/cart/findAll";
	}
	
	   
	@RequestMapping("findById")
	public String findById(Integer cid,ModelMap map) {
		Cart cart = cartServiceImpl.find(cid);
		map.put("cart", cart);
		System.out.println(cart);
		return "/before/cart/input";
	}
	
	@RequestMapping("delete")
	public String delete(Integer cid) {
		System.out.println("CartController.delete()");
		cartServiceImpl.delete(cid);
		return "redirect:/before/cart/findAll";
	}
	
	
	
}