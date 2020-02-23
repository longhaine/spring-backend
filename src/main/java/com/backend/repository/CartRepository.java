package com.backend.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.Cart;
import com.backend.entity.OptionWithSize;
import com.backend.entity.User;

@Repository
public interface CartRepository extends CrudRepository<Cart,Integer>{
	
	@Query(value = "SELECT c FROM cart c WHERE c.sessionId = :sessionId ORDER BY c.id DESC")
	List<Cart> findBySessionId(@Param("sessionId")String sessionId);
	
	@Query(value = "SELECT c FROM cart c WHERE c.user = :user ORDER BY c.id DESC")
	List<Cart> getCartsByUser(@Param("user")User user);
	
	Cart findByOptionWithSizeAndSessionId(OptionWithSize optionWithSize, String sessionId);
	Cart findByOptionWithSizeAndUser(OptionWithSize optionWithSize,User user);
	Cart findByIdAndSessionId(int id, String sessionId);
	Cart findByIdAndUser(int id, User user);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE cart c SET c.quantity = c.quantity + :quantity, "
			+ "c.price = c.price + :price "
			+ "WHERE c.optionWithSize = :optionWithSize and c.user = :user")
	int updateQuantityByOptionWithSizeAndUser(
			@Param("optionWithSize") OptionWithSize optionWithSize,
			@Param("user") User user,
			@Param("quantity") int quantity,
			@Param("price") float price);
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM cart c WHERE c.user = :user ")
	void deleteAllCartsByUser(@Param("user") User user);
	
}
