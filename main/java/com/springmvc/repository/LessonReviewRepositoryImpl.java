package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.LessonReview;

@Repository
public class LessonReviewRepositoryImpl implements LessonReviewRepository{

	private JdbcTemplate template;

	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public List<LessonReview> readAllReviewList(String lessonId) {
		
		String SQL = "SELECT * FROM l_review WHERE lessonid=?";
		List<LessonReview> listOfReviews = template.query(SQL, new Object[] {lessonId}, new LessonReviewRowMapper());
		
		return listOfReviews;
	}

	@Override
	public LessonReview readReviewById(String reviewId) {
		LessonReview reviewInfo = null;
		
		String SQL = "SELECT COUNT(*) FROM l_review WHERE lr_id=?";
		int rowCount = template.queryForObject(SQL,Integer.class, reviewId);
		
		if(rowCount!=0) {
			SQL="SELECT * FROM l_review WHERE lr_id=?";
			reviewInfo = template.queryForObject(SQL,new Object[] {reviewId}, new LessonReviewRowMapper());
		}
		if(reviewInfo==null) {
			throw new IllegalArgumentException("일치하는 리뷰를 찾을 수 없습니다.");
		}
		return reviewInfo;
	}

	@Override
	public void setNewReview(LessonReview lessonReview) {
		String SQL = "INSERT INTO l_review (lr_id, lessonid, lr_userId, lr_date, lr_content, lr_score, name, title)"+"VALUES(?, ?, ?, ?, ?, ?,?,?)";
		template.update(SQL,lessonReview.getReviewId(), lessonReview.getLessonId(), lessonReview.getUserId(), lessonReview.getDate(), lessonReview.getContent(), lessonReview.getScore(), lessonReview.getName(),lessonReview.getTitle());
		
	}

	@Override
	public void setUpdateReview(LessonReview lessonReview) {
		
		
		String SQL = "UPDATE l_review SET lessonid=?, lr_userId=?, lr_date=?, lr_content=?, lr_score=?,name=?,title=? WHERE lr_id=?";
		template.update(SQL,lessonReview.getLessonId(), lessonReview.getUserId(), lessonReview.getDate(), lessonReview.getContent(), lessonReview.getScore(), lessonReview.getName(),lessonReview.getTitle(), lessonReview.getReviewId());
		
		
	}

	@Override
	public void setDeleteReview(String reviewId) {
		String SQL = "DELETE FROM l_review WHERE lr_id=?";
		template.update(SQL,reviewId);
		
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}


	@Override
	public double calculateAvgScore(String lessonId) {
		String SQL = "SELECT ROUND(AVG(lr_score),1) FROM l_review WHERE lessonId=?";
		Double avgScore = template.queryForObject(SQL, new Object[] { lessonId }, Double.class);
		
		return avgScore != null ? avgScore : 0.0;
	}

	

	
}
