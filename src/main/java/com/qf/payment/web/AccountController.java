package com.qf.payment.web;

import com.alibaba.fastjson.JSONObject;
import com.qf.account.pojo.User;
import com.qf.payment.pojo.Account;
import com.qf.payment.service.AccountService;
import com.qf.util.Info;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class AccountController {
    @Autowired
    private AccountService accountService;
    @RequestMapping(value = "/{path}",method = RequestMethod.GET)
    public String toPage(@PathVariable String path){

        return path;
    }
    // 交易
    @RequestMapping(value = "/transfer/{pid}/{money}",method = RequestMethod.PUT)
    @ResponseBody
    public String transfer(@PathVariable int pid,@PathVariable double money,HttpSession session) throws Exception{
        User user = (User)session.getAttribute("sessionUser");
        int id = user.getId();
        int n = accountService.transfer(id,money,pid);
        return n != 0 ? Info.SUCCESS : Info.FAIL;

    }
    // 充值
    @RequestMapping(value = "/recharge/{money}/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public String recharge(@PathVariable double money,@PathVariable int id) throws Exception{
//        User user = new User();
//        user = (User) session.getAttribute("sessionUser");
        Account account = new Account();
        account.setMoney(money);
        account.setuId(id);
        int n = accountService.recharge(account);
        return n != 0 ? Info.SUCCESS : Info.FAIL;

    }
    // 退款
    @ResponseBody
    @RequestMapping(value = "/refund/{pid}/{money}",method = RequestMethod.PUT)
    public String refund(int pid ,double money,HttpSession session)throws Exception{
        User user = (User)session.getAttribute("sessionUser");
        int id = user.getId();
        int n = accountService.refund(pid,money,id);
        return n != 0 ? Info.SUCCESS : Info.FAIL;

    }

    // 查询所有记录
    @RequestMapping(value = "/listAll",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object listAllWithJson(@RequestBody JSONObject jsonObject,HttpSession session){
        User user = (User) session.getAttribute("sessionUser");
        int uid = user.getId();
        jsonObject.put("uid",uid);
        jsonObject = accountService.listAll(jsonObject);

        return jsonObject;
    }
    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    // 删除记录
    @RequestMapping(value = "/deleteRecord/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteRecourd(@PathVariable int id){
        int n = accountService.deleteRecord(id);
        return n != 0 ? Info.SUCCESS : Info.FAIL;
    }

    @RequestMapping(value = "/payAll",method = RequestMethod.PUT)
    @ResponseBody
    public String payAll(){

        return null;
    }



}
