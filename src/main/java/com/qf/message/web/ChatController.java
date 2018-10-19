package com.qf.message.web;

import com.qf.account.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class ChatController {


    //通用用户功能
   /* @RequestMapping("/login")
    public String login(String name, String password, HttpSession session) {
        User user = userService.login(name,password);
        if ( user != null)
        {
            session.setAttribute("username", name);
            return "chatroom";
        }
        else
            return "/login";
    }*/

    @RequestMapping("/chat1")
    public String chat1(HttpSession session) {
        User user = (User)session.getAttribute("sessionUser");
        session.setAttribute("username", user.getUsername());
        return "chatroom";

    }

    @RequestMapping("/chat2")
    public String chat2(HttpSession session) {
        session.setAttribute("username", "卖家");
        return "chatroom";

    }

}
