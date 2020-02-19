package com.backend.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;


@ControllerAdvice
public class CustomResponseException extends ResponseEntityExceptionHandler implements AuthenticationEntryPoint{
	
	@ExceptionHandler(value = {IllegalArgumentException.class})
	public ResponseEntity<Object> handleNotFound(RuntimeException ex, WebRequest request){
		Map<String,Object> body = new HashMap<String, Object>();
		body.put("status",404);
		body.put("message",ex.getMessage());
		return handleExceptionInternal(ex,body, new HttpHeaders(), HttpStatus.NOT_FOUND, request);
	}
	@ExceptionHandler(value = {BadCredentialsException.class})
	public ResponseEntity<Object> handle401(RuntimeException ex, WebRequest request){
		Map<String,Object> body = new HashMap<String, Object>();
		body.put("status",401);
		body.put("message",ex.getMessage());
		return handleExceptionInternal(ex,body, new HttpHeaders(), HttpStatus.UNAUTHORIZED, request);
	}
	@ExceptionHandler(value = {AccessDeniedException.class})
	public ResponseEntity<Object> handleAccessDeniedException(RuntimeException ex, WebRequest request){
		Map<String,Object> hashMap = new HashMap<String, Object>();
		hashMap.put("status",403);
		hashMap.put("message",ex.getMessage());
		return handleExceptionInternal(ex,hashMap, new HttpHeaders(), HttpStatus.FORBIDDEN, request);
	}
	
	@Override
	public void commence(HttpServletRequest req, HttpServletResponse res, AuthenticationException ex)
			throws IOException, ServletException {
		res.setContentType("application/json");
		res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		res.getOutputStream().println("{ \"message\": \"" + ex.getMessage() + "\" }");
	
	}
}
