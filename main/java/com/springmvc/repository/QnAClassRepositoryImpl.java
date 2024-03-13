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
public class QnAClassRepositoryImpl implements QnAClassRepository{

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
	public List<Classqna> readAllClassqnaList() {
	    // TODO Auto-generated method stub
	    String SQL = "SELECT * FROM classqna";
	    List<Classqna> listOfClassqna = template.query(SQL, new ClassQnARowMapper());
	    return listOfClassqna;
	}

	@Override
	public Classqna readClassqnaBynumber(String classnumber) {
	    // TODO Auto-generated method stub
	    System.out.println("qna 조회 Repository");
	    Classqna classqnaInfo = null;

	    String SQL = "select count(*) from classqna where classid=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, classnumber);
	    if (rowCount != 0) {
	        SQL = "select * from classqna where classid = ?";
	        classqnaInfo = template.queryForObject(SQL, new Object[] {classnumber}, new ClassQnARowMapper());
	    }
	    System.out.println(classqnaInfo);
	    return classqnaInfo;
	}

	@Override
	public List<Classqna> readClassqnaListByCategory(String category) {
	    // TODO Auto-generated method stub
	    return null;
	}

	@Override
	public void createClassqna(Classqna classqna) {
	    // TODO Auto-generated method stub
	    System.out.println("add Repository");
	    String SQL = "INSERT INTO classqna (name,  email, classid, content)" + "VALUES(?,?,?,?)";
	    
	    template.update(SQL, classqna.getName() , classqna.getEmail(),
	    		classqna.getClassid(),classqna.getContent());
	    
	    listOfclassqna.add(classqna);
	}

	@Override
	public void updateClassqna(Classqna classqnb) {
	     System.out.println("qna update Repository");
	    System.out.println("qna: " + classqnb);
	    System.out.println("qna number: " + classqnb.getClassid());

	    String SQL = "UPDATE classqna SET email=?, classid=?, content=? WHERE classid=?";
	    template.update(SQL, classqnb.getEmail(), classqnb.getClassid(), classqnb.getContent(), classqnb.getClassid());
	}

	@Override
	public void deleteClassqna(String number) {
	    // TODO Auto-generated method stub
	    String SQL = "delete from classqna where classid = ?";
	    this.template.update(SQL, number);
	}
	
	
	

}
