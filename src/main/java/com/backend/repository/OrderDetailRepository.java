package com.backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.UserOrderDetail;

@Repository
public interface OrderDetailRepository extends CrudRepository<UserOrderDetail, Integer>{
	
}
