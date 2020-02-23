package com.backend.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name="size")
public class Size {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "name")
	private String name;

//	@OneToMany(mappedBy = "size")
//	private List<OptionWithSize> optionWithSizes;
	
	public int getId() {
		return id;
	}

	public String getCode() {
		return code;
	}

	public String getName() {
		return name;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setName(String name) {
		this.name = name;
	}

//	public List<OptionWithSize> getOptionWithSizes() {
//		return optionWithSizes;
//	}
//
//	public void setOptionWithSizes(List<OptionWithSize> optionWithSizes) {
//		this.optionWithSizes = optionWithSizes;
//	}
	
	
}
