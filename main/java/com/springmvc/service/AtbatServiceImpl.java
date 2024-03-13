
package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Atbat;
import com.springmvc.repository.AtbatRepository;


@Service
public class AtbatServiceImpl implements AtbatService {

	
	@Autowired
	private AtbatRepository atbatRepository;
	
	@Override
	public List<Atbat> readAllAtbat() {
		// TODO Auto-generated method stub
		
		return atbatRepository.readAllAtbat();
	}

	@Override
	public Atbat readAtbatByNumber(String atbatNumber) {
		// TODO Auto-generated method stub
		Atbat atbat = atbatRepository.readAtbatByNumber(atbatNumber);
		return atbat;
	}

	@Override
	public List<Atbat> readAtbatListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createAtbat(Atbat atbat) {
		// TODO Auto-generated method stub
		atbatRepository.createAtbat(atbat);
	}

	@Override
	public void updateAtbat(Atbat atbat) {
		// TODO Auto-generated method stub
		atbatRepository.updateAtbat(atbat);
	}

	@Override
	public void deleteAtbat(String atbatNumber) {
		// TODO Auto-generated method stub
		atbatRepository.deleteAtbat(atbatNumber);
	}

}