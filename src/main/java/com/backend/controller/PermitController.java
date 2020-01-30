package com.backend.controller;



import java.util.ArrayList;
import java.util.List;

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
import com.backend.response.CategoryByGenderResponse;
import com.backend.service.CategoryService;
import com.backend.service.SubCategoryService;

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
	@GetMapping("/category")
	public ArrayList<CategoryByGenderResponse> category(){
		return categoryService.findAll();
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
			e.getMessage();
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
	}

	@GetMapping("/sideSubCategoryByGender/{gender}")
	public List<SubCategory> loadSideSubCategoryByGender(@PathVariable("gender")String gender){
		if(gender.equals("men") || gender.equals("women")) {
			return subCategoryService.loadSideSubCategoryByGender(gender);
		}
		throw new ResponseStatusException(HttpStatus.NOT_FOUND,"there is no gender such as "+gender);
	}
	
	
	// test section
	@Autowired
	private SubCategoryRepository subCategoryRepository;
	@GetMapping("/test")
	public Object test() {
		return subCategoryService.loadSideSubCategoryByGender("men");
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
