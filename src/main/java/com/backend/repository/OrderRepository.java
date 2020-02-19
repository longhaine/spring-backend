package com.backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.UserOrder;

@Repository
public interface OrderRepository extends CrudRepository<UserOrder, Integer>{

}
