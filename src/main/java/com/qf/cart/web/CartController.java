package com.qf.cart.web;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.User;
import com.qf.cart.service.CartService;
import com.qf.util.Info;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    private CartService ser;
//
//    @RequestMapping(value="/{path}",method = RequestMethod.GET)
//    public String toPage(@PathVariable String path){
//        return path;
//    }



    // 展示改用户名下购物车内所有商品列表
    @RequestMapping("/cart")
    @ResponseBody
    public JSONObject PageCartList(@RequestBody JSONObject jo,HttpSession session){
        int uid = ((User)session.getAttribute("sessionUser")).getId();

        System.out.println(jo);
        JSONObject replyJo = ser.dataJSON(jo,uid);
        return replyJo;
    }

    // 根据购物车的索引id删除购物车中的商品记录
    @ResponseBody
    @RequestMapping(value = "/deleteCart/{id}",method = RequestMethod.DELETE)
    public String DeleteCart(@PathVariable int id){
        System.out.println(id);
        int n = ser.deleteCartById(id);

        return n!=0 ? Info.SUCCESS : Info.FAIL;
    }

    // 根据前端输入框中的变化的count值来改变购物车表中的count字段值
    @ResponseBody
    @RequestMapping("/changeCount")
    public String changeCount(int id,int count){
        System.out.println(id);
        System.out.println(count);
        int n = ser.changeCount(id,count);

        return n!=0 ? Info.SUCCESS : Info.FAIL;
    }
    // 根据id来批量删除
    @ResponseBody
    @RequestMapping(value = "/deleteAllSelected", produces = "text/html;charset=UTF-8")
    public String deleteAllSelected(@RequestBody List<Integer> ids){
        System.out.println(ids);
        int n = ser.deleteAllSelected(ids);

        return n!=0 ? Info.SUCCESS : Info.FAIL;
    }

    // 根据点击事件动态改变数据库中商品的状态
    @ResponseBody
    @RequestMapping(value = "/addCart/{pid}",method = RequestMethod.POST)
    public String addCart(@PathVariable int pid, HttpSession session) throws Exception {
        User sessionUser = (User) session.getAttribute("sessionUser");
        int n = ser.addCartbyPid(pid,sessionUser.getId());
        if(n==0){
            return Info.FAIL;
        }
        return Info.SUCCESS;
    }
}
