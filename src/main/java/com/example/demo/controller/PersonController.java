package com.example.demo.controller;

import com.example.demo.kafkademo.KafkaProcuder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PersonController {

    @Autowired
    KafkaProcuder procuder;

    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        procuder.send();
        return "hello controller";
    }

    // 登录页，跳转到/templates/login.html页面
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    // 首页，跳转到/templates/index.html页面
    @RequestMapping("/index")
    public String index() {
        return "index";
    }

}
