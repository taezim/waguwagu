package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Hospitalanswer;
import com.springmvc.repository.AnswerHospitalRepository;


@Service
public class AnswerHospitalServiceImpl implements AnswerHospitalService{

	@Autowired
	private AnswerHospitalRepository answerRepository;

	@Override
	public List<Hospitalanswer> readAllhospitalanswerLists() {
		// TODO Auto-generated method stub
		System.out.println("service : ");    
		return answerRepository.readAllhospitalanswerLists();
	}

	@Override
	public Hospitalanswer readHospitalanswerBynumber(String hospitalnumber) {
		// TODO Auto-generated method stub
		Hospitalanswer answerBynumber = answerRepository.readHospitalanswerBynumber(hospitalnumber);
		System.out.println("service");    
		return answerBynumber;
		    
	}

	@Override
	public List<Hospitalanswer> readHospitalanswerListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createHospitalanswer(Hospitalanswer answer) {
		// TODO Auto-generated method stub
		answerRepository.createHospitalanswer(answer);
	}

	@Override
	public void updateHospital(Hospitalanswer hospitalanswer) {
		// TODO Auto-generated method stub
		System.out.println("answer number : " +hospitalanswer.getHospitalid());
		answerRepository.updateHospitalanswer(hospitalanswer);
	}

	
	@Override
	public void deleteHospital(String number) {
		// TODO Auto-generated method stub
		answerRepository.deleteHospitalanswer(number);
	}

	


}
