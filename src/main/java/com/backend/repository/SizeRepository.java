package com.backend.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.Size;

@Repository
public interface SizeRepository extends CrudRepository<Size, Integer>{
	List<Size> findAll();
}
