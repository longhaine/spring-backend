package com.backend.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.hibernate.annotations.Formula;

@Entity(name ="cart")
public class Cart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="product_option_id")
	private ProductOption productOption;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="price")
	private float price;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name ="session_id")
	private String sessionId;

	
	public Cart() {}
	
	public Cart(ProductOption productOption, String sessionId) {
		this.productOption = productOption;
		this.sessionId = sessionId;
		this.quantity = 1;
		this.price = productOption.getPrice();
	}
	
	public Cart(ProductOption productOption, User user) {
		this.productOption = productOption;
		this.quantity = 1;
		this.price = productOption.getPrice();
		this.user = user;
	}
	
	@PreUpdate
	@PrePersist
	private void prePersist() {
		this.price = this.productOption.getPrice() * this.quantity;
	}
	
	public int getId() {
		return id;
	}

	public ProductOption getProductOption() {
		return productOption;
	}

	public int getQuantity() {
		return quantity;
	}

	public float getPrice() {
		return price;
	}

	public User getUser() {
		return user;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setProductOption(ProductOption productOption) {
		this.productOption = productOption;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	
	
}
