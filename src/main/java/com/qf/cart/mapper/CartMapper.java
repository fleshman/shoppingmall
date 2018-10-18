package com.qf.cart.mapper;

import com.alibaba.fastjson.JSONObject;
import com.qf.cart.pojo.Cart;

import java.util.List;
import java.util.Map;

public interface CartMapper {

    List<Cart> selectAll(int uid);

    Integer findTotalCount(JSONObject jo);

    List<Cart> findCartList(JSONObject jo);

    void deleteCartById(int id);

    void changeCount(int id, int count);

    void deleteAllSelected(List<Integer> ids);

    void addCartbyPid(int pid,int uid);

    Cart selectById(int pid,int uid);

    int updateCount(int pid,int uid);
}
