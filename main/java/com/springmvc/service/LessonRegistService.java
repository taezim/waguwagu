package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.LessonRegistration;

public interface LessonRegistService 
{
	List<LessonRegistration> readAllLessonRegist(String memberId);
	LessonRegistration readLessonRegistById(String registrationId);
	
	void setNewLessonRegist(LessonRegistration LR);
	void setUpdateLessonRegist(LessonRegistration LR); // 결제 상태 update
	void setCancelLessonRegist(String registrationId);
}
