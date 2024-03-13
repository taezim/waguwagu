package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Classanswer;
import com.springmvc.domain.Hospitalanswer;
import com.springmvc.domain.Productanswer;

@Repository
public class AnswerProductRepositoryImpl implements AnswerProductRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}

	private List<Hospitalanswer> listOfhospitalanswer = new ArrayList<Hospitalanswer>();
	private List<Productanswer> listOfproductanswer = new ArrayList<Productanswer>();
	private List<Classanswer> listOfclassanswer = new ArrayList<Classanswer>();
	



	@Override
	public List<Productanswer> readAllProductanswerList() {
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM productanswer";
		List<Productanswer> listOfProductanswer = template.query(SQL, new ProductAnswerRowMapper());
		System.out.println("repository : " + listOfProductanswer);    
		return listOfProductanswer;
	}

	public Productanswer readProductanswerBynumber(String productnumber) {
	    // TODO Auto-generated method stub
	    System.out.println("answer 조회 Repository");
	    Productanswer productanswerInfo = null;

	    String SQL = "select count(*) from productanswer where productid=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, productnumber);
	    if (rowCount != 0) {
	        SQL = "select * from productanswer where productid = ?";
	        productanswerInfo = template.queryForObject(SQL, new Object[] {productnumber}, new ProductAnswerRowMapper());
	        System.out.println(productanswerInfo);
	    } else {
	        System.out.println("해당 productid에 대한 데이터가 없습니다.");
	    }

	    return productanswerInfo;
	}

	@Override
	public List<Productanswer> readProductanswerListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createProductlanswer(Productanswer productanswer) {
		// TODO Auto-generated method stub
		System.out.println("add Repository");
		String SQL = "INSERT INTO productanswer (answernumber,questionnumber,respondentid,answercontent,replaydate,productid)" + "VALUES(?,?,?,?,?,?)";
		
		template.update(SQL, productanswer.getAnswernumber(),productanswer.getQuestionnumber(),productanswer.getRespondentid(),
				productanswer.getAnswercontent(),productanswer.getReplaydate(),productanswer.getProductid());
		
		listOfproductanswer.add(productanswer);
	}

	@Override
	public void updateProductanswer(Productanswer productanswer) {
		 System.out.println("answer update Repository");
	    System.out.println("answer: " + productanswer);
	    System.out.println("answer number: " + productanswer.getProductid());

	    String SQL = "UPDATE productanswer SET questionnumber=?, respondentid=?, answercontent=?, replaydate=?  WHERE productid=?";
	    template.update(SQL, productanswer.getQuestionnumber(), productanswer.getRespondentid(), productanswer.getAnswercontent(),productanswer.getReplaydate(), productanswer.getAnswernumber());
	    
	}

	@Override
	public void deleteProductanswer(String number) {
		// TODO Auto-generated method stub
		String SQL = "delete from productanswer where productid = ?";
		this.template.update(SQL, number);
	}

	
	
	

}
