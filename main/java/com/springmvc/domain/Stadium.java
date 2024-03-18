package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Stadium implements Serializable
{
	private static final long serialVersionUID = 7863752624987733679L;
	/**
	 * 
	 */
	// Constructor Field
	private String stadiumId;//경기장 번호
	///////////////////////////////
	private String baseLength; //1,3루 길이
	private String totalArea; // 연면적
	private String outfieldMaterial; // 외야 재료
	//연번 제외
	private String countryside;// 시군구A
	private String builtYear; // 준공연도
	private String seatsNumber;// 관람객 좌석 수
	private String stdName;//시설명
	private String city;// 시,도
	private String buildingArea; // 건축 면적
	private String manager; // 관리주체
	private String infieldMaterial; // 내야 재료
	private String centerLength; // 중앙 길이
	private String ownership;// 소유기관
	//부지면적 제외
	private String siteArea;// 경기장 면적
	private String capacity; // 관람객 수용가능 인원

	/* 파일 업로드 */
	private MultipartFile stdImage;
	private String fileName;
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountryside() {
		return countryside;
	}
	public void setCountryside(String countryside) {
		this.countryside = countryside;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getOwnership() {
		return ownership;
	}
	public void setOwnership(String ownership) {
		this.ownership = ownership;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getSiteArea() {
		return siteArea;
	}
	public void setSiteArea(String siteArea) {
		this.siteArea = siteArea;
	}
	public String getBuildingArea() {
		return buildingArea;
	}
	public void setBuildingArea(String buildingArea) {
		this.buildingArea = buildingArea;
	}
	public String getTotalArea() {
		return totalArea;
	}
	public void setTotalArea(String totalArea) {
		this.totalArea = totalArea;
	}
	public String getInfieldMaterial() {
		return infieldMaterial;
	}
	public void setInfieldMaterial(String infieldMaterial) {
		this.infieldMaterial = infieldMaterial;
	}
	public String getOutfieldMaterial() {
		return outfieldMaterial;
	}
	public void setOutfieldMaterial(String outfieldMaterial) {
		this.outfieldMaterial = outfieldMaterial;
	}
	public String getCenterLength() {
		return centerLength;
	}
	public void setCenterLength(String centerLength) {
		this.centerLength = centerLength;
	}
	public String getBaseLength() {
		return baseLength;
	}
	public void setBaseLength(String baseLength) {
		this.baseLength = baseLength;
	}
	public String getSeatsNumber() {
		return seatsNumber;
	}
	public void setSeatsNumber(String seatsNumber) {
		this.seatsNumber = seatsNumber;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getBuiltYear() {
		return builtYear;
	}
	public void setBuiltYear(String builtYear) {
		this.builtYear = builtYear;
	}
	
	
	
	public Stadium() {super();}
	
	public Stadium(String stadiumId, String city, String stdName) {
		super();
		this.stadiumId = stadiumId;
		this.city = city;
		this.stdName = stdName;
	}
	public String getStadiumId() {
		return stadiumId;
	}
	public void setStadiumId(String stadiumId) {
		this.stadiumId = stadiumId;
	}
	public MultipartFile getStdImage() {
		return stdImage;
	}
	public void setStdImage(MultipartFile stdImage) {
		this.stdImage = stdImage;
	}

}
