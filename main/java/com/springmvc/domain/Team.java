package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Team implements Serializable{
	
	
	private static final long serialVersionUID = 6572089685558342850L;
	
	
	private String teamId; //팀아이디
	private String teamName; //구단명
	private int memberNumber; //인원수
	private String phoneNumber; //대표자번호
	private String leaderName; //대표자이름
	private String prefArea; //선호지역
	private MultipartFile teamImage;
	private String fileName;
	private String description;
	
	public Team() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}

	public String getPrefArea() {
		return prefArea;
	}

	public void setPrefArea(String prefArea) {
		this.prefArea = prefArea;
	}

	public MultipartFile getTeamImage() {
		return teamImage;
	}

	public void setTeamImage(MultipartFile teamImage) {
		this.teamImage = teamImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	
}
