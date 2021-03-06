package com.backend.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity(name ="product_option")
public class ProductOption {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name ="color")
	private String color;
	
	@Column(name = "group_color")
	private String groupColor;
	
	@Column(name ="price")
	private float price;
	
	@Column(name ="image")
	private String image;
	
	@Column(name="number_of_image")
	private int numberOfImage;
	
	@Column(name="link")
	private String link;
	
	@JsonIgnoreProperties("productOptions")
	@ManyToOne
	@JoinColumn(name ="product_id")
	private Product product;

	@JsonIgnoreProperties("productOption")
	@OneToMany(mappedBy = "productOption")
	private List<OptionWithSize> optionWithSizes;
	
	
	public int getNumberOfImage() {
		return numberOfImage;
	}

	public void setNumberOfImage(int numberOfImage) {
		this.numberOfImage = numberOfImage;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public float getPrice() {
		return price;
	}

	public String getImage() {
		return image;
	}

	public Product getProduct() {
		return product;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public List<OptionWithSize> getOptionWithSizes() {
		return optionWithSizes;
	}

	public void setOptionWithSizes(List<OptionWithSize> optionWithSizes) {
		this.optionWithSizes = optionWithSizes;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getGroupColor() {
		return groupColor;
	}

	public void setGroupColor(String groupColor) {
		this.groupColor = groupColor;
	}
	
}
