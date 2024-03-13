package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Classqna;
import com.springmvc.repository.QnAClassRepository;


@Service
public class QnAClassServiceImpl implements QnAClassService{

	@Autowired
	private QnAClassRepository qnaRepository;

	@Override
	public List<Classqna> readAllClassqnaList() {
	    // TODO Auto-generated method stub
	    return qnaRepository.readAllClassqnaList();
	}

	@Override
	public Classqna readClassqnaBynumber(String classnumber) {
	    // TODO Auto-generated method stub
	    Classqna qnaBynumber = qnaRepository.readClassqnaBynumber(classnumber);
	    return qnaBynumber;
	}

	@Override
	public List<Classqna> readClassqnaListByCategory(String category) {
	    // TODO Auto-generated method stub
	    return null;
	}

	@Override
	public void createClassqna(Classqna qna) {
	    // TODO Auto-generated method stub
	    qnaRepository.createClassqna(qna);
	}

	@Override
	public void updateClassqna(Classqna classqna) {
	    // TODO Auto-generated method stub
	    System.out.println("qna update Service");
	    System.out.println("qna : " + classqna);
	    System.out.println("qna number : " + classqna.getClassid());
	    qnaRepository.updateClassqna(classqna);
	}


	@Override
	public void deleteClassqna(String number) {
	    // TODO Auto-generated method stub
	    qnaRepository.deleteClassqna(number);
	}
	


}
