package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Productqna;
import com.springmvc.repository.QnAProductRepository;


@Service
public class QnAProductServiceImpl implements QnAProductService{

	@Autowired
	private QnAProductRepository qnaRepository;

	@Override
	public List<Productqna> readAllProductqnaList() {
	    // TODO Auto-generated method stub
	    return qnaRepository.readAllProductqnaList();
	}

	@Override
	public Productqna readProductqnaBynumber(String productnumber) {
	    // TODO Auto-generated method stub
	    Productqna qnaBynumber = qnaRepository.readProductqnaBynumber(productnumber);
	    System.out.println("qnaBynumber : "+qnaBynumber);
	    return qnaBynumber;
	}

	@Override
	public List<Productqna> readProductqnaListByCategory(String category) {
	    // TODO Auto-generated method stub
	    return null;
	}

	@Override
	public void createProductlqna(Productqna qna) {
	    // TODO Auto-generated method stub
	    qnaRepository.createProductlqna(qna);
	}

	@Override
	public void updateProductqna(Productqna productqna) {
	    // TODO Auto-generated method stub
	    System.out.println("qna update Service");
	    System.out.println("qna : " + productqna);
	    System.out.println("qna number : " + productqna.getProductid());
	    qnaRepository.updateProductqna(productqna);
	}


	@Override
	public void deleteProductqna(String number) {
	    // TODO Auto-generated method stub
	    qnaRepository.deleteProductqna(number);
	}

	

	


}
