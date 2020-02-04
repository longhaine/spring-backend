package com.backend.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
public class RestResponseEntityExceptionHandler extends org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler{
	
	@ExceptionHandler(value = {IllegalArgumentException.class})
	public ResponseEntity<Object> handleNotFound(RuntimeException ex, WebRequest request){
		return handleExceptionInternal(ex,ex.getMessage(), new HttpHeaders(), HttpStatus.NOT_FOUND, request);
	}
}
