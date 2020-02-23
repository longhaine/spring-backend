package com.backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.OptionWithSize;

@Repository
public interface OptionWithSizeRepository extends CrudRepository<OptionWithSize, Integer>{

}
