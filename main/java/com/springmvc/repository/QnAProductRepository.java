package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Productqna;

public interface QnAProductRepository {
	
	
	//Product
    
    List<Productqna> readAllProductqnaList();
    
    //하나만 가져올 때 

    Productqna readProductqnaBynumber(String productnumber);

    //카테고리에 따라 가져올때

    List<Productqna> readProductqnaListByCategory(String category);
    
    //C
    
    void createProductlqna(Productqna qna);

    //U
    void updateProductqna(Productqna productqnb); 

    //D
    void deleteProductqna(String productnumber);
	
	
}
