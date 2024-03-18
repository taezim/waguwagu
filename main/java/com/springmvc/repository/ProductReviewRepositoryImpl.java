package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.ProductReview;

@Repository
public class ProductReviewRepositoryImpl implements ProductReviewRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Override
	public List<ProductReview> readAllReviewList() {
		String SQL = "select * from p_review";
		List<ProductReview> listOfReviews = template.query(SQL, new ProductReviewRowMapper());
		return listOfReviews;
	}

	@Override
	public ProductReview readReviewById(String reviewId) {
		ProductReview reviewInfo = null;
		
		String SQL = "select count(*) from p_review where pr_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, reviewId);
		
		if(rowCount!=0) {
			SQL = "select * from p_review where pr_id=?";
			reviewInfo = template.queryForObject(SQL, new Object[] {reviewId}, new ProductReviewRowMapper());
		}
		if(reviewInfo == null) {
			throw new IllegalArgumentException("일치하는 리뷰를 찾을 수 없습니다.");
		}
		
		return reviewInfo;
	}

	@Override
	public void setNewReview(ProductReview productReview) {
		String SQL = "INSERT INTO p_review (pr_id,p_productId,p_userId,p_date,p_content,p_rating,p_name,p_title)"+"VALUES(?,?,?,?,?,?,?,?)";
		template.update(SQL,productReview.getReviewId(),productReview.getProductId(),productReview.getUserId(),productReview.getReviewDate(),productReview.getReviewContent(),productReview.getReviewRating(),productReview.getName(),productReview.getTitle());
	}

	@Override
	public void setUpdateReview(ProductReview productReview) {
		
		String SQL = "update p_review set p_productId=?,p_userId=?,p_date=?,p_content=?,p_rating=?,p_name=?,p_title=? where pr_id=?";
		
		template.update(SQL,productReview.getProductId(),productReview.getUserId(),productReview.getReviewDate(),productReview.getReviewContent(),productReview.getReviewRating(),productReview.getName(),productReview.getTitle(),productReview.getReviewId());
		
	}

	@Override
	public void setDeleteReview(String reviewId) {
		String SQL = "delete from p_review where pr_id=?";
		this.template.update(SQL,reviewId);
		
	}

	@Override
	public List<ProductReview> readProductAllReviewList(String productId) {
		
		String SQL = "SELECT * FROM p_review WHERE p_productId=?";
		List<ProductReview> listOfProductReviews = template.query(SQL, new Object[] {productId}, new ProductReviewRowMapper());
		
		return listOfProductReviews; 
	}

	@Override
	public double calculateAvgScore(String productId) {
		String SQL = "select round(avg(p_rating),1) from p_review where p_productId=?";
		Double avgScore = template.queryForObject(SQL, new Object[] {productId},Double.class);
		
		return avgScore != null ? avgScore : 0.0;
	}

}
