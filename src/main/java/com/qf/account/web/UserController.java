package com.qf.account.web;

import com.qf.account.pojo.User;
import com.qf.account.service.UserSerice;
import com.qf.payment.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserSerice service;
    @Autowired
    private BalanceService balanceService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("/orderMessage")
    public String showOrderMessage(){
        return "orderMessage";
    }

    @RequestMapping("/adminLogin")
    public String toAdminLogin(){
        return "adminLogin";
    }

    /**
     * 普通用户登录验证方法
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
    @ResponseBody
    public String login(User user, HttpSession session) throws Exception {
        //传递业务
        User findUser = service.findByName(user);

        //对比前端user和查询获取的user中的password是否相同
        if(findUser!=null && user.getPassword().equals(findUser.getPassword())){
            //登录成功
            session.setAttribute("sessionUser", findUser);
            return "ok";
        }
        return "fail";
    }

    /**
     * 管理员登录验证方法
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/adminLoginCheck", method = RequestMethod.GET)
    @ResponseBody
    public String adminLogin(User user, HttpSession session) throws Exception {
        //传递业务
        User findUser = service.findByName(user);

        //对比前端user和查询获取的user中的password是否相同
        if(findUser!=null && findUser.getIsadmin()==1 && user.getPassword().equals(findUser.getPassword())){
            //登录成功
            session.setAttribute("sessionUser", findUser);
            return "ok";
        }
        return "fail";
    }


    /**
     * 用户注册方法
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(User user, HttpSession session) throws Exception {
        user.setIsadmin(0);
        try{
            //传递业务
            service.save(user);
        }catch(Exception e){
            //注册失败
            e.printStackTrace();
            return "fail";
        }
        //登录成功
        if(user.getId()!=null){
            session.setAttribute("sessionUser", user);
            balanceService.createBalance(user.getId());

        }else{
            System.out.println("获取数据库自增主键失败...");
        }
        return "ok";
    }

    /**
     * 用户注册方法
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/adminRegister", method = RequestMethod.POST)
    @ResponseBody
    public String adminRegister(User user, HttpSession session) throws Exception {
        user.setIsadmin(1);
        try{
            //传递业务
            service.save(user);
        }catch(Exception e){
            //注册失败
            e.printStackTrace();
            return "fail";
        }
        //登录成功
        if(user.getId()!=null){
            balanceService.createBalance(user.getId());

            session.setAttribute("sessionUser", user);
        }else{
            System.out.println("获取数据库自增主键失败...");
        }
        return "ok";
    }

    /**
     * 展示个人信息方法
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/showUserMessage")
    public String showUserMessage(Model model, HttpSession session) throws Exception {
        User user = (User)session.getAttribute("sessionUser");
        model.addAttribute(user);
        return "userMessage";
    }

    /**
     * 登录验证方法
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/modifyUserMessage")
    @ResponseBody
    public String modifyUserMessage(User user, HttpSession session) throws Exception {
        System.out.println(user);
        try{
            //传递业务
            service.modify(user);
        }catch(Exception e){
            //修改失败
            e.printStackTrace();
            return "fail";
        }
        session.setAttribute("sessionUser",user);
        return "ok";
    }

    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.invalidate();
        return "login";
    }

}
