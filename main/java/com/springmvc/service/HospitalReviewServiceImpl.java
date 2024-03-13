package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.HospitalReview;
import com.springmvc.repository.HospitalReviewRepository;

@Service
public class HospitalReviewServiceImpl implements HospitalReviewService {

	@Autowired
	private HospitalReviewRepository hospitalReviewRepository;
	
	@Override
	public List<HospitalReview> readAllReviewList() {
		// TODO Auto-generated method stub
		return hospitalReviewRepository.readAllReviewList();
	}

	@Override
	public HospitalReview readReviewById(String reviewId) {
		HospitalReview reviewById = hospitalReviewRepository.readReviewById(reviewId);
		return reviewById;
	}

	@Override
	public void setNewReview(HospitalReview hospitalReview) {
		hospitalReviewRepository.setNewReview(hospitalReview);
		
	}

	@Override
	public void setUpdateReview(HospitalReview hospitalReview) {
		hospitalReviewRepository.setUpdateReview(hospitalReview);
		
	}

	@Override
	public void setDeleteReview(String reviewId) {
		hospitalReviewRepository.setDeleteReview(reviewId);
		
	}

	@Override
	public List<HospitalReview> readHospitalAllReviewList(String hospitalId) {
		// TODO Auto-generated method stub
		return hospitalReviewRepository.readHospitalAllReviewList(hospitalId);
	}

	@Override
	public double calculateAvgScore(String hospitalId) {
		// TODO Auto-generated method stub
		return hospitalReviewRepository.calculateAvgScore(hospitalId);
	}

	
}
