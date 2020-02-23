package com.backend.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name ="product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="gender")
	private String gender;
	
	@ManyToOne
	@JoinColumn(name="subcategory_id")
	private SubCategory subCategory;
	
	@Column(name="description")
	private String description;
	
	// json ignore productOption.product
	@JsonIgnoreProperties("product")
	@OneToMany(mappedBy = "product")
	private List<ProductOption> productOptions;
	
	
	
	public String getGender() {
		return gender;
	}

	public List<ProductOption> getProductOptions() {
		return productOptions;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setProductOptions(List<ProductOption> productOptions) {
		this.productOptions = productOptions;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}


	public SubCategory getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	
	
}
