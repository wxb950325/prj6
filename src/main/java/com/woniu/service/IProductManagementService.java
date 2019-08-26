package com.woniu.service;

import java.util.List;

import com.woniu.entity.Product;

public interface IProductManagementService {
       public List<Product> findAll();
       public void  audit(Integer pid);
       public void  revoke(Integer pid);
       
}
