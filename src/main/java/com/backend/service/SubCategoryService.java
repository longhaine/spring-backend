package com.backend.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.SubCategory;
import com.backend.repository.SubCategoryRepository;

@Service
public class SubCategoryService {
	
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	
	public ArrayList<SubCategory> findAll(){
		ArrayList<SubCategory> list = new ArrayList<SubCategory>();
		subCategoryRepository.findAll().forEach(list::add);
		return list;
	}
}
