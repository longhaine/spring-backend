package com.backend.service;

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
import com.backend.security.JwtProvider;

@Service
public class UserService {
	
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
	public User signUp(User user) {
		// if user doesn't exist then
		if(getUser(user.getEmail()) == null) {
			Role customer = roleRepository.findByName("customer");
			user.getRoles().add(customer); // set role for user
			user.setPassword(passwordEncoder.encode(user.getPassword())); // encode password for user
			return userRepository.save(user);
		}
		else {
			throw new IllegalArgumentException("There is an user that has email "+user.getEmail());
		}
	}
	public String logIn(User user) {
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword());
		Authentication authentication = authenticationManager.authenticate(auth); // magic's inside this
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);// magic fire here
		if(authentication.isAuthenticated()) {
			return jwtProvider.generateToken(authentication.getName());
		}
		else {
			throw new IllegalArgumentException("error!");
		}
	}
}
