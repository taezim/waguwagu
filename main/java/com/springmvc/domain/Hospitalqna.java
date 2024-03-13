package com.springmvc.domain;

public class Hospitalqna {

	
	private String number; //번호;
	private String content; //내용;
	private String email; //이메일;
	private String date; //날짜;
	private String hospitalid; //병원id
	private String name;
	
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHospitalid() {
		return hospitalid;
	}
	public void setHospitalid(String hospitalid) {
		this.hospitalid = hospitalid;
	}
	
	public Hospitalqna(String number, String content, String email, String date, String hospitalid) {
		super();
		this.number = number;
		this.content = content;
		this.email = email;
		this.date = date;
		this.hospitalid = hospitalid;
	}
	
	public Hospitalqna() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
