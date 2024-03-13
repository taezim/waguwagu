package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.LessonReview;

public interface LessonReviewService {
	List<LessonReview> readAllReviewList(String lessonId);
	LessonReview readReviewById(String reviewId);
	double calculateAvgScore(String lessonId);
	void setNewReview(LessonReview lessonReview);
	void setUpdateReview(LessonReview lessonReview);
	void setDeleteReview(String reviewId);
	//List<LessonReview> readAllReviewList(String lessonid);
}
