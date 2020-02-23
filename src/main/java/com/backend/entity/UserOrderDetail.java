package com.backend.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name ="order_detail")
public class UserOrderDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name ="order_id")
	private UserOrder order;
	
	@ManyToOne
	@JoinColumn(name = "option_size_id")
	private OptionWithSize optionWithSize;
	
	@Column(name ="quantity")
	private int quantity;
	
	@Column(name ="price")
	private float price;

	public int getId() {
		return id;
	}

	public UserOrder getOrder() {
		return order;
	}

	public int getQuantity() {
		return quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setOrder(UserOrder order) {
		this.order = order;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public OptionWithSize getOptionWithSize() {
		return optionWithSize;
	}

	public void setOptionWithSize(OptionWithSize optionWithSize) {
		this.optionWithSize = optionWithSize;
	}
	
	
}
