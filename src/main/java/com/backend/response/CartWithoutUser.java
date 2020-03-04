package com.backend.response;

import java.util.List;

import com.backend.entity.OptionWithSize;
import com.backend.entity.ProductOption;
import com.backend.entity.Size;

public interface CartWithoutUser {
	int getId();
	List<OptionWithSize> getOptionWithSizes();
	ProductOption getProductOption();
	Size getSize();
	int getQuantity();
	float getPrice();
	
}
