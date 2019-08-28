package com.woniu.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import com.woniu.entity.Message;
import com.woniu.entity.PageBean;
import com.woniu.entity.Product;
import com.woniu.service.IProductService;
  
@Controller 
@Transactional
@RequestMapping("/admin/product/")
public class ProductController {
	  
	@Resource
	private IProductService productServiceImpl;
	
	private String photo;
	   
	@RequestMapping("save")
	public String save(Product product,ModelMap map){
		product.setPhoto(photo);
		productServiceImpl.save(product);
        return "redirect:findAll2Seller";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("upload")
	@ResponseBody
	public String upload(@RequestParam("photo") MultipartFile multipartFile,
			HttpServletRequest request,ModelMap map) {
		try {
			
			//获取项目路径
			String realPath = request.getSession().getServletContext()
					.getRealPath("");
			System.out.println(realPath+"!~~~~~~~~");
			InputStream inputStream = multipartFile.getInputStream();
			String contextPath = request.getContextPath();
			//服务器根目录的路径
			
			String uploadPath =  request.getRealPath("/upload");
			//根目录下新建文件夹upload
		
			//获取文件名称
			String newName = getUploadFileName(multipartFile);
			
			//将文件上传dao服务器根目录下的upload文件夹
			File file = new File(uploadPath, newName);
			FileUtils.copyInputStreamToFile(inputStream, file);
			//返回图片访问路径
			photo = "/upload/" + newName;
			map.put("photo", photo);
			
			return photo;
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	private String getUploadFileName(MultipartFile multipartFile) {
		String uploadFileName = multipartFile.getOriginalFilename();
		
		 int lastDot = uploadFileName.lastIndexOf(".");
		 String ext = uploadFileName.substring(lastDot);
		 String newName = UUID.randomUUID().toString().replaceAll("-", "");
		 newName += ext;
		
		 return newName;
	}
	
	@RequestMapping("update")
	public String update(Product product,ModelMap map) {
		product.setPhoto(photo);
		productServiceImpl.update(product);
		return "redirect:/admin/product/list2.jsp";
	}
	
	@RequestMapping("findAll2Seller")
	public @ResponseBody Map findAll2Seller(PageBean pagebean) {      //给商户的FindAll
		Map map = new HashMap();
		List<Product> rows = productServiceImpl.findAll2Seller(pagebean);
		map.put("total", pagebean.getCount());
		map.put("rows", rows);
		return map;
	}
	
//	@RequestMapping("findAll2buyers")
//	public List findAll2buyers() {         //给逛大集首页的FindAll，调用
//		List<Product> list = productServiceImpl.findAll2buyers();
//		return list;
//	} 
	
	@RequestMapping("findAll2beforeByPrice")
	public @ResponseBody List findAll2beforeByPrice() {     //给逛大集首页的FindAll，最实惠 那一栏
		List<Product> list = productServiceImpl.findAll2beforeByPrice();
		System.out.println("ProductController.findAll2beforeByPrice()");
		return list;
	} 
	
	@RequestMapping("findAll2beforeByTime")
	public @ResponseBody List findAll2beforeByTime() {     //给逛大集首页的FindAll，最新品 那一栏
		List<Product> list2 = productServiceImpl.findAll2beforeByTime();
		System.out.println("ProductController.findAll2beforeByTime()");
		return list2;
	} 
	
	   
	@RequestMapping("findById")
	public String findById(Integer pid,ModelMap map) {
		Product product = productServiceImpl.find(pid);
		map.put("product", product);
		System.out.println(product);
		return "/admin/product/input";
	}
	
	@RequestMapping("gogoodsinfo")
	public String gogoodsinfo(Integer pid,ModelMap map) {
		Product goods = productServiceImpl.find(pid);
		map.put("goods", goods);
		System.out.println(goods);
		return "/before/goodsinfo";
	}
	
	@RequestMapping("delete")
	public @ResponseBody Message delete(Integer pid) {
		
		Message msg = null;
		try {
			productServiceImpl.delete(pid);
			msg = new Message(true, "成功");
		} catch (Exception e) {
			msg = new Message(false, "失败"+e.getMessage());
		}
		
		return msg;
	}
	
	@RequestMapping("revoke")
	public @ResponseBody Message revoke(Integer pid) {
		Message msg = null;
		try {
			productServiceImpl.revoke(pid);
			msg = new Message(true, "成功");
		} catch (Exception e) {
			msg = new Message(false, "失败"+e.getMessage());
		}
		return msg;
	}
	
	@RequestMapping("goInput")
	public String goInput(ModelMap map) {
		List<Product> list = productServiceImpl.find();
		map.put("list", list);
		return "/admin/product/input";
	}
	
	@RequestMapping("audit")     //审核员审核商品调用此方法
	public String audit(ModelMap map,Integer pid) {
		Product product = productServiceImpl.find(pid);
		Integer isaudit = product.getIsaudit();
		int tempInt = 0 ;
		if(isaudit==0) {
			tempInt = 1;
		}else {
			tempInt = 0 ;
		}
		product.setIsaudit(tempInt);
		productServiceImpl.update(product);
		return "redirect:findAll2Seller";
	}
	
	
	
	
}