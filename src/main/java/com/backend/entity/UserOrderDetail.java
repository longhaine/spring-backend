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
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name ="order_id")
	private UserOrder order;
	
	@ManyToOne
	@JoinColumn(name ="product_id")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "product_optiop_id")
	private ProductOption productOption;
	
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

	public Product getProduct() {
		return product;
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

	public void setId(int id) {
		this.id = id;
	}

	public void setOrder(UserOrder order) {
		this.order = order;
	}

	public void setProduct(Product product) {
		this.product = product;
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
	
	
}
