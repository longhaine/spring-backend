package com.backend.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Optional;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.User;
import com.backend.entity.UserForget;
import com.backend.repository.UserForgetRepository;

@Service
public class UserForgetService {
	
	@Autowired
	private UserForgetRepository userForgetRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MailService mailService;
	
	private ThreadPoolExecutor excutor = new ThreadPoolExecutor(10, 10, 1, TimeUnit.SECONDS, new LinkedBlockingQueue<>());
	private String client = "http://localhost:4200/reset/";
	public boolean sendResetLink(String email) {
		User user = userService.getUser(email);
		if(user != null) {
			excutor.execute(new Runnable() {
				@Override
				public void run() {
					try {
						String hashedPath = generatePath(email);
						String resetLink = client + hashedPath;
						Optional<UserForget> forgetOpt = findByUserEmail(email);
						UserForget forget;
						if(forgetOpt.isPresent()) {
							forget = forgetOpt.get();
						}
						else {
							forget = new UserForget();
							forget.setUser(user);
						}
						forget.setPath(hashedPath);
						userForgetRepository.save(forget);
						mailService.sendLink(resetLink, email,user.getFullName(), "resetPassword");
					}
					catch(Exception ex){
						System.out.println(ex.getMessage());
					}
				}
			});
			return true;
		}
		else {
			return false;
		}
	}
	public boolean checkResetLink(String hashedPath) {
		return userForgetRepository.findByPath(hashedPath).isPresent();
	}
	public String generatePath(String email) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("MD5");
		String input = email + "reset" + IssueAt();
		byte[] messageDigest = md.digest(input.getBytes());
		BigInteger no = new BigInteger(1,messageDigest);
		return no.toString();
	}
	public boolean checkEmail(String email) {
		if(userService.getUser(email) == null) {
			return false;
		}
		return true;
	}
	public Optional<UserForget> findByPath(String hashedPath){
		return userForgetRepository.findByPath(hashedPath);
	}
	public void delete(UserForget forget) {
		userForgetRepository.delete(forget);
	}
	public Optional<UserForget> findByUserEmail(String email){
		return userForgetRepository.findByUserEmail(email);
	}
	public String IssueAt() {
		return new Date().toString();
	}
}
