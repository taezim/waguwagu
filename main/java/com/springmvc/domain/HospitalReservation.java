package com.springmvc.domain;

import java.io.Serializable;

public class HospitalReservation implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8598538946778244061L;

    private long reservationId; // 예약번호
    /*병원 정보*/
    private String hospitalId;
    private String hospitalName;
    private String hospitalFileName;
    
    private String insertDate; // 뷰에서 제공 X
    /*예약자 정보*/
    private String reservationDate;
    private String reserverId;
    private String reserverName;
    private String reserverPhone;
    /*환자 정보*/
    private String patientName;
    private int patientAge;
    private String patientPhone;
    /*부상 정보*/
    private String injuryType;
    private String notes;
    
    public HospitalReservation() {super();}
    
	public long getReservationId() {
		return reservationId;
	}
	public void setReservationId(long reservationId) {
		this.reservationId = reservationId;
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
	
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getReserverId() {
		return reserverId;
	}
	public void setReserverId(String reserverId) {
		this.reserverId = reserverId;
	}
	public String getReserverName() {
		return reserverName;
	}
	public void setReserverName(String reserverName) {
		this.reserverName = reserverName;
	}
	public String getReserverPhone() {
		return reserverPhone;
	}
	public void setReserverPhone(String reserverPhone) {
		this.reserverPhone = reserverPhone;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public int getPatientAge() {
		return patientAge;
	}
	public void setPatientAge(int patientAge) {
		this.patientAge = patientAge;
	}
	public String getPatientPhone() {
		return patientPhone;
	}
	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}
	public String getInjuryType() {
		return injuryType;
	}
	public void setInjuryType(String injuryType) {
		this.injuryType = injuryType;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getHospitalFileName() {
		return hospitalFileName;
	}

	public void setHospitalFileName(String hospitalFileName) {
		this.hospitalFileName = hospitalFileName;
	}

	

}
