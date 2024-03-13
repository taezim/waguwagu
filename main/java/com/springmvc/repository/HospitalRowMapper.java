package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Hospital;

public class HospitalRowMapper implements RowMapper<Hospital>{

	public Hospital mapRow(ResultSet rs, int rowNum) throws SQLException{
		Hospital hospital = new Hospital();
		hospital.setHospitalId(rs.getString(1));
		hospital.setHospitalName(rs.getString(2));
		hospital.setHospitalPlace(rs.getString(3));
		hospital.setHospitalNumber(rs.getString(4));
		hospital.setHospitalReview(rs.getString(5));
		hospital.setHospitalSubject(rs.getString(6));
		hospital.setFileName(rs.getString(7));
		hospital.setHospitalContent(rs.getString(8));
		
		return hospital;
	}
}
