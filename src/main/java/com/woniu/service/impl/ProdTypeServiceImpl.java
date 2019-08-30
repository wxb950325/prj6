package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.woniu.entity.PageBean;
import com.woniu.entity.ProdType;
import com.woniu.mapper.ProdTypeMapper;
import com.woniu.service.IProdTypeService;
@Service
public class ProdTypeServiceImpl implements IProdTypeService {
	@Resource
	private ProdTypeMapper prodTypeMapper;

	@Override
	public void save(ProdType prodType) {
		prodTypeMapper.insertSelective(prodType);
	}

	@Override
	public void delete(Integer tid) {
		ProdType prodType = prodTypeMapper.selectByPrimaryKey(tid);
		int i = prodType.getIsdelete();
		if(i==1) {
			i=0;
		}else {i=1;}
		prodType.setIsdelete(i);
		prodTypeMapper.updateByPrimaryKey(prodType);
	}

	@Override
	public void revoke(Integer tid) {
		ProdType prodType = prodTypeMapper.selectByPrimaryKey(tid);
		prodType.setIsdelete(0);
		prodTypeMapper.insertSelective(prodType);
	}

	@Override
	public void update(ProdType prodType) {
		prodTypeMapper.updateByPrimaryKeySelective(prodType);
	}

	@Override
	public ProdType find(Integer tid) {
		return prodTypeMapper.selectByPrimaryKey(tid);
	}

	@Override
	public List<ProdType> findAll(PageBean pageBean) {
		List<ProdType> list = prodTypeMapper.selectByExample(null,new RowBounds(pageBean.getOffset(), pageBean.getLimit()));
		int count = prodTypeMapper.countByExample(null);
		pageBean.setCount(count);
		return list;
	}

	@Override
	public void deleteBatch(Integer[] tids) {
		prodTypeMapper.deleteBatch(tids);
	}

	@Override
	public List<ProdType> findAll2Before() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
