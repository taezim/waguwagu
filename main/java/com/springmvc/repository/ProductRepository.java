package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Product;



public interface ProductRepository 
{
	List<Product> readAllProductList();
	
	// 6장 추가
	List<Product> readProductListByCategory(String category);
	
	Product readProductById(String productId);
	void setNewProduct(Product product);
	
	void setUpdateProduct(Product product);
	void setDeleteProduct(String productId);
}
