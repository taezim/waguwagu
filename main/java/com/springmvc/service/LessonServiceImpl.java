package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Lesson;
import com.springmvc.repository.LessonRepository;

@Service
public class LessonServiceImpl implements LessonService
{
   @Autowired LessonRepository lsRepository;
   
   
   @Override
   public List<Lesson> readAllClass() {
      // TODO Auto-generated method stub
      return lsRepository.readAllClass();
   }

   @Override
   public List<Lesson> readClassListByCategory(String category) 
   {
      List<Lesson> lessonsByCategory = lsRepository.readClassListByCategory(category);
      return  lessonsByCategory;
   }

   @Override
   public Lesson readClassById(String classId) 
   {
      Lesson lessonById = lsRepository.readClassById(classId);
      return lessonById;
   }

   @Override
   public void setNewClass(Lesson lesson) 
   {
      lsRepository.setNewClass(lesson);
   }

   @Override
   public void setUpdateClass(Lesson lesson) 
   {
      lsRepository.setUpdateClass(lesson);
   }

   @Override
   public void setDeleteClass(String classId) 
   {
      lsRepository.setDeleteClass(classId);
   }

@Override
public List<Lesson> findByPosition(String position) {
	// TODO Auto-generated method stub
	return lsRepository.findByPosition(position);
}

}