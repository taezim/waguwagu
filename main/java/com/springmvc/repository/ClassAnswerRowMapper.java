package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Classanswer;

public class ClassAnswerRowMapper implements RowMapper<Classanswer>{

	
	//Hospital

	@Override
	public Classanswer mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Classanswer classanswer = new Classanswer();
		classanswer.setAnswernumber(rs.getString(1));
		classanswer.setQuestionnumber(rs.getString(2));
		classanswer.setRespondentid(rs.getString(3));
		classanswer.setAnswercontent(rs.getString(4));
		classanswer.setReplaydate(rs.getString(5));
		classanswer.setClassid(rs.getString(6));
		
		return classanswer;
	}
	
	
}
