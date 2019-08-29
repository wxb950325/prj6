package com.woniu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Address;
import com.woniu.entity.Message;
import com.woniu.entity.UserOrder;
import com.woniu.service.IAddressService;

@Controller
@Transactional
@RequestMapping("/before/address")
public class AddressController {
	
	@Resource
	private IAddressService addressServiceImpl;
	
	@RequestMapping("/main/findByUid")
	public @ResponseBody List findByUid(Integer uid) {
		System.out.println(222);
		return addressServiceImpl.findByUid(uid);
	}
	
	@RequestMapping("/main/delete")
	public @ResponseBody int delete(Integer aid) {
		return addressServiceImpl.delete(aid);
	}
	
	@RequestMapping("/userorder/save")
	public @ResponseBody Message save(Address address) {
		Message msg=null;
		try {
			addressServiceImpl.save(address);
			msg=new Message(true, "用户地址添加成功");
		} catch (Exception e) {
			msg=new Message(false, "用户地址添加失败"+e.toString());
		}
		return msg;
		
	}
	
	@RequestMapping("/userorder/delete")
	public @ResponseBody Message delete(int aid) {
		Message msg=null;
		try {
			addressServiceImpl.delete(aid);
			msg=new Message(true, "用户地址删除成功");
		} catch (Exception e) {
			msg=new Message(false, "用户地址删除失败"+e.toString());
		}
		return msg;
	}
	
	@RequestMapping("/userorder/update")
	public @ResponseBody Message update(Address address) {
		Message msg=null;
		try {
			addressServiceImpl.update(address);
			msg=new Message(true, "用户地址修改成功");
		} catch (Exception e) {
			msg=new Message(false, "用户地址修改失败"+e.toString());
		}
		return msg;
	}
}
