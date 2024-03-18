package com.springmvc.domain;

import java.io.Serializable;

public class StdReservation implements Serializable

{
	
	    /**
	 * 
	 */
	private static final long serialVersionUID = 3444081654256845971L;
	
	private long reservId; // reserv_id
    private String stdId;
    private String stdName;
    private String stdFilename; // 아놔 N 말고 n ;; 
    private String insertDate; // insert_date
    private String reservDate;
    private String startTime;
    private String endTime;
    private String userId;
    private String userName;
    private String userPhone;
    private String teamId;
    private String teamName;
   
    private int memNumber; // mem_number
    private int bookingFee; // booking_fee
   
    private String bookingStatus; // booking_status
    private Boolean isPaid; // isPaid
	public StdReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getReservId() {
		return reservId;
	}
	public void setReservId(long reservId) {
		this.reservId = reservId;
	}
	public String getStdId() {
		return stdId;
	}
	public void setStdId(String stdId) {
		this.stdId = stdId;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getStdFilename() {
		return stdFilename;
	}
	public void setStdFilename(String stdFilename) {
		this.stdFilename = stdFilename;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
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
	public int getMemNumber() {
		return memNumber;
	}
	public void setMemNumber(int memNumber) {
		this.memNumber = memNumber;
	}
	public int getBookingFee() {
		return bookingFee;
	}
	public void setBookingFee(int bookingFee) {
		this.bookingFee = bookingFee;
	}
	public String getBookingStatus() {
		return bookingStatus;
	}
	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}
	public Boolean getIsPaid() {
		return isPaid;
	}
	public void setIsPaid(Boolean isPaid) {
		this.isPaid = isPaid;
	}



}
