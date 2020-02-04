package com.backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Integer>{
	
	Role findByName(String name);
}
