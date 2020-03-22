package com.backend.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.SubCategory;
import com.backend.entity.SubCategoryView;
import com.backend.repository.SubCategoryRepository;

@Service
public class SubCategoryService {
	private int[] womenTop10Product = {22,19,3,18,10,35,30,16,8,27};
	private int[] womenNewArrivals = {18,21,24,15,1};
	private int[] womenBackInStock = {14,10,35,22,30,27};
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	public List<SubCategory> findAllByGender(String gender){
		return subCategoryRepository.findAllByProductsGender(gender);
	}
	
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
	
	public List<SubCategory> getWomenTop10Product(){
		List<SubCategory> list = new LinkedList<SubCategory>();
		for(int i = 0 ; i < 10 ; i++) {
			list.add(subCategoryRepository.findByProductsProductOptionsId(womenTop10Product[i]));
		}
		return list;
	}
	public List<SubCategory> getWomenNewArrivals(){
		List<SubCategory> list = new LinkedList<SubCategory>();
		int length = womenNewArrivals.length;
		for(int i = 0 ; i < length ; i++) {
			list.add(subCategoryRepository.findByProductsProductOptionsId(womenNewArrivals[i]));
		}
		return list;
	}
	public List<SubCategory> getWomenBackInStock(){
		List<SubCategory> list = new LinkedList<SubCategory>();
		int length = womenBackInStock.length;
		for(int i = 0 ; i < length ; i++) {
			list.add(subCategoryRepository.findByProductsProductOptionsId(womenBackInStock[i]));
		}
		return list;
	}
	public List<SubCategoryView> loadSideSubCategoryByGender(String gender){
		return subCategoryRepository.findByGenderOrGenderAndCategoryNameIsNotLike(gender, "both", "Featured");
	}
}
