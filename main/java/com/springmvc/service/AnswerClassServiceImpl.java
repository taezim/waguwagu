package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Classanswer;
import com.springmvc.repository.AnswerClassRepository;


@Service
public class AnswerClassServiceImpl implements AnswerClassService{

	@Autowired
	private AnswerClassRepository answerRepository;

	@Override
	public List<Classanswer> readAllclassanswerLists() {
		// TODO Auto-generated method stub
		System.out.println("service : ");    
		return answerRepository.readAllClassanswerList();
	}

	@Override
	public Classanswer readClassanswerBynumber(String classnumber) {
		// TODO Auto-generated method stub
		Classanswer answerBynumber = answerRepository.readClassanswerBynumber(classnumber);
		System.out.println("service");    
		return answerBynumber;
		    
	}

	@Override
	public List<Classanswer> readClassanswerListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createClassanswer(Classanswer answer) {
		// TODO Auto-generated method stub
		answerRepository.createClassanswer(answer);
	}

	@Override
	public void updateClassanswer(Classanswer classanswer) {
		// TODO Auto-generated method stub
		System.out.println("answer number : " +classanswer.getClassid());
		answerRepository.updateClassanswer(classanswer);
	}


	@Override
	public void deleteClassanswer(String number) {
		// TODO Auto-generated method stub
		answerRepository.deleteClassanswer(number);
	}

	

	


}
