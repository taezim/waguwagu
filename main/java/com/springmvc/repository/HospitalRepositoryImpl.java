package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Hospital;


@Repository
public class HospitalRepositoryImpl implements HospitalRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public List<Hospital> readAllHospitalList() {
		String SQL = "SELECT * FROM hospital";
		List<Hospital> listOfHospitals = template.query(SQL, new HospitalRowMapper());
		return listOfHospitals;
	}

	@Override
	public List<Hospital> readHospitalListBySubject(String hospitalSubject) {

		List<Hospital> hospitalBySubject = new ArrayList<Hospital>();
		
		String SQL = "SELECT * FROM hospital WHERE h_subject LIKE '%"+hospitalSubject+"%'";
		hospitalBySubject = template.query(SQL, new HospitalRowMapper());
		return hospitalBySubject;
	}

	@Override
	public Hospital readHospitalById(String hospitalId) {
		Hospital hospitalInfo = null;
		
		String SQL = "SELECT COUNT(*) FROM hospital WHERE h_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, hospitalId);
		
		if(rowCount!=0) {
			SQL="SELECT * FROM hospital WHERE h_id=?";
			hospitalInfo = template.queryForObject(SQL, new Object[] {hospitalId}, new HospitalRowMapper());
		}
		if(hospitalInfo == null) {
			throw new IllegalArgumentException("일치하는 병원을 찾을 수 없습니다.");
		}
		return hospitalInfo;
	}

	
	@Override
	public void setNewHospital(Hospital hospital) {
		
		String SQL = "INSERT INTO hospital (h_id,h_name,h_place,h_number,h_reviewnumber,h_subject,h_filename,h_content)"+"VALUES(?,?,?,?,?,?,?,?)";
		template.update(SQL,hospital.getHospitalId(),hospital.getHospitalName(),hospital.getHospitalPlace(),hospital.getHospitalNumber(),hospital.getHospitalReview(),hospital.getHospitalSubject(),hospital.getFileName(),hospital.getHospitalContent());
		
	}

	
	@Override
	public void setUpdateHospital(Hospital hospital) {
		
		if(hospital.getFileName()!=null) {
			String SQL = "UPDATE hospital SET h_name=?,h_place=?,h_number=?,h_reviewnumber=?,h_subject=?,h_filename=?,h_content=? WHERE h_id=?";
			template.update(SQL,hospital.getHospitalName(),hospital.getHospitalPlace(),hospital.getHospitalNumber(),hospital.getHospitalReview(),hospital.getHospitalSubject(),hospital.getFileName(),hospital.getHospitalContent(),hospital.getHospitalId());
		}
		else if(hospital.getFileName()==null) 
		{
			String SQL = "UPDATE hospital SET h_name=?,h_place=?,h_number=?,h_reviewnumber=?,h_subject=?,h_content=? WHERE h_id=?";
			template.update(SQL,hospital.getHospitalName(),hospital.getHospitalPlace(),hospital.getHospitalNumber(),hospital.getHospitalReview(),hospital.getHospitalSubject(),hospital.getHospitalContent(),hospital.getHospitalId());
		
		}
		
	}

	
	@Override
	public void setDeleteHospital(String hospitalId) {
		String SQL = "DELETE FROM hospital WHERE h_id=?";
		this.template.update(SQL,hospitalId);
		
	}
	

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

}
