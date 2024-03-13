package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Hospitalqna;

public interface QnAHospitalService {

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
		void updateHospital(Hospitalqna hospitalqna); 

		//D
		void deleteHospital(String hospitalid);
		
		
}
