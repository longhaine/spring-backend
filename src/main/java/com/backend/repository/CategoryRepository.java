package com.backend.repository;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer>{
	ArrayList<Category> findAll();
	@Query("SELECT DISTINCT c FROM category c JOIN FETCH c.subCategories as s"
			+ " WHERE s.gender IN(:gender,'both')")
	List<Category> getSubcategoriesByGender(@Param("gender")String gender);
}
