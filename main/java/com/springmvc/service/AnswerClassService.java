package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Classanswer;

public interface AnswerClassService {
		
		//Class
		
		List<Classanswer> readAllclassanswerLists();
		
		//하나만 가져올 때 

		Classanswer readClassanswerBynumber(String classnumber);

		//카테고리에 따라 가져올때

		List<Classanswer> readClassanswerListByCategory(String category);
		
		//C
		
		void createClassanswer(Classanswer classanswer);

		//U
		void updateClassanswer(Classanswer ananswer); 

		//D
		void deleteClassanswer(String classnumber);
}
