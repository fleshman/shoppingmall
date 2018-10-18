package com.qf.account.service;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.Order;

import java.util.List;

/**
 * Created by wujiaqin on 2018/10/18.
 */
public interface OrderService {

    /**
     * 插入数据
     */
    public void save(Order order)throws Exception;

    /**
     * 根据id删除数据
     */
    public void remove(Order order)throws Exception;

    /**
     * 根据id修改数据
     */
    public void modify(Order order)throws Exception;

    /**
     * 根据id查找数据
     */
    public Order findById(Order order)throws Exception;

    /**
     * 根据分页信息查找数据
     */
    public JSONObject findByUid(JSONObject jsonobj)throws Exception;

    /**
     * 查找所有数据
     */
    public List<Order> findAll()throws Exception;
}
