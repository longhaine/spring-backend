package com.backend.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Category;
import com.backend.entity.SubCategory;
import com.backend.repository.CategoryRepository;
import com.backend.response.CategoryByGenderResponse;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	public ArrayList<CategoryByGenderResponse> findAll(){
		ArrayList<CategoryByGenderResponse> result = new ArrayList<>();
		ArrayList<Category> list = categoryRepository.findAll();
		ArrayList<Category> listOfWomen = new ArrayList<>();
		ArrayList<Category> listOfMen = new ArrayList<>();
		for(Category category : list) {
			Category categoryClone1 = new Category(category.getId(), category.getName()); //for women
			Category categoryClone2 = new Category(category.getId(), category.getName()); //for men
			List<SubCategory> subCategories = category.getSubCategories();
			for(SubCategory subCategory : subCategories) {
				if(subCategory.getGender().equals("unisex"))
				{
					categoryClone1.getSubCategories().add(subCategory);
					categoryClone2.getSubCategories().add(subCategory);
				}
				else if(subCategory.getGender().equals("women"))
				{
					categoryClone1.getSubCategories().add(subCategory);
				}
				else
				{
					categoryClone2.getSubCategories().add(subCategory);
				}
			}
			listOfWomen.add(categoryClone1);
			listOfMen.add(categoryClone2);	
		}
		result.add(new CategoryByGenderResponse("women", listOfWomen));
		result.add(new CategoryByGenderResponse("men", listOfMen));
		return result;
	}
}
