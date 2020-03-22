package com.backend.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "user_forget")
public class UserForget{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@OneToOne
	@JoinColumn(name ="user_id")
	private User user;
	
	@Column(name ="path")
	private String path;

	public User getUser() {
		return user;
	}

	public String getPath() {
		return path;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setPath(String path) {
		this.path = path;
	}


	
	
}
