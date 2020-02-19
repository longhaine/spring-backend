package com.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.Address;
import com.backend.entity.User;
import com.backend.service.AddressService;
import com.backend.service.UserService;

@Controller
@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/address")
public class AddressController {

	@Autowired
	private AddressService addressService;
	
	@GetMapping("")
	public List<Address> getByUser(){
		return addressService.getByUser();
	}
	
	@PutMapping("")
	public void add(@RequestBody Address address) {
		// if this is the first address user've ever had, then set selected property = 1 to this address 
		if(addressService.countByUser() == 0) {
			address.setSelected(1);
		}
		addressService.save(address);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable int id) {
		Optional<Address> addressOpt = addressService.getById(id);
		if(addressOpt.isPresent()) {
			addressService.delete(addressOpt.get());
		}
		else {
			throw new IllegalArgumentException();
		}
	}
	
	// used for selecting selected address
	@PatchMapping("/{id}")
	public void patch(@PathVariable int id) {
		Optional<Address> newSelectedOpt = addressService.getById(id);
		if(newSelectedOpt.isPresent())
		{
			addressService.unSelectAddressByUser();
			Address newSelectedAddress = newSelectedOpt.get();
			newSelectedAddress.setSelected(1);
			addressService.save(newSelectedAddress);
		}
		else {
			throw new IllegalArgumentException();
		}
	}
	@GetMapping("/selected")
	public Map<String, Object> getSelected() {
		Optional<Address> addressOpt = addressService.findSelectedAdressByUser();
		Map<String, Object> res = new HashMap<String, Object>();
		if(addressOpt.isPresent()) {
			res.put("message", "yes");
			res.put("address", addressOpt.get());
		}
		else {
			res.put("message", "no");
			res.put("address", null);
		}
		return res;
	}
}
