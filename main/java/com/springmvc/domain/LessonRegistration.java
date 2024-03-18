package com.springmvc.domain;

import java.io.Serializable;

public class LessonRegistration implements Serializable
{
    /**
	 * 
	 */
	private static final long serialVersionUID = -8921332667386450483L;
	
	private long registrationId; //수강신청번호 -- 자동 설정됨
    private String lessonId; // 클래스 ID
    private String lessonName;
    private String coachId; // 코치 아이디
    private String coachName;
    private String registDate; // 수강 신청을 한 날짜
    private String studentId; // 신청자 아이디 = memberId
    private String studentName; // 신청자 이름
    private String phone; // 신청자 전화번호
    private String notes; // 비고란
    private int paymentStatus; // 결제 여부 - 0 (false) OR 1(true)
	
 
    public LessonRegistration(){super();}
	public long getRegistrationId() {
		return registrationId;
	}
	public void setRegistrationId(long registrationId) {
		this.registrationId = registrationId;
	}
	public String getLessonId() {
		return lessonId;
	}
	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}
	public String getCoachId() {
		return coachId;
	}
	public void setCoachId(String coachId) {
		this.coachId = coachId;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public int getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getCoachName() {
		return coachName;
	}
	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}


}