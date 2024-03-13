package com.springmvc.domain;

public class Classqna {

	private String number; //번호;
	private String name; // 이름;
	private String content; //내용;
	private String email; //이메일;
	private String date; //날짜;
	private String classid; //클래스id

	
	public Classqna(String number, String content, String email, String date, String classid) {
		super();
		this.number = number;
		this.content = content;
		this.email = email;
		this.date = date;
		this.classid = classid;
	}

	
	
	
	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public Classqna() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}
		
}
