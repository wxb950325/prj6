package com.woniu.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.woniu.entity.Message;
import com.woniu.entity.PageBean;
import com.woniu.entity.Store;
import com.woniu.entity.Storetype;
import com.woniu.service.ICityService;
import com.woniu.service.IProvinceService;
import com.woniu.service.IStoreService;
import com.woniu.service.IZoneService;
import com.woniu.service.impl.StoreServiceImpl;

@Controller
@RequestMapping("/before/store/")
public class StoreController {
	@Resource  
	private IStoreService StoreServiceImpl;
	
	@Resource
	private IProvinceService provinceServiceImpl;
	@Resource
	private ICityService cityServiceImpl;
	@Resource
	private IZoneService zoneServiceImpl;
	
	// 添加商户
	@RequestMapping("save")
	public String save(@RequestParam("fileName") MultipartFile file,HttpServletRequest req,Storetype storetype,Store store, HttpSession session,Integer[] chk) {
		
		//获取用户的uid
		Integer uid = (Integer) session.getAttribute("uid");
		System.out.println(uid+"aaaaaaaaa");
		store.setUid(uid);
		
		//根据省市区名 获得 相应id
		String provinceName = store.getProvinceName();
		
		String cityName = store.getCityName();
		String zoneName = store.getZoneName();	
		String pid = provinceServiceImpl.selectByName(provinceName);
		String cid = cityServiceImpl.selectByName(cityName,pid);
		String zid = zoneServiceImpl.selectByName(zoneName,cid);
		
		System.out.println("省市区");
		store.setProvinceId(Integer.parseInt(pid));
		store.setCityId(Integer.parseInt(cid));
		store.setZoneId(Integer.parseInt(zid));
		store.setIsaudit(0);
		store.setIsdelete(0);
		
		//图片存盘
		Store upload = upload(file,req,store);
		
		session.setAttribute("store", upload);
		StoreServiceImpl.save(store, chk);
		
		return "/before/userinfo/main/basicInfo";
		
		
	}
	
	//图片存盘
	public Store upload(MultipartFile file,HttpServletRequest req,Store store) {
		
		//图片存盘
				String fileName = file.getOriginalFilename();//获取文件名
				
				if(fileName!=null) {
					
					System.out.println(fileName);	
					fileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
					String path = req.getServletContext().getRealPath("/image");		
					System.out.println(path + "~~~~~~~~~~~~~~");		
					File imagesDir = new File(path);
					if(!imagesDir.exists()) {
						imagesDir.mkdirs();
					}
					try {
						file.transferTo(new File(path ,fileName));//保存文件
						//设置文件路径
						store.setLegalPhoto("http://localhost:8888/image/"+fileName);		
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					System.out.println("上传成功");
					return store;
				}else {
					System.out.println("未上传");
					return store;
				}
	}
	
	
		
	// 删除
	@RequestMapping("deleteStore")
	public @ResponseBody Message delete(Integer sid) {
		System.out.println("sid:"+sid);
		Message msg = null;
		try {
			System.out.println("111111111111");
			StoreServiceImpl.delete(sid);
			System.out.println("22222222");
			msg = new Message(true, "商户删除成功");
			System.out.println(msg+"msg");
		} catch (Exception e) {
			msg = new Message(false, "商户删除失败");
		}
		
		return msg;
	}
	
	// 通过sid查找一个，回显，修改
	@RequestMapping("storelist/findById")
	public @ResponseBody Store findBySid(Integer sid,HttpSession session) {
		
		System.out.println("sid:"+sid);
		
		Store store = StoreServiceImpl.findById(sid);
		System.out.println(store+"333333333");
		session.setAttribute("findBySid", store);
		return store;
	}
	
		// 商户自己修改
		@RequestMapping("update")
		public @ResponseBody Message update(@RequestParam("fileName") MultipartFile file,Store store,HttpSession session,HttpServletRequest req) {
			
			System.out.println("update"+store.getLegalPhoto());
			
			Store upload = upload(file,req,store);
		
			Message msg = null;
			try {
				
				StoreServiceImpl.update(upload, null);
				System.out.println("22222222");
				msg = new Message(true, "商户修改成功");
				System.out.println(msg+"msg");
			} catch (Exception e) {
				msg = new Message(false, "商户修改失败");
			}
			
			return msg;
		}
		
		// 后台审核修改
				@RequestMapping("update1")
				public @ResponseBody Message update1(Store store,HttpSession session,HttpServletRequest req) {
					
					System.out.println("update"+store.getLegalPhoto());
				
					Message msg = null;
					try {
						
						StoreServiceImpl.update(store, null);
						System.out.println("22222222");
						msg = new Message(true, "商户修改成功");
						System.out.println(msg+"msg");
					} catch (Exception e) {
						msg = new Message(false, "商户修改失败");
					}
					
					return msg;
				}

	// 恢复
	@RequestMapping("revokeStore")
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
	@RequestMapping("findAllStore")
	public @ResponseBody Map findAll(PageBean pagebean) {
		List rows = StoreServiceImpl.findAll(pagebean);
		Map map = new HashMap();
		map.put("total", pagebean.getCount());
		map.put("rows", rows);
		return map;
	}

	
	
	//查询商户个人信息
	@RequestMapping("findBySid")
	public String findBySid(HttpSession session) {
		session.getAttribute("store");
		
		return "before/store/storeshow";
	}



}

