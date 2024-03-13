package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class HospitalReview implements Serializable{

	
	private static final long serialVersionUID = -8374087472466925463L;
	
	private String reviewId;  //리뷰아이디
	private String hospitalId;  //병원아이디
	private String userId;  //사용자아이디
	private String reviewDate;  //리뷰작성날짜
	private String reviewContent;  //리뷰내용
	private int reviewRating;  //리뷰점수
	private String fileName;  //파일이름
	private MultipartFile reviewImage;  //이미지
	private String name;
	private String title;
	
	public HospitalReview() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getReviewId() {
		return reviewId;
	}


	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}


	public String getHospitalId() {
		return hospitalId;
	}


	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getReviewDate() {
		return reviewDate;
	}


	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public int getReviewRating() {
		return reviewRating;
	}


	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public MultipartFile getReviewImage() {
		return reviewImage;
	}


	public void setReviewImage(MultipartFile reviewImage) {
		this.reviewImage = reviewImage;
	}
	
	
	

	
}
