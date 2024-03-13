package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Hospital implements Serializable{

	
	private static final long serialVersionUID = -5462014620475570954L;

	
	private String hospitalId;  //병원ID
	private String hospitalName;  //병원이름
	private String hospitalPlace;  //병원위치
	private String hospitalNumber;  //병원전화번호
	private String hospitalReview;  //병원리뷰번호
	private String hospitalSubject;  //병원진료과목
	private MultipartFile hospitalImage;  //이미지
	private String fileName;  //파일이름
	private String hospitalContent;
	
	public Hospital() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getHospitalPlace() {
		return hospitalPlace;
	}

	public void setHospitalPlace(String hospitalPlace) {
		this.hospitalPlace = hospitalPlace;
	}

	public String getHospitalNumber() {
		return hospitalNumber;
	}

	public void setHospitalNumber(String hospitalNumber) {
		this.hospitalNumber = hospitalNumber;
	}

	public String getHospitalReview() {
		return hospitalReview;
	}

	public void setHospitalReview(String hospitalReview) {
		this.hospitalReview = hospitalReview;
	}

	public MultipartFile getHospitalImage() {
		return hospitalImage;
	}

	public void setHospitalImage(MultipartFile hospitalImage) {
		this.hospitalImage = hospitalImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getHospitalSubject() {
		return hospitalSubject;
	}

	public void setHospitalSubject(String hospitalSubject) {
		this.hospitalSubject = hospitalSubject;
	}

	public String getHospitalContent() {
		return hospitalContent;
	}

	public void setHospitalContent(String hospitalContent) {
		this.hospitalContent = hospitalContent;
	}


	
	
	
	
	
}
