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
public class QnAProductRepositoryImpl implements QnAProductRepository{

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
	public List<Productqna> readAllProductqnaList() {
	    // TODO Auto-generated method stub
	    String SQL = "SELECT * FROM productqna";
	    List<Productqna> listOfProductqna = template.query(SQL, new ProductQnARowMapper());
	    return listOfProductqna;
	}

	@Override
	public Productqna readProductqnaBynumber(String productnumber) {
	    System.out.println("qna 조회 Service");
	    Productqna productqnaInfo = null;

	    String SQL = "SELECT * FROM productqna WHERE productid = ?";
	    List<Productqna> result = template.query(SQL, new Object[]{productnumber}, new ProductQnARowMapper());

	    if (!result.isEmpty()) {
	        productqnaInfo = result.get(0);
	    }

	    System.out.println("productqnaInfo : " + productqnaInfo);
	    return productqnaInfo;
	}

	@Override
	public List<Productqna> readProductqnaListByCategory(String category) {
	    // TODO Auto-generated method stub
	    return null;
	}

	@Override
	public void createProductlqna(Productqna productqna) {
	    // TODO Auto-generated method stub
	    System.out.println("add Repository");
	    String SQL = "INSERT INTO productqna (name,  email, productid, content)" + "VALUES(?,?,?,?)";
	    
	    template.update(SQL, productqna.getName() , productqna.getEmail(),
	             productqna.getProductid(),productqna.getContent());
	    
	    listOfproductqna.add(productqna);
	}

	@Override
	public void updateProductqna(Productqna productqna) {
	     System.out.println("qna update Repository");
	    System.out.println("qna: " + productqna);
	    System.out.println("qna number: " + productqna.getProductid());

	    String SQL = "UPDATE productqna SET email=?, productid=?, content=? WHERE productid=?";
	    template.update(SQL, productqna.getEmail(), productqna.getProductid(), productqna.getContent(), productqna.getProductid());
	    
	}

	@Override
	public void deleteProductqna(String number) {
	    // TODO Auto-generated method stub
	    String SQL = "delete from productqna where productid = ?";
	    this.template.update(SQL, number);
	}
	
	
	
	

}
