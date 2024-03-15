package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.HospitalReservation;
import com.springmvc.repository.HRRepository;

@Service
public class HRServiceImpl implements HRService
{
	@Autowired
	HRRepository hrr;
	

	@Override
	public List<HospitalReservation> readAllReservation(String memberId) {
		// TODO Auto-generated method stub
		return hrr.readAllReservation(memberId);
	}

	@Override
	public HospitalReservation readHospitalReservation(String reservationId) {
		// TODO Auto-generated method stub
		return hrr.readHospitalReservation(reservationId);
	}

	@Override
	public void setNewHR(HospitalReservation HR) 
	{
		hrr.setNewHR(HR);
	}

	@Override
	public void setUpdateHR(HospitalReservation HR) {
		hrr.setUpdateHR(HR);
	}

	@Override
	public void setCancelHR(String reservationId) {
		
		hrr.setCancelHR(reservationId);
		
	}

	@Override
	public List<HospitalReservation> readAllReservTime(String hospitalId) 
	{
		
		return hrr.readAllReservTime(hospitalId);
	}

}
