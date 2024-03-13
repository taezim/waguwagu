package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Atbat;

public interface AtbatService {

	
	//Atbat
    
    List<Atbat> readAllAtbat();
    
    //하나만 가져올 때 

    Atbat readAtbatByNumber(String atbatnumber);

    //카테고리에 따라 가져올때

    List<Atbat> readAtbatListByCategory(String category);
    
    //C
    
    void createAtbat(Atbat atbat);

    //U
    void updateAtbat(Atbat atbat); 

    //D
    void deleteAtbat(String atbatnumber);
    
    
}