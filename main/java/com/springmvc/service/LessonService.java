package com.springmvc.service;

import java.util.List;


import com.springmvc.domain.Lesson;

public interface LessonService 
{
   List<Lesson> readAllClass();
   
   List<Lesson> readClassListByCategory(String category);
   
   Lesson readClassById(String classId);
   void setNewClass(Lesson lesson);// 
   
   void setUpdateClass(Lesson lesson);
   void setDeleteClass(String classId);
   
	List<Lesson> findByPosition(String position);

}