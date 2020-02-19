package com.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Cart;
import com.backend.entity.ProductOption;
import com.backend.entity.User;
import com.backend.repository.CartRepository;
import com.backend.repository.CategoryRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;
	
	public List<Cart> getCartsBySessionId(String sessionId){
		return cartRepository.findBySessionId(sessionId);
	}
	public List<Cart> getCartsByUser(User user){
		return cartRepository.findByUser(user);
	}
	public Cart save(Cart cart) {
		return cartRepository.save(cart);
	}
	public void delete(Cart cart) {
		cartRepository.delete(cart);
	}
	public Cart getCartByGuest(ProductOption productOption, String sessionId) {
		return cartRepository.findByProductOptionAndSessionId(productOption, sessionId);
	}
	public Cart getCartByUser(ProductOption productOption,User user) {
		return cartRepository.findByProductOptionAndUser(productOption, user);
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
	public int updateQuantityByProductOptionAndUser(ProductOption productOption, User user, int quantity, float price) {
		return cartRepository.updateQuantityByProductOptionAndUser(productOption, user, quantity, price);
	}
}
