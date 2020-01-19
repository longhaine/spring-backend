package com.backend.response;

import java.util.ArrayList;

import com.backend.entity.Category;

public class CategoryByGenderResponse {
	private String gender;
	private ArrayList<Category> categories;
	
	public CategoryByGenderResponse(String gender, ArrayList<Category> categories) {
		this.gender = gender;
		this.categories = categories;
	}
	public String getGender() {
		return gender;
	}
	public ArrayList<Category> getCategories() {
		return categories;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}
	
}
