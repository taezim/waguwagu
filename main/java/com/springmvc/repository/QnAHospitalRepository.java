package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Hospitalqna;

public interface QnAHospitalRepository {
	
	
	//Hospital

	//모두 가져올 때

	List<Hospitalqna> readAllhospitalqnaList();
	
	//하나만 가져올 때 

	Hospitalqna readHospitalqnaBynumber(String hospitalnumber);

	//카테고리에 따라 가져올때

	List<Hospitalqna> readHospitalqnaListByCategory(String category);
	
	//C
	
	void createHospitalqna(Hospitalqna qna);

	//U
	void updateHospitalqna(Hospitalqna hospitalqna); 

	//D
	void deleteHospitalqna(String hospitalid);
	
	
}
