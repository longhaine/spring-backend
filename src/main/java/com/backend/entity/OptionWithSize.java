package com.backend.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name = "option_size")
public class OptionWithSize {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JsonIgnoreProperties("optionWithSizes")
	@ManyToOne
	@JoinColumn(name = "product_option_id")
	private ProductOption productOption;
	
	@JsonIgnoreProperties("optionWithSizes")
	@ManyToOne
	@JoinColumn(name = "size_id")
	private Size size;

	@Column(name = "quantity")
	private int quantity;
	
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public ProductOption getProductOption() {
		return productOption;
	}

	public Size getSize() {
		return size;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setProductOption(ProductOption productOption) {
		this.productOption = productOption;
	}

	public void setSize(Size size) {
		this.size = size;
	}
	
}
