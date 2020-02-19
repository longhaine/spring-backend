package com.backend.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.Address;
import com.backend.entity.User;

@Repository
public interface AddressRepository extends CrudRepository<Address, Integer>{
	List<Address> findByUser(User user);
	@Query(value="SELECT COUNT(*) FROM address a WHERE a.user = :user")
	int countAddressByUser(@Param("user") User user);
	
	@Query(value = "SELECT a FROM address a WHERE a.user = :user AND a.selected = 1")
	Optional<Address> findSelectedAddressByUser(@Param("user") User user);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE address a SET a.selected = 0 WHERE a.user = :user AND a.selected = 1")
	int unSelectAddressByUser(@Param("user") User user);
}
