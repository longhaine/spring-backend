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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity(name ="cart")
public class Cart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="option_size_id")
	private OptionWithSize optionWithSize;
	
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
	
	public Cart(OptionWithSize optionWithSize, String sessionId) {
		this.optionWithSize = optionWithSize;
		this.sessionId = sessionId;
		this.quantity = 1;
		this.price = optionWithSize.getProductOption().getPrice();
	}
	
	public Cart(OptionWithSize optionWithSize, User user) {
		this.optionWithSize = optionWithSize;
		this.quantity = 1;
		this.price = optionWithSize.getProductOption().getPrice();
		this.user = user;
	}
	
	@PreUpdate
	@PrePersist
	private void prePersist() {
		this.price = this.optionWithSize.getProductOption().getPrice() * this.quantity;
	}
	
	public int getId() {
		return id;
	}

	public int getQuantity() {
		return quantity;
	}

	public float getPrice() {
		return price;
	}

	@JsonIgnore
	public User getUser() {
		return user;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setId(int id) {
		this.id = id;
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

	public OptionWithSize getOptionWithSize() {
		return optionWithSize;
	}

	public void setOptionWithSize(OptionWithSize optionWithSize) {
		this.optionWithSize = optionWithSize;
	}
	
	
	
}
