package com.backend.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "user")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "email")
	private String email;
	
	@Column(name ="password")
	private String password;
	
	@Column(name ="fullname")
	private String fullName;
	
	@Column(name = "verification")
	private int verification;
	
	@Column(name = "default_address")
	private int defaultAddress;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name = "user_role",joinColumns = {@JoinColumn(name = "user_id")},inverseJoinColumns = {@JoinColumn(name ="role_id")})
	private List<Role> roles;
	
	
	@JsonIgnoreProperties("user")
	@OneToMany(mappedBy = "user")
	private List<Address> addresses;
	
	public User() {}
	
	public User(String email, String password) {
		this.email = email;
		this.password = password;
		this.roles = new ArrayList<Role>();
	}
	
	public User(String email, String password,String fullName) {
		this.email = email;
		this.password = password;
		this.fullName = fullName;
		this.roles = new ArrayList<Role>();
	}
	
	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}	
	
	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public int getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getFullName() {
		return fullName;
	}

	public int getVerification() {
		return verification;
	}

	public int getDefaultAddress() {
		return defaultAddress;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public void setVerification(int verification) {
		this.verification = verification;
	}

	public void setDefaultAddress(int defaultAddress) {
		this.defaultAddress = defaultAddress;
	}
	
	
}
