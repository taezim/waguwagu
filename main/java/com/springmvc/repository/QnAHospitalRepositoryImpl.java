package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Classqna;
import com.springmvc.domain.Hospitalqna;
import com.springmvc.domain.Productqna;

@Repository
public class QnAHospitalRepositoryImpl implements QnAHospitalRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}

	private List<Hospitalqna> listOfhospitalqna = new ArrayList<Hospitalqna>();
	private List<Productqna> listOfproductqna = new ArrayList<Productqna>();
	private List<Classqna> listOfclassqna = new ArrayList<Classqna>();
	
	@Override
	public List<Hospitalqna> readAllhospitalqnaList() {
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM hospitalqna";
		List<Hospitalqna> listOfhospitalqna = template.query(SQL, new HospitalQnARowMapper());
		return listOfhospitalqna;
	}

	@Override
	public Hospitalqna readHospitalqnaBynumber(String hospitalnumber) {
		// TODO Auto-generated method stub
		System.out.println("qna 조회 Repository");
		Hospitalqna hospitalqnaInfo = null;

	    String SQL = "select count(*) from hospitalqna where hospitalid=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, hospitalnumber);
	    if (rowCount != 0) {
	        SQL = "select * from hospitalqna where hospitalid = ?";
	        hospitalqnaInfo = template.queryForObject(SQL, new Object[] {hospitalnumber}, new HospitalQnARowMapper());
	    }
	    System.out.println(hospitalqnaInfo);
	    return hospitalqnaInfo;
	}

	@Override
	public List<Hospitalqna> readHospitalqnaListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createHospitalqna(Hospitalqna hospitalqna) {
		// TODO Auto-generated method stub
		System.out.println("add Repository");
		String SQL = "INSERT INTO hospitalqna (name,email , hospitalid, content)" + "VALUES(?,?,?,?)";
		
		template.update(SQL, hospitalqna.getName(),hospitalqna.getEmail(),hospitalqna.getHospitalid(),
				hospitalqna.getContent());
		
		listOfhospitalqna.add(hospitalqna);
	}

	@Override
	public void updateHospitalqna(Hospitalqna hospitalqna) {
		 System.out.println("qna update Repository");
		    System.out.println("qna: " + hospitalqna);
		    System.out.println("qna number: " + hospitalqna.getHospitalid());

		    String SQL = "UPDATE hospitalqna SET name=?, content=?, email=?, date=?  WHERE hospitalid=?";
		    template.update(SQL, hospitalqna.getName(),hospitalqna.getContent(), hospitalqna.getEmail(), hospitalqna.getDate(), hospitalqna.getHospitalid());
		    
	}
	
	@Override
	public void deleteHospitalqna(String number) {
		// TODO Auto-generated method stub
		String SQL = "delete from hospitalqna where hospitalid = ?";
		this.template.update(SQL, number);
	}
	
	

}
