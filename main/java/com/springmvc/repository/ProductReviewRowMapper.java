package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.ProductReview;

public class ProductReviewRowMapper implements RowMapper<ProductReview>{

	@Override
	public ProductReview mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductReview productReview = new ProductReview();
		
		productReview.setReviewId(rs.getString(1));
		productReview.setProductId(rs.getString(2));
		productReview.setUserId(rs.getString(3));
		productReview.setReviewDate(rs.getString(4));
		productReview.setReviewContent(rs.getString(5));
		productReview.setReviewRating(rs.getInt(6));
		productReview.setName(rs.getString(7));
		productReview.setTitle(rs.getString(8));
		
		
		return productReview;
	}

}
