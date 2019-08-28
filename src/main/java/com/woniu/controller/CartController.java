package com.woniu.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
			
			msg = new Message(true, "成功");
		} catch (Exception e) {
			msg = new Message(false, "加入购物车失败，请先登录~");
		}
		return msg;
	}
	
	@RequestMapping("findAll")
	public String  findAll2Seller(ModelMap map) {      //给商户的FindAll
		List<Cart> carts = cartServiceImpl.find();
		map.put("carts", carts);
		return "before/gwc2";
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