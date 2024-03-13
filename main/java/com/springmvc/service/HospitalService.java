package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Hospital;

public interface HospitalService {

	List<Hospital> readAllHospitalList();
	List<Hospital> readHospitalListBySubject(String hospitalSubject);
	Hospital readHospitalById(String hospitalId);
	void setNewHospital(Hospital hospital);
	
	void setUpdateHospital(Hospital hospital);
	void setDeleteHospital(String hospitalId);
}
