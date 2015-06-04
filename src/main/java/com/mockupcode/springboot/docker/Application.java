package com.mockupcode.springboot.docker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 *
 * @author Jirawong Wongdokpuang <greannetwork@gmail.com>
 */
@SpringBootApplication
@ComponentScan("com.mockupcode.springboot.docker")
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
