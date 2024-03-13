package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Hospital;
import com.springmvc.repository.HospitalRepository;

@Service
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	private HospitalRepository hospitalRepository;

	
	@Override
	public List<Hospital> readAllHospitalList() {
		// TODO Auto-generated method stub
		return hospitalRepository.readAllHospitalList();
	}

	@Override
	public List<Hospital> readHospitalListBySubject(String hospitalSubject) {

		List<Hospital> hospitalBySubject =  hospitalRepository.readHospitalListBySubject(hospitalSubject);
		
		return hospitalBySubject;
	}

	@Override
	public Hospital readHospitalById(String hospitalId) {
		Hospital hospitalById = hospitalRepository.readHospitalById(hospitalId);
		return hospitalById;
	}

	@Override
	public void setNewHospital(Hospital hospital) {
		hospitalRepository.setNewHospital(hospital);
		
	}

	@Override
	public void setUpdateHospital(Hospital hospital) {
		hospitalRepository.setUpdateHospital(hospital);
		
	}

	@Override
	public void setDeleteHospital(String hospitalId) {
		hospitalRepository.setDeleteHospital(hospitalId);
		
	}

}
