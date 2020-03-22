package com.backend.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.backend.entity.Role;
import com.backend.entity.User;
import com.backend.repository.RoleRepository;
import com.backend.repository.UserRepository;
import com.backend.security.CustomUserDetails;
import com.backend.security.JwtProvider;

@Service
public class UserService {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private JwtProvider jwtProvider;
	
	public User getUser(String email) {
		return userRepository.findByEmail(email);
	}
	
	public User save(User user) {
		return userRepository.save(user);
	}
	
	public Map<String, Object> signUp(User user) {
		// if user doesn't exist then
		if(getUser(user.getEmail()) == null) {
			Map<String, Object> res = new HashMap<>();
			Role customer = roleRepository.findByName("ROLE_CUSTOMER");
			user.getRoles().add(customer); // set role for user
			user.setPassword(passwordEncoder.encode(user.getPassword())); // encode password for user
			user =  userRepository.save(user); // get user after saving,
			res.put("token", jwtProvider.generateToken(user.getEmail()));
			res.put("user",getUserBasicInfo(user.getEmail()));
			return res;
		}
		else {
			throw new IllegalArgumentException("There is an user that has email "+user.getEmail());
		}
	}
	public Map<String, Object> logIn(User user){
		// if password or email is incorrect the authentication will throw bad credential exception
		// check RestResponseEntityExceptionHandler there is a handler for bad credential exception
		authenticate(user);
		//
		return generateLoginInfo(user.getEmail());
	}
	public Map<String,Object> generateLoginInfo(String email){
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("token", jwtProvider.generateToken(email));
		res.put("user",getUserBasicInfo(email));
		return res;
	}
	public Map<String, Object> getUserBasicInfo(String email){
		Map<String, Object> userBasic = new LinkedHashMap<>();
		User user = userRepository.findByEmail(email);
		userBasic.put("email", email);
		userBasic.put("fullName", user.getFullName());
		return userBasic;
	}
	public void authenticate(User user) {
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword());
		Authentication authentication = authenticationManager.authenticate(auth);
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
	}
	public void authorize(CustomUserDetails user) {
		Authentication authentication = new UsernamePasswordAuthenticationToken(user.getUsername(),null,user.getAuthorities());
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
	}
	
	public String getClientIpAddr() {  
        String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
        return ip;  
    }
}
