package com.backend.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.SubCategory;

@Repository
public interface SubCategoryRepository extends CrudRepository<SubCategory, Integer>{
	// Gender Or Gender because there are three variable of gender "women", "men", "both"
	@Query(value ="SELECT sc.* FROM subcategory sc  WHERE name = :name AND gender IN(:gender,'both')",nativeQuery = true)
	Optional<SubCategory> findByGenderAndName(@Param("gender")String gender, @Param("name")String name);
	// Gender Or Gender because there are 3 variables such as women, men and both(represent for women and men)
	List<SubCategory> findByGenderOrGender(String gender, String both);
	List<SubCategory> findByGenderOrGenderAndCategoryNameIsNotLike(String gender, String both, String categoryName);
}
