package com.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.User;
import com.backend.service.UserService;

@Controller
@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/signup")
	public User signUp(@RequestBody User user) {
		try {
			user = new User(user.getEmail(),user.getPassword());
			user =  userService.signUp(user);
		}catch(Exception ex) {
			throw ex;
		}
		return user;
	}
	@PostMapping("/login")
	public String logIn(@RequestBody User user) {
		return userService.logIn(user);
	}
}
