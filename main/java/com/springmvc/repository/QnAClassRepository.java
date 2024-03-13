package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Classqna;

public interface QnAClassRepository {
	
	
	//Class

	List<Classqna> readAllClassqnaList();

	//하나만 가져올 때

	Classqna readClassqnaBynumber(String classnumber);

	//카테고리에 따라 가져올때

	List<Classqna> readClassqnaListByCategory(String category);

	//C

	void createClassqna(Classqna qna);

	//U

	void updateClassqna(Classqna classqnb);

	//D

	void deleteClassqna(String classnumber);
	
}
