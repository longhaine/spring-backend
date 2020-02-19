package com.backend.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.Cart;
import com.backend.entity.ProductOption;
import com.backend.entity.User;

@Repository
public interface CartRepository extends CrudRepository<Cart,Integer>{
	List<Cart> findBySessionId(String sessionId);
	List<Cart> findByUser(User user);
	Cart findByProductOptionAndSessionId(ProductOption productOption, String sessionId);
	Cart findByProductOptionAndUser(ProductOption productOption,User user);
	Cart findByIdAndSessionId(int id, String sessionId);
	Cart findByIdAndUser(int id, User user);
	
	@Transactional
	@Modifying
	@Query(value = "UPDATE cart c SET c.quantity = c.quantity + :quantity, "
			+ "c.price = c.price + :price "
			+ "WHERE c.productOption = :productOption and c.user = :user")
	int updateQuantityByProductOptionAndUser(
			@Param("productOption") ProductOption productOption,
			@Param("user") User user,
			@Param("quantity") int quantity,
			@Param("price") float price);
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM cart c WHERE c.user = :user ")
	void deleteAllCartsByUser(@Param("user") User user);
	
}
