package com.backend.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "user_order")
public class UserOrder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "order_number")
	private int orderNumber;
	
	@Column(name ="price")
	private float price;

	@Column(name= "fullname")
	private String fullName;
	
	@Column(name = "address")
	private String address;
	
	@Column(name ="phone")
	private String phone;
	
	@Column(name="payment")
	private String payment;
	
	@Column(name = "date")
	private String date;
	
	@ManyToOne
	@JoinColumn(name ="user_id")
	private User user;

	public int getId() {
		return id;
	}

	public float getPrice() {
		return price;
	}

	public String getAddress() {
		return address;
	}

	public String getPhone() {
		return phone;
	}

	public User getUser() {
		return user;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getFullName() {
		return fullName;
	}

	public String getPayment() {
		return payment;
	}

	public String getDate() {
		return date;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	
}
