package com.qf.products.mapper;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.User;
import com.qf.products.pojo.Products;
import org.springframework.stereotype.Controller;

import java.util.List;

public interface ProductsMapper {
    //获取商品集合
    public List<Products> selectAll(JSONObject jsonObject) throws Exception;

    //获取商品数量
    public int countUser(JSONObject jsonObject)throws Exception;

    //增加商品
    public void insert(Products products) throws Exception;

    //删除商品
    public void delete(Products products) throws Exception;

    //更新商品
    public void update(Products products) throws Exception;

    int selectId(int pid);
}
