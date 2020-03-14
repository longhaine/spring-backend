package com.backend.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.SubCategory;
import com.backend.entity.SubCategoryView;

@Repository
public interface SubCategoryRepository extends CrudRepository<SubCategory, Integer>{
	List<SubCategory> findAll();
	// Gender Or Gender because there are three variable of gender "women", "men", "both"
	@Query(value ="SELECT sc.* FROM subcategory sc  WHERE name = :name AND gender IN(:gender,'both')",nativeQuery = true)
	Optional<SubCategory> findByGenderAndName(@Param("gender")String gender, @Param("name")String name);
	@Query(value = "SELECT DISTINCT sc.* FROM subcategory sc "
			+ "INNER JOIN product p ON sc.id = p.subcategory_id "
			+ "INNER JOIN category c ON sc.category_id = c.id "
			+ "WHERE p.gender = :gender AND c.name NOT LIKE '%Featured%'",nativeQuery = true)
	List<SubCategory> findAllByProductsGender(@Param("gender")String gender);
	// Gender Or Gender because there are 3 variables such as women, men and both(represent for women and men)
	List<SubCategory> findByGenderOrGender(String gender, String both);
	List<SubCategoryView> findByGenderOrGenderAndCategoryNameIsNotLike(String gender, String both, String categoryName);
	
	@Query("SELECT sc FROM subcategory sc JOIN FETCH sc.products as p WHERE p.id = :id")
	SubCategory findByProductsProductOptionsId(@Param("id")int id);
}
