package com.rui.controller;

import com.rui.model.UserEntity;
import com.rui.reposity.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by root on 16-8-3.
 */
@Controller
public class MainController {
    //自动装配数据库接口
    @Autowired
    UserRepository userRepository;

    //这里直接重定向到index.jsp文件
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "index";
    }

    //获取用户
    @RequestMapping(value = "/admin/users",method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap){
        //查找数据库中的所有用户列表
        List<UserEntity> userList=userRepository.findAll();
        //将记录存在userList中，并传回到前端页面
        modelMap.addAttribute("userList",userList);
        return "users";
    }

    //添加用户
    @RequestMapping(value = "/admin/addUser",method = RequestMethod.GET)
    public String addUser(){
        return "/addUser";
    }

    @RequestMapping(value = "/admin/addP",method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user")UserEntity userEntity){
        //post请求传递的是一个UserEntity对象
        //通过@ModelAttribute()注解可以过去传递过来的user参数
        //save 和 saveAndFlush的区别
        userRepository.saveAndFlush(userEntity);
        //这里重定位到/admin/users
        return "redirect:/admin/users";
    }

    //查看用户详情
    //@PathVariable可以收集url中的变量，需匹配的变量用{}包括
    @RequestMapping(value = "/show/{id}",method = RequestMethod.GET)
    public String showUser(@PathVariable("id")Integer userId,ModelMap modelMap){
        UserEntity userEntity=userRepository.findOne(userId);

        //传递给请求页面
        modelMap.addAttribute("user",userEntity);
        return "userDetail";
    }

    //更新用户信息页面
    @RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String updateUser(@PathVariable("id")Integer userId,ModelMap modelMap){
        UserEntity userEntity=userRepository.findOne(userId);
        //传递给请求页面
        modelMap.addAttribute("user",userEntity);
        return "UpdateUser";
    }

    //更新用户信息操作
    @RequestMapping(value = "/admin/updateP",method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("userP")UserEntity user){
        //更新用户信息
        userRepository.updateUser(user.getNickname(),user.getFirstname(),user.getLastname(),user.getPassword(),user.getIduser());
        userRepository.flush();
        return "redirect:/admin/users";
    }

    //删除用户操作
    @RequestMapping(value = "/delete/{userId}",method = RequestMethod.GET)
    public String deleteUser(@ModelAttribute("userId")Integer userId){
        userRepository.delete(userId);
        userRepository.flush();
        return "redirect:/admin/users";
    }
}
