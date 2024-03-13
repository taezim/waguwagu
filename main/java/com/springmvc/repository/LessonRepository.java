package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Lesson;

public interface LessonRepository 
{
   List<Lesson> readAllClass();
   
   List<Lesson> readClassListByCategory(String category);
   
   Lesson readClassById(String classId);
   void setNewClass(Lesson ls);// 
   
   void setUpdateClass(Lesson ls);
   void setDeleteClass(String classId);
   
   List<Lesson> findByPosition(String position);
}