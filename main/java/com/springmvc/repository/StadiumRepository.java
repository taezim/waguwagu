package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Stadium;

public interface StadiumRepository 
{
	List<Stadium> readAllStaidumList();
	
	// 6장 추가
	List<Stadium> readStaidumListByCity(String city);
	
	Stadium readStaidumById(String stadiumId);
	void setNewStaidum(Stadium std);
	
	void setUpdateStadium(Stadium std);
	void setDeleteStadium(String stadiumId);
}
