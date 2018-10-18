package com.qf.account.web;

import com.qf.account.pojo.User;
import com.qf.account.service.UserSerice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class  UserController {

    @Autowired
    private UserSerice service;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    /**
     * 登录验证方法
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/user/loginCheck", method = RequestMethod.GET)
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
     * 用户注册方法
     * @param user
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(User user, HttpSession session) throws Exception {
        System.out.println(user);
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
        }else{
            System.out.println("获取数据库自增主键失败...");
        }
        return "ok";
    }


}
