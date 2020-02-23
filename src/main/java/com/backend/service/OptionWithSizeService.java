package com.backend.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.entity.OptionWithSize;
import com.backend.repository.OptionWithSizeRepository;

@Service
public class OptionWithSizeService {

	@Autowired
	private OptionWithSizeRepository optionWithSizeRepository;
	
	public Optional<OptionWithSize> findById(int id){
		return optionWithSizeRepository.findById(id);
	}
	
	public void updateQuantityLeft(OptionWithSize optionWithSize, int quantityLeft) {
		optionWithSize.setQuantity(quantityLeft);
		optionWithSizeRepository.save(optionWithSize);
	}
}
