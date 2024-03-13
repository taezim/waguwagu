package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Atbat;

public interface AtbatRepository {

	
	List<Atbat> readAllAtbat();

	Atbat readAtbatByNumber(String atbatnumber);

	List<Atbat> readAtbatListByCategory(String category);

	void createAtbat(Atbat answer);

	void updateAtbat(Atbat person); 

	void deleteAtbat(String anumber);

}
