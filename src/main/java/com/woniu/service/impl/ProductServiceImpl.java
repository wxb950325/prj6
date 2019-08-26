package com.woniu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.entity.PageBean;
import com.woniu.entity.Product;
import com.woniu.mapper.ProductMapper;
import com.woniu.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService {
	  
	@Resource
	private ProductMapper productMapper;
	
	@Override
	@Transactional
	public void save(Product product) {
		// 插入Product
		product.setIsdelete(0);
		product.setIsaudit(0);
		productMapper.insertSelective(product);
	}
  
	@Override
	public void delete(Integer pid) {
		// TODO Auto-generated method stub
		Product p = productMapper.selectByPrimaryKey(pid);
		Integer isdelete = p.getIsdelete();
		int tempInt = 0;
		if(isdelete==0) {
			tempInt=1;
		}else {
			tempInt=0;
		}
		p.setIsdelete(tempInt);
		productMapper.updateByPrimaryKeySelective(p);
	}

	@Override
	public void revoke(Integer pid) {
		// TODO Auto-generated method stub
		Product p = productMapper.selectByPrimaryKey(pid);
		Integer isdelete = p.getIsdelete();
		int tempInt = 0;
		if(isdelete==1) {
			tempInt=0;
		}else {
			tempInt=1;
		}
		p.setIsdelete(tempInt);
		productMapper.updateByPrimaryKeySelective(p);
	}

	@Override
	public void update(Product product) {
		// TODO Auto-generated method stub
		productMapper.updateByPrimaryKeySelective(product);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Product> findAll2Seller(PageBean pagebean) {
		
		List list = productMapper.selectByExample(null,new RowBounds(pagebean.getOffset(), pagebean.getLimit()));
		int count = productMapper.countByExample(null);
		pagebean.setCount(count);
		
		return list;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Product> findAll2buyers() {
		// TODO Auto-generated method stub
		return productMapper.findAll2buyers();
		
	}
  
	@Override
	public Product find(Integer pid) {
		// TODO Auto-generated method stub
		return productMapper.selectByPrimaryKey(pid);
	}

	@Override
	public List<Product> find() {
		// TODO Auto-generated method stub
		return productMapper.selectByExample(null);
	}


}
