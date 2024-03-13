package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Lesson;


public class LessonRowMapper implements RowMapper<Lesson>
{
   /*변수 9개*/
   @Override
   public Lesson mapRow(ResultSet rs, int rowNum) throws SQLException 
   {
      Lesson ls = new Lesson();
      ls.setClassId(rs.getString(1));
      ls.setClassName(rs.getString(2));
      ls.setCoachId(rs.getString(3));
      ls.setSubject(rs.getString(4));
      ls.setVenue(rs.getString(5));
      ls.setManagerName(rs.getString(6));
      ls.setTel(rs.getString(7));
      ls.setAuditors(rs.getInt(8));
      ls.setFees(rs.getInt(9));
      ls.setDescription(rs.getString(10));
      
      return ls; // lesson 객체를 반환함
   }
   
}