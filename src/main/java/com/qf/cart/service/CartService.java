package com.qf.cart.service;

import com.alibaba.fastjson.JSONObject;
import com.qf.cart.mapper.CartMapper;
import com.qf.cart.pojo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CartService {

    List<Cart> findAll(int id);

    JSONObject dataJSON(JSONObject jo, int uid);

    int deleteCartById(int id);

    int changeCount(int id, int count);

    int deleteAllSelected(List<Integer> ids);

    int addCartbyPid(int pid,int uid) throws Exception;
}
