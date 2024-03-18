package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.LessonRegistration;

public interface LessonRegistRepository 
{
	List<LessonRegistration> readAllLessonRegist(String memberId);
	LessonRegistration readLessonRegistById(String registrationId);
	
	void setNewLessonRegist(LessonRegistration LR);
	void setUpdateLessonRegist(LessonRegistration LR);
	void setCancelLessonRegist(String registrationId);
	
}
