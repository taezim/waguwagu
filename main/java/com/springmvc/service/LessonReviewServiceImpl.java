package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.LessonReview;
import com.springmvc.repository.LessonReviewRepository;

@Service
public class LessonReviewServiceImpl implements LessonReviewService{

	@Autowired
	private LessonReviewRepository lessonReviewRepository;
	
	
	@Override
	public List<LessonReview> readAllReviewList(String lessonId) {
		// TODO Auto-generated method stub
		return lessonReviewRepository.readAllReviewList(lessonId);
	}

	@Override
	public LessonReview readReviewById(String reviewId) {
		LessonReview reviewById = lessonReviewRepository.readReviewById(reviewId);
		return reviewById;
	}

	@Override
	public void setNewReview(LessonReview lessonReview) {
		lessonReviewRepository.setNewReview(lessonReview);
		
	}

	@Override
	public void setUpdateReview(LessonReview lessonReview) {
		lessonReviewRepository.setUpdateReview(lessonReview);
		
	}

	@Override
	public void setDeleteReview(String reviewId) {
		lessonReviewRepository.setDeleteReview(reviewId);
		
	}

	@Override
	public double calculateAvgScore(String lessonId) {
		// TODO Auto-generated method stub
		return lessonReviewRepository.calculateAvgScore(lessonId);
	}

}
