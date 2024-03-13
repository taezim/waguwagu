package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Classqna;

public class ClassQnARowMapper implements RowMapper<Classqna>{

	


	//Class
	
	public Classqna mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		Classqna classqna = new Classqna();
		classqna.setNumber(rs.getString(1));
		classqna.setName(rs.getString(2));
		classqna.setContent(rs.getString(3));
		classqna.setEmail(rs.getString(4));
		classqna.setDate(rs.getString(5));
		classqna.setClassid(rs.getString(6));
		
		
		return classqna;
	}
}
