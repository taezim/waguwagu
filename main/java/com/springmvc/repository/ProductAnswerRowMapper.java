package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Productanswer;

public class ProductAnswerRowMapper implements RowMapper<Productanswer>{

	
	//Hospital

	@Override
	public Productanswer mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Productanswer productanswer = new Productanswer();
		productanswer.setAnswernumber(rs.getString(1));
		productanswer.setQuestionnumber(rs.getString(2));
		productanswer.setRespondentid(rs.getString(3));
		productanswer.setAnswercontent(rs.getString(4));
		productanswer.setReplaydate(rs.getString(5));
		productanswer.setProductid(rs.getString(6));
		
		
		return productanswer;
	}
	
	
}
