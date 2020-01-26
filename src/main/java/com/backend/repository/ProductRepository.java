package com.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.Product;
import com.backend.entity.SubCategory;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer>{
	
	@Query(
	value ="SELECT p.* FROM product p WHERE p.subcategory_id = :#{#subCategory.id} AND (p.gender = :gender OR p.gender = 'both')"
	,nativeQuery=true)
	List<Product> findByGenderAndSubCategory(@Param("gender")String gender,@Param("subCategory")SubCategory subCategory);
}
