package com.qf.cart.mapper;

import com.alibaba.fastjson.JSONObject;
import com.qf.cart.pojo.Cart;

import java.util.List;
import java.util.Map;

public interface CartMapper {

    List<Cart> selectAll(int uid);

    Integer findTotalCount(JSONObject jo);

    List<Cart> findCartList(JSONObject jo);

    int deleteCartById(int id);

    int changeCount(int id, int count);

    int deleteAllSelected(List<Integer> ids);

    int addCartbyPid(int pid,int uid);

    Cart selectById(int pid,int uid);

    int updateCount(int pid,int uid);
}
