package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.ProductReview;

public interface ProductReviewService {
	List<ProductReview> readAllReviewList();
	ProductReview readReviewById(String reviewId);
	void setNewReview(ProductReview productReview);
	void setUpdateReview(ProductReview productReview);
	void setDeleteReview(String reviewId);
	List<ProductReview> readProductAllReviewList(String productId);
	double calculateAvgScore(String productId);
}
