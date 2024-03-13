package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Hospital;

public interface HospitalRepository {
	
	List<Hospital> readAllHospitalList();
	List<Hospital> readHospitalListBySubject(String hospitalSubject);
	Hospital readHospitalById(String hospitalId);
	void setNewHospital(Hospital hospital);
	void setUpdateHospital(Hospital hospital);
	void setDeleteHospital(String hospitalId);

}
