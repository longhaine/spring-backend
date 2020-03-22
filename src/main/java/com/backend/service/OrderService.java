package com.backend.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.backend.entity.Cart;
import com.backend.entity.OptionWithSize;
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
	
	@Autowired
	private OptionWithSizeService optionWithSizeService;
	
	public List<UserOrder> get(){
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		return orderRepository.findByUser(user);
	}
	
	@Transactional(rollbackOn = Exception.class)
	public UserOrder placeOrder(UserOrder order) {
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		List<Cart> cartList = cartRepository.getCartsByUser(user);
		order = save(order, user);
		order.setOrderDetails(saveOrderDetails(cartList, order));
		cartRepository.deleteAllCartsByUser(user);
		return order;
	}
	public UserOrder save(UserOrder order, User user) {
		String date = getDate();
		int orderNumber = Math.abs((user.getEmail()+ System.currentTimeMillis()).hashCode());
		order.setOrderNumber(orderNumber);
		order.setDate(date);
		order.setUser(user);
		order.setStatus("Processing");
		return orderRepository.save(order);
	}
	public List<UserOrderDetail> saveOrderDetails(List<Cart> cartList, UserOrder order) {
		List<UserOrderDetail> details = new LinkedList<UserOrderDetail>();
		float totalPrice = 0;
		int length = cartList.size();
		if(length == 0 ) {
			throw new IllegalArgumentException();
		}
		for(int i = 0 ; i < length ; i++) {
			Cart cart = cartList.get(i);
			UserOrderDetail orderDetail = new UserOrderDetail();
			//recalculate quantity of user can order that item based on quantity of option with size left
			int quantityCanOrder = calculateQuantitySize(cart);
			//recalculate price after get quantity User can Order based on quantity of option with size left
			float price = quantityCanOrder * cart.getOptionWithSize().getProductOption().getPrice();
			orderDetail.setQuantity(quantityCanOrder);
			orderDetail.setOrder(order);
			orderDetail.setPrice(price);
			orderDetail.setOptionWithSize(cart.getOptionWithSize());
			details.add(orderDetailRepository.save(orderDetail)); // save and add to list
			totalPrice = totalPrice + price;
		}
		updateTotalPrice(order, totalPrice);
		return details;
	}
	public int calculateQuantitySize(Cart cart){
		int cartQuantity = cart.getQuantity();
		OptionWithSize optionWithSize = cart.getOptionWithSize();
		int optionWithSizeQuantityLeft = optionWithSize.getQuantity();
		int sizeQuantityAfterCalc = optionWithSizeQuantityLeft - cartQuantity;
		if(sizeQuantityAfterCalc >= 0)
		{
			optionWithSizeService.updateQuantityLeft(cart.getOptionWithSize(),sizeQuantityAfterCalc);
			return cartQuantity;
		}
		else {
			optionWithSizeService.updateQuantityLeft(cart.getOptionWithSize(),0);
			return optionWithSizeQuantityLeft; // because you cannot place order the number of quantity over number of quantity left
		}
	}
	public void updateTotalPrice(UserOrder order,float totalPrice) {
		if(totalPrice < 100) { totalPrice = totalPrice + 5; order.setShipping(5);}
		else { order.setShipping(0);}
		order.setPrice(totalPrice);
		orderRepository.save(order);
	}
	public String getDate() {
		Date date = new Date();
		SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MMM-yyyy");
		return dateFormatter.format(date).replaceAll("-", " ");
	}
}
