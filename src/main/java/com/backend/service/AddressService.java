package com.backend.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.backend.entity.Address;
import com.backend.entity.User;
import com.backend.repository.AddressRepository;
import com.backend.repository.UserRepository;

@Service
public class AddressService {

	@Autowired
	private AddressRepository addressRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	public int countByUser() {
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		return addressRepository.countAddressByUser(user);
	}
	
	public List<Address> getByUser(){
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		return addressRepository.findByUser(user);
	}
	
	public Optional<Address> getById(int id) {
		return addressRepository.findById(id);
	}
	
	public Address save(Address address){
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		address.setUser(user);
		return addressRepository.save(address);
	}
	
	@PreAuthorize("#address.user.email == authentication.name")
	public void delete(@Param("address")Address address) {
		addressRepository.delete(address);
	}
	
	public Optional<Address> findSelectedAdressByUser(){
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		return addressRepository.findSelectedAddressByUser(user);
	}
	public int unSelectAddressByUser() {
		User user = userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		return addressRepository.unSelectAddressByUser(user);
	}
}
