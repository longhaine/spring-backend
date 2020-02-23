package com.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Cart;
import com.backend.entity.OptionWithSize;
import com.backend.entity.User;
import com.backend.repository.CartRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;
	
	public List<Cart> getCartsBySessionId(String sessionId){
		return cartRepository.findBySessionId(sessionId);
	}
	public List<Cart> getCartsByUser(User user){
		return cartRepository.getCartsByUser(user);
	}
	public Cart save(Cart cart) {
		return cartRepository.save(cart);
	}
	public void delete(Cart cart) {
		cartRepository.delete(cart);
	}
	public Cart getCartByGuest(OptionWithSize optionWithSize, String sessionId) {
		return cartRepository.findByOptionWithSizeAndSessionId(optionWithSize, sessionId);
	}
	public Cart getCartByUser(OptionWithSize optionWithSize,User user) {
		return cartRepository.findByOptionWithSizeAndUser(optionWithSize, user);
	}
	public Cart getCartByIdAndIp(int id, String ip) {
		return cartRepository.findByIdAndSessionId(id, ip);
	}
	public Cart getCartByIdAndUser(int id, User user) {
		return cartRepository.findByIdAndUser(id, user);
	}
	public void turnGuestCartIntoUserCart(Cart cart, User user) {
		cart.setSessionId(null);
		cart.setUser(user);
		cartRepository.save(cart);
	}
	public int updateQuantityByProductOptionAndUser(OptionWithSize optionWithSize, User user, int quantity, float price) {
		return cartRepository.updateQuantityByOptionWithSizeAndUser(optionWithSize, user, quantity, price);
	}
}
