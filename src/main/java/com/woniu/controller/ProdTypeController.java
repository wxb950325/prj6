package com.woniu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Message;
import com.woniu.entity.PageBean;
import com.woniu.entity.ProdType;
import com.woniu.service.IProdTypeService;

@RequestMapping("/before/prodType/")
@Controller
public class ProdTypeController {
	
	@Resource
	private IProdTypeService prodTypeServiceImpl;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("findAll")
	public @ResponseBody Map findAll(PageBean pageBean) {
		List<ProdType> rows = prodTypeServiceImpl.findAll(pageBean);
		Map map = new HashMap();
		map.put("total", pageBean.getCount());
		map.put("rows", rows);
		return map;
	}
	
	//给首页展示的类型  findAll
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("findAll2Before")
	public @ResponseBody List findAll2Before() {
		List<ProdType> rows = prodTypeServiceImpl.findAll2Before();
//		Map map = new HashMap();
//		map.put("rows", rows);
		return rows;
	}
	
	
	@RequestMapping("findById")
	public @ResponseBody ProdType findById(Integer tid) {
		return prodTypeServiceImpl.find(tid);
	}
	
	@RequestMapping("save")
	public @ResponseBody Message save(ProdType prodType) {
		Message msg = null;
		try {
			prodTypeServiceImpl.save(prodType);
			msg = new Message(true, "商品类型增加成功");
		} catch (Exception e) {
			msg = new Message(false, "商品类型增加失败"+e.getMessage());
		}
		return msg;
	}
	
	@RequestMapping("update")
	public @ResponseBody Message update(ProdType prodType) {
		Message msg = null;
		try {
			prodTypeServiceImpl.update(prodType);
			msg = new Message(true, "商品类型修改成功");
		} catch (Exception e) {
			msg = new Message(false, "商品类型修改失败"+e.getMessage());
		}
		return msg;
	}
	
	@RequestMapping("delete")
	public @ResponseBody Message delete(Integer tid) {
		Message msg = null;
		try {
			prodTypeServiceImpl.delete(tid);
			msg = new Message(true, "商品类型删除成功");
		} catch (Exception e) {
			msg = new Message(false, "商品类型删除失败"+e.getMessage());
		}
		return msg;
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
			prodTypeServiceImpl.deleteBatch(tids);
			msg = new Message(true, "商品类型批量删除成功");
		} catch (Exception e) {
			msg = new Message(false, "商品类型批量删除失败"+e.getMessage());
		}
		return msg;
	}
}
