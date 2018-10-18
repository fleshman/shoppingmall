package com.qf.account.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.mapper.OrderMapper;
import com.qf.account.pojo.Order;
import com.qf.account.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wujiaqin on 2018/10/18.
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper mapper;

    @Override
    public void save(Order order) throws Exception {
        mapper.insert(order);
    }

    @Override
    public void remove(Order order) throws Exception {
        mapper.delete(order);
    }

    @Override
    public void modify(Order order) throws Exception {
        mapper.update(order);
    }

    @Override
    @Transactional(readOnly = true)
    public Order findById(Order order) throws Exception {
        return mapper.selectById(order);
    }

    /**
     *
     * @param jsonobj
     * @return JSONObject
     * @throws Exception
     */
    @Override
    @Transactional(readOnly = true)
    public JSONObject findByUid(JSONObject jsonobj) throws Exception {
        //将查询获得的Order集合转化为Order数组
        List<Order> list = mapper.selectByUid(jsonobj);
//        Order[] orders = list.toArray(new Order[list.size()]);

        //查询登录用户的所有订单数
        Long count = mapper.selectCountByUid(jsonobj);

        //封装格式为{total:98,rows:[{},{}]}的 JSONObject 并返回
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("total", count);
        jsonObject.put("rows", list);
        return jsonObject;

    }

    @Override
    @Transactional(readOnly = true)
    public List<Order> findAll() throws Exception {
        return mapper.selectAll();
    }
}
