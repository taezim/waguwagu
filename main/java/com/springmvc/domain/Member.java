package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Member implements Serializable{
  
	private static final long serialVersionUID = 8236615161898888510L;
	
	
	private String memberId;   // 아이디
    private String name;     // 이름
    private String password; // 비밀번호
    private String birth; // 생년월일
    private String team;     // 소속구단
    private String injury; // 부상정보
    private Address address = new Address();  // 주소

    private String classId;    // 클래스 등록번호
    private String teacherId;    // 코치 번호
    private String personalRecord; // 개인성적
    private String sex; //성별
    private MultipartFile memberImage;
	private String fileName;
    
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getInjury() {
		return injury;
	}

	public void setInjury(String injury) {
		this.injury = injury;
	}

	public Address getAddress() {
	        return address;
	}

    public void setAddress(Address address) {
        this.address = address;
    }

	public String getClassId() {
		return classId;
	}

	public void setClassId(String string) {
		this.classId = string;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getPersonalRecord() {
		return personalRecord;
	}

	public void setPersonalRecord(String personalRecord) {
		this.personalRecord = personalRecord;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public MultipartFile getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(MultipartFile memberImage) {
		this.memberImage = memberImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
}
