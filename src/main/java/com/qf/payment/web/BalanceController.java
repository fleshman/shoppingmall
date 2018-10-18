package com.qf.payment.web;

import com.qf.account.pojo.User;
import com.qf.payment.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.reflect.generics.tree.VoidDescriptor;

import javax.servlet.http.HttpSession;

@Controller
public class BalanceController {
    @Autowired
    private BalanceService balanceService;
    @RequestMapping(value = "/selectBalance",method = RequestMethod.GET)
    @ResponseBody
    public String selectBalance(HttpSession session){
        int id = ((User)session.getAttribute("sessionUser")).getId();
        double n = balanceService.selectBalance(id);

        return Double.toString(n);
    }
}
