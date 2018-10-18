package com.qf.cart.web;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.User;
import com.qf.cart.service.CartService;
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

    @RequestMapping(value="/cartlist",method = RequestMethod.GET)
    public String toCartListPage(){
        return "cartlist";
    }

    @RequestMapping("/cart")
    @ResponseBody
    public JSONObject PageCartList(@RequestBody JSONObject jo){
        int uid = 1;
        //System.out.println(jo);
        JSONObject replyJo = ser.dataJSON(jo,uid);
        return replyJo;
    }

    @RequestMapping("/deleteCart")
    public String DeleteCart(int id){
        System.out.println(id);
        ser.deleteCartById(id);
        return "cart2";
    }

    @RequestMapping("/changeCount")
    public String changeCount(int id,int count){
        System.out.println(id);
        System.out.println(count);
        ser.changeCount(id,count);
        return "cartlist";
    }
    @ResponseBody
    @RequestMapping(value = "/deleteAllSelected", produces = "text/html;charset=UTF-8")
    public String deleteAllSelected(@RequestBody List<Integer> ids){
        System.out.println(ids);
        ser.deleteAllSelected(ids);
        return "删除成功！";
    }

    @ResponseBody
    @RequestMapping(value = "/addCart/{pid}",method = RequestMethod.POST)
    public String addCart(@PathVariable int pid, HttpSession session){
        User sessionUser = (User) session.getAttribute("sessionUser");
        ser.addCartbyPid(pid,sessionUser.getId());
        return "success";
    }
}
