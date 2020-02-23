package com.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.TransactionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.Cart;
import com.backend.entity.OptionWithSize;
import com.backend.entity.User;
import com.backend.service.CartService;
import com.backend.service.OptionWithSizeService;
import com.backend.service.UserService;

@Controller
@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
//	@Autowired
//	private ProductOptionService productOptionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OptionWithSizeService optionWithSizeService;
	
	@GetMapping("")
	public List<Cart> get(){
		List<Cart> cartList = null;
		if(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken) {
			cartList = cartService.getCartsBySessionId(userService.getClientIpAddr());
		}
		else {
			User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
			cartList = cartService.getCartsByUser(user);
		}
		return cartList;
	}
	
	
	// optionWithSize id 
	@PutMapping("/{id}")
	public List<Cart> cartAdd(@PathVariable("id") int id){
		Optional<OptionWithSize> optionWithSizeOpt = optionWithSizeService.findById(id);
		if(optionWithSizeOpt.isPresent() && optionWithSizeOpt.get().getQuantity() > 0)
		{
			OptionWithSize optionWithSize = optionWithSizeOpt.get();
			SecurityContext securityContext = SecurityContextHolder.getContext();
			List<Cart> cartList = null;
			// if cart was added by a guest
			if(securityContext.getAuthentication() instanceof AnonymousAuthenticationToken) {
				cartList = addCartByGuest(optionWithSize);
			}
			else // if cart was added by 
			{
				cartList = addCartByUser(optionWithSize);
			}
			return cartList;
		}
		throw new IllegalArgumentException(); // if product doesn't exist
	}
	// add cart and return cart list
	public List<Cart> addCartByGuest(OptionWithSize optionWithSize){
		String ip = userService.getClientIpAddr();
		Cart cart = cartService.getCartByGuest(optionWithSize, ip); // it could be null
		if(cart!= null && cart.getQuantity() < 10)
		{
			cart.setQuantity(cart.getQuantity() + 1);
		}
		if(cart == null)
		{
			cart = new Cart(optionWithSize, ip);
		}
		cartService.save(cart);
		return cartService.getCartsBySessionId(ip);
	}
	
	
	// add cart and return cart list
	public List<Cart> addCartByUser(OptionWithSize optionWithSize){
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		Cart cart = cartService.getCartByUser(optionWithSize, user); //it could be null
		if(cart != null && cart.getQuantity() < 10)
		{
			cart.setQuantity(cart.getQuantity() + 1);
		}
		if(cart == null) 
		{
			cart = new Cart(optionWithSize, user);
		}
		cartService.save(cart);
		return cartService.getCartsByUser(user);
	}
	// cart id 
	@DeleteMapping("/minus-quantity/{id}")
	public List<Cart> cartRemove(@PathVariable("id")int id){
		Optional<OptionWithSize> optionWithSizeOpt = optionWithSizeService.findById(id);
		if(optionWithSizeOpt.isPresent()) {
			OptionWithSize optionWithSize = optionWithSizeOpt.get();
			SecurityContext securityContext = SecurityContextHolder.getContext();
			List<Cart> cartList = null;
			// if cart was added by a guest
			if(securityContext.getAuthentication() instanceof AnonymousAuthenticationToken) {
				cartList = minusOneQuantityByGuest(optionWithSize);
			}
			else // if cart was added by 
			{
				cartList = minusOneQuantityByUser(optionWithSize);
			}
			return cartList;
		}
		throw new IllegalArgumentException();
	}
	
	public List<Cart> minusOneQuantityByGuest(OptionWithSize optionWithSize){
		String ip = userService.getClientIpAddr();
		Cart cart = cartService.getCartByGuest(optionWithSize, ip); // it could be null
		if(cart != null) // if it exist then - 1 quantity
		{
			cart.setQuantity(cart.getQuantity() - 1);
			if(cart.getQuantity() > 0)
				cartService.save(cart);
			else
				cartService.delete(cart);
		}
		else throw new IllegalArgumentException();
		return cartService.getCartsBySessionId(ip);
	}
	
	public List<Cart> minusOneQuantityByUser(OptionWithSize optionWithSize){
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		Cart cart = cartService.getCartByUser(optionWithSize, user); //it could be null
		if(cart != null) {
			cart.setQuantity(cart.getQuantity() - 1);
			if(cart.getQuantity() > 0)
				cartService.save(cart);
			else
				cartService.delete(cart);
		}
		else throw new IllegalArgumentException();
		return cartService.getCartsByUser(user);
	}
	
	
	@DeleteMapping("/{id}") // cart id
	public List<Cart> removeAllQuantityCart(@PathVariable("id") int id){
		SecurityContext securityContext = SecurityContextHolder.getContext();
		List<Cart> cartList = null;
		// if cart was added by a guest
		if(securityContext.getAuthentication() instanceof AnonymousAuthenticationToken) {
			cartList = removeAllQuantityCartByGuest(id);
		}
		else // if cart was added by 
		{
			cartList = removeAllQuantityCartByUser(id);
		}
		return cartList;
	}
	public List<Cart> removeAllQuantityCartByGuest(int id){
		String ip = userService.getClientIpAddr();
		Cart cart = cartService.getCartByIdAndIp(id, ip); // it could be null
		if(cart != null)
		{
			cartService.delete(cart);
		}
		else throw new IllegalArgumentException();
		return cartService.getCartsBySessionId(ip);
	}
	public List<Cart> removeAllQuantityCartByUser(int id){
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		Cart cart = cartService.getCartByIdAndUser(id, user); //it could be null
		if(cart != null) {
			cartService.delete(cart);
		}
		else throw new IllegalArgumentException();
		return cartService.getCartsByUser(user);
	}
	
	
	// this only get invoked by authorization users not for guests	
	@PutMapping("/merge")
	public Map<String, Object> mergeCartsFromGuestToUser(){
		Map<String, Object> res = new HashMap<>();
		res.put("message", "no");
		SecurityContext securityContext = SecurityContextHolder.getContext();
		// check if this path get invoked by guest or authorization user, if it by guest then return no
		if((securityContext.getAuthentication() instanceof AnonymousAuthenticationToken) == false) {
			User user = userService.getUser(securityContext.getAuthentication().getName());
			List<Cart> guestCartList = cartService.getCartsBySessionId(userService.getClientIpAddr());
			List<Cart> userCartList = cartService.getCartsByUser(user);
			if(guestCartList.isEmpty() == false) {
				if(userCartList.isEmpty()) 
				{
					// when user carts are nothing then just delete ip property and set user property
					turnGuestCartsIntoUserCarts(guestCartList, user);
				}
				else
				{
					// when user carts exist then update the quantity of user carts based on guest carts
					mergeGuestCartIntoUserCart2(guestCartList, user);
				}
				res.put("message", "yes");
			}
		}
		return res;
	}
	public void turnGuestCartsIntoUserCarts(List<Cart> cartList, User user) {
		int length = cartList.size();
		for(int i = 0 ; i < length ; i++) {
			cartService.turnGuestCartIntoUserCart(cartList.get(i), user);
		}
	}
	
	
	@Transactional(rollbackOn=Exception.class)
	public void mergeGuestCartIntoUserCart2(List<Cart> guestCartList,User user) {
		int length = guestCartList.size();
		for(int i = 0 ; i < length ; i++) 
		{
			Cart cart = guestCartList.get(i);
			OptionWithSize optionWithSize = cart.getOptionWithSize();
			int quantity = cart.getQuantity();
			float price = cart.getPrice();
			int updateRowCount = cartService.updateQuantityByProductOptionAndUser(optionWithSize, user, quantity, price);
			if(updateRowCount == 1) // if there is a cart in user that has same product option and it was updated successfully
			{
				cartService.delete(cart);
			}
			else if(updateRowCount == 0) // if there is not
			{
				cartService.turnGuestCartIntoUserCart(cart, user);
			}
			else {
				// if update more than 1 row then something really bad happened
				throw new TransactionException("Something wrong happened!");
			}
		}
	}
}
