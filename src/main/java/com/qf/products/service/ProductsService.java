package com.qf.products.service;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.User;
import com.qf.products.pojo.Products;

import java.util.List;

public interface ProductsService {
    /**
     *
     * @param jsonObject
     * @return 返回通过uid查询并分页的商品集合
     * @throws Exception
     */
    public JSONObject findJSON(JSONObject jsonObject)throws Exception;

    /**
     * 添加商品
     * @param products
     * @throws Exception
     */
    public void save(Products products) throws Exception;

    /**
     * 修改商品
     * @param products
     * @throws Exception
     */
    public void modify(Products products) throws Exception;

    /**
     * 删除商品
     * @param products
     * @throws Exception
     */
    public void remove(Products products) throws Exception;

}
