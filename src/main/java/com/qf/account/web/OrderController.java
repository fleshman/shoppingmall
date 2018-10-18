package com.qf.account.web;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.Order;
import com.qf.account.pojo.User;
import com.qf.account.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by wujiaqin on 2018/10/18.
 */
@Controller
public class OrderController {

    @Autowired
    private OrderService service;

    /**
     * 展示登录用户的所有订单信息（根据前端传来数据进行分页）
     * @param jsonobj
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/showPageOrders",method= RequestMethod.POST,produces="application/json;charset=utf-8")
    @ResponseBody
    public Object showPageOrders(@RequestBody JSONObject jsonobj, HttpSession session) throws Exception{
        //将登录用户的uid封装到同一个JSONObject中，并传到service层
        Integer uid = ((User)session.getAttribute("sessionUser")).getId();
        jsonobj.put("uid",uid);
        jsonobj = service.findByUid(jsonobj);
        return jsonobj;
    }

    @RequestMapping("/deleteOrder")
    @ResponseBody
    public String deleteOrder(Order order){
        System.out.println(order);
        try{
            //传递业务
            service.remove(order);
        }catch(Exception e){
            //修改失败
            e.printStackTrace();
            return "fail";
        }
        return "ok";
    }
}
