package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Lesson;


@Repository
public class LessonRepositoryImpl implements LessonRepository
{
   private JdbcTemplate template;
   private List<Lesson> listOfLessons = new ArrayList<Lesson>();
   
   @Autowired
   public void setJdbcTemplate(DataSource dataSource) 
   {
       this.template = new JdbcTemplate(dataSource);
   }
   
   
   @Override
   public List<Lesson> readAllClass() 
   {
      String SQL = "SELECT * FROM lesson";
       List<Lesson> listOfLessons = template.query(SQL, new LessonRowMapper());
         
       return listOfLessons;
   }

   @Override
   public List<Lesson> readClassListByCategory(String subject) 
   { 
      List<Lesson> lessonsBySubject = new ArrayList<Lesson>();
      
      String SQL = "SELECT * FROM lesson where c_subject LIKE '%"+subject+"%'";
      lessonsBySubject = template.query(SQL, new LessonRowMapper());
   
      return lessonsBySubject;
   }

   @Override
   public Lesson readClassById(String classId) 
   {
      Lesson lessonInfo = null;

       //17장 데이터베이스와연동
       String SQL = "SELECT count(*) FROM lesson where c_id=?";
       int rowCount = template.queryForObject(SQL, Integer.class, classId);
       if(rowCount != 0) {
          SQL = "SELECT * FROM lesson where c_id=?";
          lessonInfo = template.queryForObject(SQL, new Object[] {classId},new  LessonRowMapper());
       }
       
       if(lessonInfo == null) {
          throw new IllegalArgumentException("사용자 id가 " +classId+"인 프로필을 찾을 수 없습니다.");
       }
       return lessonInfo;
   }

   @Override
   public void setNewClass(Lesson ls) 
   {
      String SQL = "insert into lesson(c_id, c_name, c_coachId, c_subject, c_venue, c_managerName, c_tel, c_auditors, c_fees, c_description)" + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

       template.update(SQL, ls.getClassId(), ls.getClassName(), ls.getCoachId(), ls.getSubject(), ls.getVenue(), ls.getManagerName(), ls.getTel(), ls.getAuditors(), ls.getFees(), ls.getDescription());
         
      
   }

   @Override
   public void setUpdateClass(Lesson ls) 
   {
      
       String SQL = "UPDATE lesson SET c_name=?, c_coachId=?, c_subject=?, c_venue=?,c_managerName=?, c_tel=?, c_auditors=?, c_fees=?, c_description=? where c_id=?";
       template.update(SQL, ls.getClassName(), ls.getCoachId(), ls.getSubject(), ls.getVenue(), ls.getManagerName(), ls.getTel(), ls.getAuditors(), ls.getFees(),ls.getDescription(), ls.getClassId());
        
      
   }

   @Override
   public void setDeleteClass(String classId) 
   {
       String SQL = "DELETE from lesson where c_id=?";
         this.template.update(SQL, classId);
      
   }


@Override
public List<Lesson> findByPosition(String position) {
	if (StringUtils.isBlank(position)) {
        // 빈 문자열이나 null이면 전체 조회
        String SQL = "SELECT * FROM lesson";
        return template.query(SQL, new LessonRowMapper());
    } else {
        // 아니면 지정된 지역을 조회
        String SQL = "SELECT * FROM lesson WHERE c_subject LIKE ?";
        String parameter = "%" + position + "%";
        return template.query(SQL, new Object[] {parameter}, new LessonRowMapper());
    }
}
   
   
}