package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Productanswer;

public interface AnswerProductRepository {
	
	
	//Product
    
    List<Productanswer> readAllProductanswerList();
    
    //하나만 가져올 때 

    Productanswer readProductanswerBynumber(String productnumber);

    //카테고리에 따라 가져올때

    List<Productanswer> readProductanswerListByCategory(String category);
    
    //C
    
    void createProductlanswer(Productanswer answer);

    //U
    void updateProductanswer(Productanswer productqnb); 

    //D
    void deleteProductanswer(String productnumber);


	
	
}
