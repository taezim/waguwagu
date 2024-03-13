package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Hospitalqna;
import com.springmvc.repository.QnAHospitalRepository;


@Service
public class QnAHospitalServiceImpl implements QnAHospitalService{

	@Autowired
	private QnAHospitalRepository qnaRepository;

	@Override
	public List<Hospitalqna> readAllhospitalqnaList() {
		// TODO Auto-generated method stub
		return qnaRepository.readAllhospitalqnaList();
	}

	@Override
	public Hospitalqna readHospitalqnaBynumber(String hospitalnumber) {
		// TODO Auto-generated method stub
		Hospitalqna qnaBynumber = qnaRepository.readHospitalqnaBynumber(hospitalnumber);
		    return qnaBynumber;
	}

	@Override
	public List<Hospitalqna> readHospitalqnaListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createHospitalqna(Hospitalqna qna) {
		// TODO Auto-generated method stub
		qnaRepository.createHospitalqna(qna);
	}

	@Override
	public void updateHospital(Hospitalqna hospitalqna) {
		// TODO Auto-generated method stub
		System.out.println("qna update Service");
		System.out.println("qna : " + hospitalqna);
		System.out.println("qna number : " +hospitalqna.getHospitalid());
		qnaRepository.updateHospitalqna(hospitalqna);
	}

	
	@Override
	public void deleteHospital(String number) {
		// TODO Auto-generated method stub
		qnaRepository.deleteHospitalqna(number);
	}

	


}
