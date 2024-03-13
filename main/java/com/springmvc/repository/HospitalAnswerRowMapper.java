package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Hospitalanswer;

public class HospitalAnswerRowMapper implements RowMapper<Hospitalanswer>{

	
	//Hospital

	@Override
	public Hospitalanswer mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Hospitalanswer hospitalanswer = new Hospitalanswer();
		hospitalanswer.setAnswernumber(rs.getString(1));
		hospitalanswer.setQuestionnumber(rs.getString(2));
		hospitalanswer.setRespondentid(rs.getString(3));
		hospitalanswer.setAnswercontent(rs.getString(4));
		hospitalanswer.setReplaydate(rs.getString(5));
		hospitalanswer.setHospitalid(rs.getString(6));
		
		return hospitalanswer;
	}
	
	
}
