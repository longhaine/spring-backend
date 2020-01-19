package com.backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.SubCategory;

@Repository
public interface SubCategoryRepository extends CrudRepository<SubCategory, Integer>{

}
