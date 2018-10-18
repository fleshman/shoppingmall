package com.qf.cart.cart.service;

import com.alibaba.fastjson.JSONObject;
import com.qf.cart.pojo.Cart;

import java.util.List;

public interface CartService {

    public List<Cart> findAll(int id);

    JSONObject dataJSON(JSONObject jo, int uid);

    void deleteCartById(int id);

    void changeCount(int id, int count);

    void deleteAllSelected(List<Integer> ids);

    void addCartbyPid(int pid);
}
