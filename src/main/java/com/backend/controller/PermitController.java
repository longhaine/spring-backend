package com.backend.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.backend.entity.Product;
import com.backend.entity.SubCategory;
import com.backend.repository.CategoryRepository;
import com.backend.repository.ProductRepository;
import com.backend.repository.SubCategoryRepository;
import com.backend.service.CategoryService;
import com.backend.service.SubCategoryService;
import com.backend.service.UserService;

@Controller
@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/permit")
public class PermitController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private SubCategoryService subCategoryService;
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private UserService userService;
	
	String regex = "^(.+)@(.+)$";
	Pattern pattern = Pattern.compile(regex);
	
	@GetMapping("/header")
	public Map<String, Object> category(){
		return categoryService.loadHeader();
	}
	

	@GetMapping("/productByGenderAndSubcategory/{gender}/{subCategoryName}")
	public List<Product> productByGenderAndSubcategory(@PathVariable("gender")String gender, @PathVariable("subCategoryName")String subCategoryName){
		try {
			// because T-shirts has '-'
			if(!subCategoryName.equals("T-Shirts")) {
				subCategoryName = subCategoryName.replace("-"," ");
			}
			SubCategory subCategory = subCategoryService.findByGenderAndName(gender, subCategoryName);
			return productRepository.findByGenderAndSubCategory(gender, subCategory);
		}
		catch(Exception e) {
			throw new IllegalArgumentException();
		}
	}
	@GetMapping("/sideSubCategoryByGender/{gender}")
	public List<SubCategory> loadSideSubCategoryByGender(@PathVariable("gender")String gender){
		if(gender.equals("men") || gender.equals("women")) {
			return subCategoryService.loadSideSubCategoryByGender(gender);
		}
		throw new IllegalArgumentException("there is no gender such as "+gender);
	}
	
	
	
	@GetMapping("/find-email/{email}")
	public Map<String, String> findEmail(@PathVariable String email){
		// if email null or email doesn't match with regex
		if(email == null || !pattern.matcher(email).matches()) {
			throw new IllegalArgumentException("Unacceptable email!");
		}
		Map<String, String> body = new HashMap<String, String>();
		if(userService.getUser(email) != null) {
			body.put("message", "yes");
		}
		else {
			body.put("message", "no");
		}
		return body;
	}
	
	// test section
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	@GetMapping("/test")
	public Object test() {
		return categoryService.loadHeader();
	}
	// test section
	@GetMapping("/subCategoryByGender/{gender}")
	public List<SubCategory> subCategoryByGender(@PathVariable("gender")String gender){
		if(gender.equals("men") || gender.equals("women")) {
			return subCategoryService.findByGender(gender);
		}
		throw new ResponseStatusException(HttpStatus.NOT_FOUND,"there is no gender such as "+gender);
	}
}
