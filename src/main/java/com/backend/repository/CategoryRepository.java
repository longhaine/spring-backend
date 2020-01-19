package com.backend.repository;
import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer>{
	ArrayList<Category> findAll();
}
