package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.LessonRegistration;
import com.springmvc.repository.LessonRegistRepository;

@Service
public class LessonRegistServiceImpl implements LessonRegistService
{

	@Autowired
	LessonRegistRepository lrr;
	
	@Override
	public List<LessonRegistration> readAllLessonRegist(String memberId) {
		
		return lrr.readAllLessonRegist(memberId);
	}

	@Override
	public LessonRegistration readLessonRegistById(String registrationId) {
		// TODO Auto-generated method stub
		return lrr.readLessonRegistById(registrationId);
	}

	@Override
	public void setNewLessonRegist(LessonRegistration LR) 
	{
		lrr.setNewLessonRegist(LR);
	}

	@Override
	public void setUpdateLessonRegist(LessonRegistration LR) 
	{	
		lrr.setUpdateLessonRegist(LR);
	}

	@Override
	public void setCancelLessonRegist(String registrationId) 
	{
		lrr.setCancelLessonRegist(registrationId);
	}

}
