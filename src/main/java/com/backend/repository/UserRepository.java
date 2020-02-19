package com.backend.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;

import com.backend.entity.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>{
	User findByEmail(String email);
	User save(User user);
}
