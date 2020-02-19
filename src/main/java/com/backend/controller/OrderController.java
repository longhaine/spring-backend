package com.backend.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.UserOrder;
import com.backend.service.OrderService;

@Controller
@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@PutMapping("")
	public UserOrder put(@RequestBody UserOrder order) {
		return orderService.placeOrder(order);
	}
}
