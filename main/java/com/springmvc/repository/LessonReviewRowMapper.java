package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.LessonReview;

public class LessonReviewRowMapper implements RowMapper<LessonReview>{

	@Override
	public LessonReview mapRow(ResultSet rs, int rowNum) throws SQLException {
		LessonReview lessonReview = new LessonReview();
		lessonReview.setReviewId(rs.getString(1));
		lessonReview.setLessonId(rs.getString(2));
		lessonReview.setUserId(rs.getString(3));
		lessonReview.setDate(rs.getString(4));
		lessonReview.setContent(rs.getString(5));
		lessonReview.setScore(rs.getInt(6));
		lessonReview.setName(rs.getString(7));
		lessonReview.setTitle(rs.getString(8));
		return lessonReview;
	}



}
