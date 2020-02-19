package com.backend.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.ProductOption;
import com.backend.repository.ProductOptionRepository;

@Service
public class ProductOptionService {
	
	@Autowired
	private ProductOptionRepository productOptionRepository;
	
	public Optional<ProductOption> findById(int id){
		return productOptionRepository.findById(id);
	}
}
