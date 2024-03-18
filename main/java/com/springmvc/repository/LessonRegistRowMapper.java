package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.LessonRegistration;

public class LessonRegistRowMapper implements RowMapper<LessonRegistration>
{
	@Override
	public LessonRegistration mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		LessonRegistration regist = new LessonRegistration();
		regist.setRegistrationId(rs.getLong(1));
		regist.setLessonId(rs.getString(2));
		regist.setLessonName(rs.getString(3));
		regist.setCoachId(rs.getString(4));
		regist.setCoachName(rs.getString(5));
		regist.setRegistDate(rs.getString(6));
		regist.setStudentId(rs.getString(7));
		regist.setStudentName(rs.getString(8));
		regist.setPhone(rs.getString(9));
		regist.setNotes(rs.getString(10));
		regist.setPaymentStatus(rs.getInt(11));
		return regist;
	}

}
