package com.woniu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Brand;
import com.woniu.entity.Message;
import com.woniu.entity.PageBean;
import com.woniu.service.IBrandService;

@RequestMapping("/before/brand/")
@Controller
public class BrandController {
	@Resource
	private IBrandService brandServiceImpl;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("findAll")
	public @ResponseBody Map findAll(PageBean pageBean) {
		List<Brand> rows=brandServiceImpl.findAll(pageBean);
		Map map=new HashMap();
		map.put("total", pageBean.getCount());
		map.put("rows", rows);
		return map;
	}
	
	@RequestMapping("save")
	public @ResponseBody Message save(Brand brand) {
		Message msg=null;
		try {
			brandServiceImpl.save(brand);
			msg=new Message(true, "商品品牌添加成功");
		} catch (Exception e) {
			msg=new Message(false, "商品品牌添加失败"+e.toString());
		}
		return msg;
		
	}
	
	@RequestMapping("delete")
	public @ResponseBody Message delete(int bid) {
		Message msg=null;
		try {
			brandServiceImpl.delete(bid);
			msg=new Message(true, "商品品牌删除成功");
		} catch (Exception e) {
			msg=new Message(false, "商品品牌删除失败"+e.toString());
		}
		return msg;
	}
	
	@RequestMapping("update")
	public @ResponseBody Message update(Brand brand) {
		Message msg=null;
		try {
			brandServiceImpl.update(brand);
			msg=new Message(true, "商品品牌修改成功");
		} catch (Exception e) {
			msg=new Message(false, "商品品牌修改失败"+e.toString());
		}
		return msg;
	}
	
	@RequestMapping("findById")
	public @ResponseBody Brand findById(Integer bid) {
		return brandServiceImpl.find(bid);
	}
	
	@RequestMapping("deleteBatch")
	public @ResponseBody Message deleteBatch(String stidstring) {// 1,2,3
		Message msg = null;
		try {
			String[] tempStrings = stidstring.split(",");
			Integer[] tids = new Integer[tempStrings.length];
			for (int i = 0; i < tempStrings.length; i++) {
				tids[i] = Integer.parseInt(tempStrings[i]);
			}
			brandServiceImpl.deleteBatch(tids);
			msg = new Message(true, "商品品牌批量删除成功");
		} catch (Exception e) {
			msg = new Message(false, "商品品牌批量删除失败"+e.getMessage());
		}
		return msg;
	}
}
