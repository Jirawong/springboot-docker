package com.mockupcode.springboot.docker.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Jirawong Wongdokpuang <greannetwork@gmail.com>
 */
@RestController
public class HelloWorldController {
    
    @RequestMapping(value = "/")
    public String index(){
        return "hello,world";
    }
    
}
