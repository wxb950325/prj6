package com.woniu.service;

import java.util.List;

import com.woniu.entity.ProdType;

public interface IProdTypeService {
	
	public void save(ProdType prodType);
	public void delete(Integer tid);
	public void revoke(Integer tid);
	public void update(ProdType prodType);
	
	public ProdType find(Integer tid);
	public List<ProdType> findAll();
}
