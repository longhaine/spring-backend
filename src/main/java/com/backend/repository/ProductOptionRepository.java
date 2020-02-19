package com.backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.ProductOption;

@Repository
public interface ProductOptionRepository extends CrudRepository<ProductOption, Integer> {

}
