package com.backend.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.Category;
import com.backend.response.CategoryByGenderResponse;
import com.backend.service.CategoryService;

@Controller
@RestController
@CrossOrigin("http://localhost:4200")
@RequestMapping("/permit")
public class PermitController {
	
	@Autowired
	private CategoryService categoryService;
	@GetMapping("/category")
	public ArrayList<CategoryByGenderResponse> category(){
		return categoryService.findAll();
	}
}
