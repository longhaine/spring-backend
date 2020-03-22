package com.backend.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.backend.entity.UserForget;

@Repository
public interface UserForgetRepository extends CrudRepository<UserForget, Integer> {
	Optional<UserForget> findByUserEmail(String email);
	Optional<UserForget> findByPath(String hashedPath);
}
