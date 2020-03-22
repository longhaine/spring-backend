package com.backend.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.User;
import com.backend.entity.UserForget;
import com.backend.service.UserForgetService;
import com.backend.service.UserService;

@Controller
@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserForgetService userForgetService;
	
	String regex = "^(.+)@(.+)$";
	Pattern pattern = Pattern.compile(regex);
	
	@Autowired
	PasswordEncoder passwordEncoder;
	@PostMapping("/signup")
	public Map<String, Object> signUp(@RequestBody User user) {
		try {
			user = new User(user.getEmail(),user.getPassword(),user.getFullName());
			return userService.signUp(user);
		}catch(Exception ex) {
			throw ex;
		}
	}
	@PostMapping("/login")
	public Map<String, Object> logIn(@RequestBody User user){
		return userService.logIn(user);

	}
	@PreAuthorize("#email == authentication.principal.username")
	@GetMapping("/info/{email}")
	public Map<String, Object> info(@PathVariable String email){
		try {
			SecurityContext securityContext = SecurityContextHolder.getContext();
			return userService.getUserBasicInfo(email);
		}
		catch(Exception ex) {
			throw ex;
		}
	}
	
	@PostMapping("/update")
	public Map<String, Object> update(@RequestBody User userNewInfo){
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			if(userNewInfo.getEmail() == null || !pattern.matcher(userNewInfo.getEmail()).matches()) {
				throw new IllegalArgumentException("Unacceptable email!");
			}
			User userOldInfo = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
			userOldInfo.setEmail(userNewInfo.getEmail());
			userOldInfo.setFullName(userNewInfo.getFullName());
			// if user didn't leave a plain text at password input
			if(userNewInfo.getPassword().length() > 0) {
				userOldInfo.setPassword(passwordEncoder.encode(userNewInfo.getPassword()));
			}
			userNewInfo = userService.save(userOldInfo);
			res.put("email", userNewInfo.getEmail());
			res.put("fullName", userNewInfo.getFullName());
		}
		catch(Exception ex){
			throw ex;
		}
		return res;
	}
	
	@PostMapping("/reset-password/{hashedPath}")
	public Map<String,Object> resetPassword(@PathVariable String hashedPath,@RequestBody Map<String, String> payload) {
		Optional<UserForget> forgetOpt = userForgetService.findByPath(hashedPath);
		if(forgetOpt.isPresent()) {
			UserForget forget = forgetOpt.get();
			User user = forget.getUser();
			String password = payload.get("password");
			user.setPassword(passwordEncoder.encode(password));
			userForgetService.delete(forget);
			return userService.generateLoginInfo(user.getEmail());
		}
		else {
			throw new IllegalArgumentException();
		}
	}
}
