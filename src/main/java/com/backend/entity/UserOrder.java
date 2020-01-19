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
	
	@Column(name = "code")
	private String code;
	
	@Column(name ="price")
	private float price;
	
	@Column(name = "address")
	private String address;
	
	@Column(name ="phone")
	private String phone;
	
	@Column(name ="session_id")
	private String sessionId;
	
	@ManyToOne
	@JoinColumn(name ="user_id")
	private User user;

	public int getId() {
		return id;
	}

	public String getCode() {
		return code;
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

	public String getSessionId() {
		return sessionId;
	}

	public User getUser() {
		return user;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setCode(String code) {
		this.code = code;
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

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
