package com.backend.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Pattern;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.OptionWithSize;
import com.backend.entity.Product;
import com.backend.entity.ProductOption;
import com.backend.entity.Size;
import com.backend.entity.SubCategory;
import com.backend.repository.OptionWithSizeRepository;
import com.backend.repository.ProductRepository;
import com.backend.repository.SizeRepository;
import com.backend.service.CategoryService;
import com.backend.service.ProductService;
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
	private ProductService productService;
	
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
	@GetMapping("/product/{link}")
	public Product getProductHasProductOptionLink(@PathVariable String link) {
		Optional<Product> productOpt = productService.getByProductOptionLink(link);
		if(productOpt.isPresent()) {
			return productOpt.get();
		}
		throw new IllegalArgumentException();
	}
	
	@Autowired
	private SizeRepository sizeRepository;
	
	@Autowired
	private OptionWithSizeRepository optionWithSizeRepository;
	
//	@GetMapping("/add") //this request only for adding size for product 
	public void add() {
		int count = 0;
		List<OptionWithSize> optionWithSizes = new ArrayList<>();
		for(int i = 42 ; i < 43 ;i++ ) { // size range for particular products, see in database
			Size size = (sizeRepository.findById(i)).get();
			OptionWithSize optionWithSize = new OptionWithSize();
			optionWithSize.setSize(size);
			optionWithSizes.add(optionWithSize);
		}
		int length2 = optionWithSizes.size();
		for(int i = 32; i < 40 ; i++) // range of products that list of size above apply to
		{
			Product product = (productRepository.findById(i)).get();
			List<ProductOption> productOptions = product.getProductOptions();
			int length = productOptions.size();

			
			for(int k = 0; k < length ; k++)
			{
				ProductOption productOption = productOptions.get(k);
				System.out.println("productOption ID:" +productOption.getId());
				for(int l = 0 ; l < length2 ;l++) 
				{
					OptionWithSize optionWithSize = optionWithSizes.get(l);
					OptionWithSize optionWithSizeNew = new OptionWithSize();
					optionWithSizeNew.setProductOption(productOption);
					optionWithSizeNew.setSize(optionWithSize.getSize());
					optionWithSizeNew.setQuantity(ThreadLocalRandom.current().nextInt(0, 50 + 1));
					optionWithSizeRepository.save(optionWithSizeNew);
					count++;
				}
				
			}
			
		}
		System.out.println("count: "+count);
	}
}
