package com.backend.service;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.backend.repository.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private EntityManager entityManager;
	
	public Map<String, Object> loadHeader(){
		Map<String, Object> response = new HashMap<>();
		response.put("women",categoryRepository.getSubcategoriesByGender("women"));
		entityManager.clear(); // because it will be duplicate women parameter in @query
		response.put("men", categoryRepository.getSubcategoriesByGender("men"));
		return response;
	}
}
