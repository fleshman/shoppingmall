package com.qf.cart.cart.mapper;

import com.alibaba.fastjson.JSONObject;
import com.qf.cart.pojo.Cart;

import java.util.List;

public interface CartMapper {

    List<Cart> selectAll(int uid);

    Integer findTotalCount(JSONObject jo);

    List<Cart> findCartList(JSONObject jo);

    void deleteCartById(int id);

    void changeCount(int id, int count);

    void deleteAllSelected(List<Integer> ids);

    void addCartbyPid(int pid);
}
