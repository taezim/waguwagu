package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Product;
import com.springmvc.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService
{
	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<Product> readAllProductList() 
	{
		return productRepository.readAllProductList();
	}

	@Override
	public List<Product> readProductListByCategory(String category) 
	{
		List<Product> productsByCategory = productRepository.readProductListByCategory(category);
		return  productsByCategory;
	}

	@Override
	public Product readProductById(String productId) {
		Product productById = productRepository.readProductById(productId);
		return productById;
	}

	@Override
	public void setNewProduct(Product product) {
		productRepository.setNewProduct(product);
	}

	@Override
	public void setUpdateBook(Product product) {
		productRepository.setUpdateProduct(product);	
	}

	@Override
	public void setDeleteBook(String productId) {
		productRepository.setDeleteProduct(productId);
	}

}
