package com.qf.products.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.qf.products.mapper.ProductsMapper;
import com.qf.products.pojo.Products;
import com.qf.products.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional(isolation= Isolation.READ_COMMITTED,propagation= Propagation.REQUIRED)
public class ProductsServiceImpl implements ProductsService {
    @Autowired
    private ProductsMapper pro1;


    @Override
    @Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)

    public JSONObject findJSON(JSONObject jsonObject) throws Exception {
        List<Products> list = pro1.selectAll(jsonObject);
        int i = pro1.countUser(jsonObject);
        jsonObject.put("total", i);
        jsonObject.put("rows",list);
        return jsonObject;
    }

    @Override
    public void save(Products products) throws Exception {
            pro1.insert(products);
    }

    @Override
    public void modify(Products products) throws Exception {
            pro1.update(products);
    }

    @Override
    public void remove(Products products) throws Exception {
            pro1.delete(products);
    }

    @Override
    public List<Products> findAllProducts() throws Exception {
        List<Products> products = pro1.selectAllProducts();
        return products;
    }

    @Override
    public Products findByPid(Products products) throws Exception {
        return pro1.selectByPid(products);
    }
}
