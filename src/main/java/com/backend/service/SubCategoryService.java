package com.backend.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.SubCategory;
import com.backend.repository.SubCategoryRepository;

@Service
public class SubCategoryService {
	
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	
	public SubCategory findByGenderAndName(String gender, String name) {
		Optional<SubCategory> subCategory = subCategoryRepository.findByGenderAndName(gender, name);
		if(subCategory.isPresent()) {
			return subCategory.get();
		}
		throw new IllegalArgumentException("There is no subCategory's name as "+name);
	}
	public List<SubCategory> findByGender(String gender){
		return subCategoryRepository.findByGenderOrGender(gender, "both");
	}
	public List<SubCategory> loadSideSubCategoryByGender(String gender){
		return subCategoryRepository.findByGenderOrGenderAndCategoryNameIsNotLike(gender, "both", "Featured");
	}
}
