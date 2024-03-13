package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Classanswer;

public interface AnswerClassRepository {
	
	
	
	
	//Class
	
	List<Classanswer> readAllClassanswerList();
	
	//하나만 가져올 때 

	Classanswer readClassanswerBynumber(String classnumber);

	//카테고리에 따라 가져올때

	List<Classanswer> readClassanswerListByCategory(String category);
	
	//C
	
	void createClassanswer(Classanswer answer);

	//U
	void updateClassanswer(Classanswer classqnb); 

	//D
	void deleteClassanswer(String classnumber);
}
