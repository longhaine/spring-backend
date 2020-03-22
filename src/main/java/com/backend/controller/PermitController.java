package com.backend.controller;



import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.entity.Category;
import com.backend.entity.OptionWithSize;
import com.backend.entity.Product;
import com.backend.entity.ProductOption;
import com.backend.entity.Size;
import com.backend.entity.SubCategory;
import com.backend.entity.SubCategoryView;
import com.backend.repository.OptionWithSizeRepository;
import com.backend.repository.ProductRepository;
import com.backend.repository.SizeRepository;
import com.backend.repository.SubCategoryRepository;
import com.backend.service.CategoryService;
import com.backend.service.ProductService;
import com.backend.service.SubCategoryService;
import com.backend.service.UserForgetService;
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
	private UserForgetService userForgetService;
	@Autowired
	private UserService userService;
	@Autowired
	private HttpServletRequest request;
	
	String regex = "^(.+)@(.+)$";
	Pattern pattern = Pattern.compile(regex);
	
	@Cacheable("header")
	@GetMapping("/header")
	public Map<String, Object> category(){
		return categoryService.loadHeader();
	}
	
	Set<String> subCategoriesHaveHyphen = new HashSet<>(Arrays.asList("t-shirts","best-sellers","new-arrivals","back-in-stock"));
	Set<String> featured = new HashSet<>(Arrays.asList("back-in-stock","new-arrivals","best-sellers","all"));
	@Cacheable(value="subCategoryByGender",key="#gender + #subCategoryName")
	@GetMapping("/productByGenderAndSubcategory/{gender}/{subCategoryName}")
	public Object productByGenderAndSubcategory(@PathVariable("gender")String gender, @PathVariable("subCategoryName")String subCategoryName){
		try {
			// because T-shirts, Best-Sellers has '-'
			if(subCategoriesHaveHyphen.contains(subCategoryName) == false) {
				subCategoryName = subCategoryName.replace("-"," ");
			}
			subCategoryName = subCategoryName.toLowerCase();
			if(featured.contains(subCategoryName)) {
				if(subCategoryName.equals("all"))
				{
					return subCategoryService.findAllByGender(gender);
				}
				if(gender.equals("women")) {
					if(subCategoryName.equals("best-sellers")) {
						return subCategoryService.getWomenTop10Product();
					}
					if(subCategoryName.equals("new-arrivals")) {
						return subCategoryService.getWomenNewArrivals();
					}
					if(subCategoryName.equals("back-in-stock")) {
						return subCategoryService.getWomenBackInStock();
					}
				}
			}
			else {
				SubCategory subCategory = subCategoryService.findByGenderAndName(gender, subCategoryName);
				return productRepository.findByGenderAndSubCategory(gender, subCategory);
			}
			return Arrays.asList();
		}
		catch(Exception e) {
			throw new IllegalArgumentException();
		}
	}
	
	@Cacheable(value="sideNav",key="#gender")
	@GetMapping("/sideSubCategoryByGender/{gender}")
	public List<SubCategoryView> loadSideSubCategoryByGender(@PathVariable("gender")String gender){
		if(gender.equals("men") || gender.equals("women")) {
			return subCategoryService.loadSideSubCategoryByGender(gender);
		}
		throw new IllegalArgumentException("there is no gender such as "+gender);
	}
	
	@GetMapping("/send-reset-link/{email}")
	public boolean sendResetLink(@PathVariable String email) {
		return userForgetService.sendResetLink(email);
	}
	@GetMapping("/check-reset-link/{hashedPath}")
	public boolean checkResetLink(@PathVariable String hashedPath) {
		return userForgetService.checkResetLink(hashedPath);
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
	private SubCategoryRepository subcategoryRepository;
	@GetMapping("/test/{id}")
	public Object test(@PathVariable("id")int id) {
		return subcategoryRepository.findByProductsProductOptionsId(id);
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
