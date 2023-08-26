package com.example.datn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.controller"})
public class DatnApplication {

	public static void main(String[] args) {
		SpringApplication.run(DatnApplication.class, args);
	}

}
