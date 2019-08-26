package com.woniu.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public String save(@RequestParam("fileName") MultipartFile file,HttpServletRequest req,Storetype storetype,Store store, Integer[] chk) {

		
		String fileName = file.getOriginalFilename();//获取文件名
		System.out.println(fileName);
		
		fileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
					
		// 获取web应用，所在服务器的真实路径。
		String path = req.getServletContext().getRealPath("/image");
		
		System.out.println(path + "~~~~~~~~~~~~~~");
		
		File imagesDir = new File(path);
		// 判断images文件夹是否存在，如果不存在就创建一个
		if(!imagesDir.exists()) {
			imagesDir.mkdirs();
		}
		try {
			file.transferTo(new File(path ,fileName));//保存文件
			store.setLegalPhoto("http://localhost:8888/image/"+fileName);		
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(store);
		StoreServiceImpl.save(store, chk);
		System.out.println("上传成功");
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

