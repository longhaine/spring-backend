package com.backend.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.backend.entity.Cart;
import com.backend.entity.User;
import com.backend.entity.UserOrder;
import com.backend.entity.UserOrderDetail;
import com.backend.repository.CartRepository;
import com.backend.repository.OrderDetailRepository;
import com.backend.repository.OrderRepository;
import com.backend.repository.UserRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	@Transactional(rollbackOn = Exception.class)
	public UserOrder placeOrder(UserOrder order) {
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		List<Cart> cartList = cartRepository.findByUser(user);
		order = save(order, user);
		saveOrderDetails(cartList, order);
		cartRepository.deleteAllCartsByUser(user);
		return order;
	}
	public UserOrder save(UserOrder order, User user) {
		String date = getDate();
		int orderNumber = Math.abs((user.getEmail()+ System.currentTimeMillis()).hashCode());
		order.setOrderNumber(orderNumber);
		order.setDate(date);
		order.setUser(user);
		return orderRepository.save(order);
	}
	public void saveOrderDetails(List<Cart> cartList, UserOrder order) {
		int length = cartList.size();
		if(length == 0 ) {
			throw new IllegalArgumentException();
		}
		for(int i = 0 ; i < length ; i++) {
			Cart cart = cartList.get(i);
			UserOrderDetail orderDetail = new UserOrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(cart.getPrice());
			orderDetail.setProductOption(cart.getProductOption());
			orderDetail.setQuantity(cart.getQuantity());
			orderDetailRepository.save(orderDetail);
		}
	}
	public String getDate() {
		Date date = new Date();
		SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MMM-yyyy");
		return dateFormatter.format(date).replaceAll("-", " ");
	}
}
