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
public class AnswerHospitalRepositoryImpl implements AnswerHospitalRepository{

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
	public List<Hospitalanswer> readAllhospitalanswerLists() {
		// TODO Auto-generated method stub
		String SQL = "SELECT * FROM hospitalanswer";
		List<Hospitalanswer> listOfhospitalanswer = template.query(SQL, new HospitalAnswerRowMapper());
		System.out.println("repository : " + listOfhospitalanswer);    
		return listOfhospitalanswer;
	}

	public Hospitalanswer readHospitalanswerBynumber(String hospitalnumber) {
	    // TODO Auto-generated method stub
	    System.out.println("answer 조회 Repository");
	    Hospitalanswer hospitalanswerInfo = null;

	    String SQL = "select count(*) from hospitalanswer where hospitalid=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, hospitalnumber);
	    if (rowCount != 0) {
	        SQL = "select * from hospitalanswer where hospitalid = ?";
	        hospitalanswerInfo = template.queryForObject(SQL, new Object[] {hospitalnumber}, new HospitalAnswerRowMapper());
	        System.out.println(hospitalanswerInfo);
	    } else {
	        System.out.println("해당 hospitalid에 대한 데이터가 없습니다.");
	    }

	    return hospitalanswerInfo;
	}

	@Override
	public List<Hospitalanswer> readHospitalanswerListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void createHospitalanswer(Hospitalanswer hospitalanswer) {
	    // Hospitalanswer 객체에서 필요한 정보를 확인합니다.
	    System.out.println("add Repository 나는 레파지토리 : " + hospitalanswer.getHospitalid());
	    
	    // SQL 쿼리를 실행하여 데이터베이스에 등록합니다.
	    String SQL = "INSERT INTO hospitalanswer (questionnumber,respondentid,answercontent,hospitalid) VALUES (?, ?, ?, ?)";
	    template.update(SQL, hospitalanswer.getQuestionnumber(), hospitalanswer.getRespondentid(),
	                    hospitalanswer.getAnswercontent(), hospitalanswer.getHospitalid());
	}
	@Override
	public void updateHospitalanswer(Hospitalanswer hospitalanswer) {
		 System.out.println("answer update Repository");
		    System.out.println("answer: " + hospitalanswer);
		    System.out.println("answer number: " + hospitalanswer.getHospitalid());

		    String SQL = "UPDATE hospitalanswer SET questionnumber=?, respondentid=?, answercontent=?, replaydate=?  WHERE hospitalid=?";
		    template.update(SQL, hospitalanswer.getQuestionnumber(), hospitalanswer.getRespondentid(), hospitalanswer.getAnswercontent(),hospitalanswer.getReplaydate(), hospitalanswer.getAnswernumber());
		    
	}
	
	@Override
	public void deleteHospitalanswer(String number) {
		// TODO Auto-generated method stub
		String SQL = "delete from hospitalanswer where hospitalid = ?";
		this.template.update(SQL, number);
	}

	
	
	

}
