package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Hospitalanswer;

public interface AnswerHospitalService {

		//Hospital
	
		//모두 가져올 때
	
		List<Hospitalanswer> readAllhospitalanswerLists();
		
		//하나만 가져올 때 

		Hospitalanswer readHospitalanswerBynumber(String hospitalnumber);

		//카테고리에 따라 가져올때

		List<Hospitalanswer> readHospitalanswerListByCategory(String category);
		
		//C
		
		void createHospitalanswer(Hospitalanswer answer);

		//U
		void updateHospital(Hospitalanswer hospitalanswer); 

		//D
		void deleteHospital(String hospitalid);
		
	
}
