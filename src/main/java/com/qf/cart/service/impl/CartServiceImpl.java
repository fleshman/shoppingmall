package com.qf.cart.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.qf.cart.mapper.CartMapper;
import com.qf.cart.pojo.Cart;
import com.qf.cart.pojo.Product;
import com.qf.cart.service.CartService;
import com.qf.products.mapper.ProductsMapper;
import com.qf.products.pojo.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper mapper;
    @Autowired
    private ProductsMapper productsMapper;

    @Override
    @Transactional(readOnly = true)
    public List<Cart> findAll(int id) {
        return mapper.selectAll(id);
    }

    @Override
    @Transactional(readOnly = true)
    public JSONObject dataJSON(JSONObject jo,int uid) {
        jo.put("uid",uid);
        Integer totalCount = mapper.findTotalCount(jo);
        List<Cart> cartList = mapper.findCartList(jo);

        JSONObject replyJo = new JSONObject();
        replyJo.put("total",totalCount);
        replyJo.put("rows",cartList);

        System.out.println(totalCount);
        System.out.println(cartList);
        System.out.println(cartList.get(0).getP().getPdesc());

        return replyJo;
    }

    @Override
    public void deleteCartById(int id) {
        mapper.deleteCartById(id);
    }

    @Override
    public void changeCount(int id, int count) {
       /* HashMap<Object, Object> map = new HashMap<>();
        map.put("count",count);
        map.put("id",id);*/
        mapper.changeCount(id, count);
    }

    @Override
    public void deleteAllSelected(List<Integer> ids) {
        mapper.deleteAllSelected(ids);
    }

    @Override
    public int addCartbyPid(int pid,int uid) throws Exception {
        Products products = new Products();
        products.setPid(pid);

        int n = productsMapper.selectByPid(products).getPqty();
        if (n > 0) {
            Cart cart = mapper.selectById(pid, uid);
            if (cart != null) {
                mapper.updateCount(pid, uid);
                return 1;

            } else {

                mapper.addCartbyPid(pid, uid);
                return 1;
            }
        } else {
            return 0;
        }


    }
}
