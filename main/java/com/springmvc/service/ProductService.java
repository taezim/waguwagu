package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Product;

public interface ProductService 
{
	List<Product> readAllProductList(); // 여기에다 arr 적는거랑 안적는거의 : 다형성 활용하기 위함
	List<Product> readProductListByCategory(String category);

	Product readProductById(String productId);
	
	//7.2?3? 추가
	void setNewProduct(Product product);
	
	void setUpdateBook(Product product);
	void setDeleteBook(String productId);
}
