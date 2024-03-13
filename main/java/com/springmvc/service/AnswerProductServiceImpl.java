package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Productanswer;
import com.springmvc.repository.AnswerProductRepository;


@Service
public class AnswerProductServiceImpl implements AnswerProductService{

	@Autowired
	private AnswerProductRepository answerRepository;

	@Override
	public List<Productanswer> readAllProductanswerList() {
	    System.out.println("service: ");
	    return answerRepository.readAllProductanswerList();
	}

	@Override
	public Productanswer readProductanswerBynumber(String productNumber) {
		Productanswer answerByNumber = answerRepository.readProductanswerBynumber(productNumber);
	    System.out.println("service");
	    return answerByNumber;
	}

	@Override
	public List<Productanswer> readProductanswerListByCategory(String category) {
	    // 구현 필요
	    return null;
	}

	@Override
	public void createProductlanswer(Productanswer answer) {
	    answerRepository.createProductlanswer(answer);
	}

	@Override
	public void updateProductanswer(Productanswer productAnswer) {
	    System.out.println("answer number: " + productAnswer.getProductid());
	    answerRepository.updateProductanswer(productAnswer);
	}

	@Override
	public void deleteProductanswer(String number) {
	    answerRepository.deleteProductanswer(number);
	}

	


}
