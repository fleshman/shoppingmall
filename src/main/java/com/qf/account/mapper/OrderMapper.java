package com.qf.account.mapper;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.Order;

import java.util.List;

/**
 * Created by wujiaqin on 2018/10/18.
 */
public interface OrderMapper {

    /**
     * 插入数据
     */
    public void insert(Order order)throws Exception;

    /**
     * 根据id删除数据
     */
    public void delete(Order order)throws Exception;

    /**
     * 根据id修改数据
     */
    public void update(Order order)throws Exception;

    /**
     * 根据id查找数据
     */
    public Order selectById(Order order)throws Exception;

    /**
     * 根据分页信息查找数据
     */
    public List<Order> selectByUid(JSONObject jsonobj)throws Exception;

    /**
     * 查找某一用户的订单总数
     */
    public Long selectCountByUid(JSONObject jsonobj)throws Exception;

    /**
     * 查找所有数据
     */
    public List<Order> selectAll()throws Exception;


}
