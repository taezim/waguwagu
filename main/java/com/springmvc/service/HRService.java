package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.HospitalReservation;

public interface HRService 
{

	List<HospitalReservation> readAllReservation(String memberId);
	HospitalReservation readHospitalReservation(String reservationId);
	
	void setNewHR(HospitalReservation HR);
	void setUpdateHR(HospitalReservation HR);
	void setCancelHR(String reservationId);

	List<HospitalReservation> readAllReservTime(String hospitalId);
}


