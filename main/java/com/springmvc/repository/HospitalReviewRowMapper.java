package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.HospitalReview;

public class HospitalReviewRowMapper implements RowMapper<HospitalReview>{

	public HospitalReview mapRow(ResultSet rs, int rowNum) throws SQLException{
		HospitalReview hospitalReview = new HospitalReview();
		hospitalReview.setReviewId(rs.getString(1));
		hospitalReview.setHospitalId(rs.getString(2));
		hospitalReview.setUserId(rs.getString(3));
		hospitalReview.setReviewDate(rs.getString(4));
		hospitalReview.setReviewContent(rs.getString(5));
		hospitalReview.setReviewRating(rs.getInt(6));
		hospitalReview.setName(rs.getString(7));
		hospitalReview.setTitle(rs.getString(8));
		return hospitalReview;
	}
}
