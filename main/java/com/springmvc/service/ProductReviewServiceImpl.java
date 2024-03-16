package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.ProductReview;
import com.springmvc.repository.ProductReviewRepository;

@Service
public class ProductReviewServiceImpl implements ProductReviewService{

	@Autowired
	private ProductReviewRepository productReviewRepository;
	
	@Override
	public List<ProductReview> readAllReviewList() {
		// TODO Auto-generated method stub
		return productReviewRepository.readAllReviewList();
	}

	@Override
	public ProductReview readReviewById(String reviewId) {
		ProductReview reviewById = productReviewRepository.readReviewById(reviewId);
		return reviewById;
	}

	@Override
	public void setNewReview(ProductReview productReview) {
		productReviewRepository.setNewReview(productReview);
		
	}

	@Override
	public void setUpdateReview(ProductReview productReview) {
		productReviewRepository.setUpdateReview(productReview);
		
	}

	@Override
	public void setDeleteReview(String reviewId) {
		productReviewRepository.setDeleteReview(reviewId);
		
	}

	@Override
	public List<ProductReview> readProductAllReviewList(String productId) {
		// TODO Auto-generated method stub
		return productReviewRepository.readProductAllReviewList(productId);
	}

	@Override
	public double calculateAvgScore(String productId) {
		// TODO Auto-generated method stub
		return productReviewRepository.calculateAvgScore(productId);
	}

}
