package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.LessonRegistration;


@Repository
public class LessonRegistRepositoryImpl implements LessonRegistRepository 
{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) 
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public List<LessonRegistration> readAllLessonRegist(String memberId) 
	{
	    String SQL = "SELECT * FROM lesson_registration where student_id=?";
	    List<LessonRegistration> listOfRegistraion = template.query(SQL, new Object[]{memberId}, new LessonRegistRowMapper());
	    return listOfRegistraion;
	}

	@Override
	public void setNewLessonRegist(LessonRegistration LR) 
	{
		System.out.println("레슨아이디"+LR.getLessonId());
		String SQL = "insert into lesson_registration(l_id, l_name, coachId, coachName, regist_date, student_id, student_name, student_phone, notes, payment_status)" + "values (?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL, LR.getLessonId(), LR.getLessonName(), LR.getCoachId(), LR.getCoachName(), LR.getRegistDate(), LR.getStudentId(), LR.getStudentName(), LR.getPhone(), LR.getNotes(), LR.getPaymentStatus());
	}

	@Override
	public void setUpdateLessonRegist(LessonRegistration LR) 
	{   
	    String SQL = "UPDATE lesson_registration SET notes=?, payment_status=? WHERE registration_id=?"; 
	    template.update(SQL, LR.getNotes(), LR.getPaymentStatus(), LR.getRegistrationId());
		
	}

	@Override
	public void setCancelLessonRegist(String registrationId) 
	{
		String SQL = "DELETE from lesson_registration where registration_id=?";
	    template.update(SQL, registrationId);	
		
	}

	@Override
	public LessonRegistration readLessonRegistById(String registrationId) 
	{
		LessonRegistration LRInfo = null;
		String SQL = "SELECT count(*) FROM lesson_registration where registration_id=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, registrationId);
	    if(rowCount != 0) {
	       SQL = "SELECT * FROM lesson_registration where registration_id=?";
	       LRInfo = template.queryForObject(SQL, new Object[] {registrationId},new  LessonRegistRowMapper());
	    }
	    if(LRInfo == null) {
	       throw new IllegalArgumentException("사용자 id가 " +registrationId+"인 예약정보를 찾을 수 없습니다.");
	    }
		return LRInfo;
	}
	
}
