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
public class AnswerClassRepositoryImpl implements AnswerClassRepository{

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
	public List<Classanswer> readAllClassanswerList() {
	    // TODO Auto-generated method stub
	    String SQL = "SELECT * FROM classanswer";
	    List<Classanswer> listOfclassanswer = template.query(SQL, new ClassAnswerRowMapper());
	    System.out.println("repository : " + listOfclassanswer);    
	    return listOfclassanswer;
	}

	public Classanswer readClassanswerBynumber(String classnumber) {
	    // TODO Auto-generated method stub
	    System.out.println("answer 조회 Repository");
	    Classanswer classanswerInfo = null;

	    String SQL = "select count(*) from classanswer where classid=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, classnumber);
	    if (rowCount != 0) {
	        SQL = "select * from classanswer where classid = ?";
	        classanswerInfo = template.queryForObject(SQL, new Object[] {classnumber}, new ClassAnswerRowMapper());
	        System.out.println(classanswerInfo);
	    } else {
	        System.out.println("해당 classid에 대한 데이터가 없습니다.");
	    }

	    return classanswerInfo;
	}

	@Override
	public List<Classanswer> readClassanswerListByCategory(String category) {
	    // TODO Auto-generated method stub
	    return null;
	}

	@Override
	public void createClassanswer(Classanswer classanswer) {
	    // TODO Auto-generated method stub
	    System.out.println("add Repository");
	    String SQL = "INSERT INTO classanswer (answernumber,questionnumber,respondentid,answercontent,replaydate,classid)" + "VALUES(?,?,?,?,?,?)";
	    
	    template.update(SQL, classanswer.getAnswernumber(),classanswer.getQuestionnumber(),classanswer.getRespondentid(),
	            classanswer.getAnswercontent(),classanswer.getReplaydate(),classanswer.getClassid());
	    
	    listOfclassanswer.add(classanswer);
	}

	@Override
	public void updateClassanswer(Classanswer classanswer) {
	     System.out.println("answer update Repository");
	    System.out.println("answer: " + classanswer);
	    System.out.println("answer number: " + classanswer.getClassid());

	    String SQL = "UPDATE classanswer SET questionnumber=?, respondentid=?, answercontent=?, replaydate=?  WHERE classid=?";
	    template.update(SQL, classanswer.getQuestionnumber(), classanswer.getRespondentid(), classanswer.getAnswercontent(),classanswer.getReplaydate(), classanswer.getAnswernumber());
	}

	@Override
	public void deleteClassanswer(String number) {
	    // TODO Auto-generated method stub
	    String SQL = "delete from classanswer where classid = ?";
	    this.template.update(SQL, number);
	}
	
	

	
	
	

}
