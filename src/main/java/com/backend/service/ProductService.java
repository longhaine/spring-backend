package com.backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.Product;
import com.backend.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	public List<Product> findAllByGender(String gender){
		return productRepository.findAllByGenderAsc(gender);
	}
	
	public Optional<Product> getByProductOptionLink(String link){
		return productRepository.findByProductOptionsLink(link);
	}
}
