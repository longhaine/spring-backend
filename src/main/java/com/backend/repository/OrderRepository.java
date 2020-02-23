package com.backend.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.backend.entity.UserOrder;
import com.backend.entity.User;
import java.util.List;

@Repository
public interface OrderRepository extends CrudRepository<UserOrder, Integer>{
	@Query(value = "SELECT order FROM user_order order WHERE order.user = :user ORDER BY order.id DESC")
	List<UserOrder> findByUser(@Param("user")User user);
}
