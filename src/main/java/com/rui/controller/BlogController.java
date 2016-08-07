package com.rui.controller;

import com.rui.model.BlogEntity;
import com.rui.model.UserEntity;
import com.rui.reposity.BlogRepository;
import com.rui.reposity.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by root on 16-8-7.
 */
@Controller
public class BlogController {
    @Autowired
    BlogRepository blogRepository;

    @Autowired
    UserRepository userRepository;

    //查看所有博客
    @RequestMapping(value = "/admin/blogs",method = RequestMethod.GET)
    public String showBlogs(ModelMap modelMap){
        List<BlogEntity> blogList=blogRepository.findAll();
        modelMap.addAttribute("blogList",blogList);
        return "blogs";
    }

    //添加博文
    @RequestMapping(value = "/addBlogs",method = RequestMethod.GET)
    public String addBlog(ModelMap modelMap){
        System.out.println("排查问题1");
        List<UserEntity> userList=userRepository.findAll();
        modelMap.addAttribute("userList",userList);
        return "addBlogs";
    }

    //添加博文，使用post方式进行提交，然后进行重定向
    @RequestMapping(value = "/admin/addBlogsP",method = RequestMethod.POST)
    public String addBlogPost(@ModelAttribute("blog")BlogEntity blogEntity){
        System.out.println("是否能够提交");
        System.out.println(blogEntity.getTitle());
        System.out.println(blogEntity.getUserByUserId().getIduser());
        blogRepository.saveAndFlush(blogEntity);
        return "redirect:/admin/blogs";
    }
}
