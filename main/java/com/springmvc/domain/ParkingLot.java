package com.springmvc.domain;

public class ParkingLot {

	private String managementnumber; //주차장관리번호
	private String name; //주차장명
	private String classification; //주차장구분
	private String parkinglottype; //주차장유형
	private String ocationaddress; //소재지도로명주소
	private String numberaddress; //소재지지번주소
	private String parkinglots; //주차구획수
	private String operatingdays; //운영요일
	private String weekstarttime; //평일운영시작시각
	private String Weekendtime; //평일운영종료시각
	private String beginstime; //토요일운영시작시작
	private String endtime; //토요일운영종료시각 
	private String holidaystarttime; //공휴일운영시작시각
	private String holidayendtime; //공휴일운영종료시각 
	private String feeinformation; //요금정보
	private String basicparkingtime; //주차기본시간
	private String basicparkingfee; //주차기본요금
	private String unittime; //추가단위시간
	private String unitfee; //추가단위요금	
	private String applicationtime; //1일주차권요금적용시간
	private String ticketfee; //1일주차권요금
	private String passfee; //월정기권요금
	private String payment; //결제방법
	private String remarks; //특기사항
	private String organizationname; //관리기관명
	private String phonenumber; //전화번호
	private String latitude; //위도
	private String hardness; //경도
	private String parkingspace; //장애인전용주차구역보유여부
	private String basedate; //데이터기준일자
	
	public String getManagementnumber() {
		return managementnumber;
	}
	public void setManagementnumber(String managementnumber) {
		this.managementnumber = managementnumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getParkinglottype() {
		return parkinglottype;
	}
	public void setParkinglottype(String parkinglottype) {
		this.parkinglottype = parkinglottype;
	}
	public String getOcationaddress() {
		return ocationaddress;
	}
	public void setOcationaddress(String ocationaddress) {
		this.ocationaddress = ocationaddress;
	}
	public String getNumberaddress() {
		return numberaddress;
	}
	public void setNumberaddress(String numberaddress) {
		this.numberaddress = numberaddress;
	}
	public String getParkinglots() {
		return parkinglots;
	}
	public void setParkinglots(String parkinglots) {
		this.parkinglots = parkinglots;
	}
	public String getOperatingdays() {
		return operatingdays;
	}
	public void setOperatingdays(String operatingdays) {
		this.operatingdays = operatingdays;
	}
	public String getWeekstarttime() {
		return weekstarttime;
	}
	public void setWeekstarttime(String weekstarttime) {
		this.weekstarttime = weekstarttime;
	}
	public String getWeekendtime() {
		return Weekendtime;
	}
	public void setWeekendtime(String weekendtime) {
		Weekendtime = weekendtime;
	}
	public String getBeginstime() {
		return beginstime;
	}
	public void setBeginstime(String beginstime) {
		this.beginstime = beginstime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getHolidaystarttime() {
		return holidaystarttime;
	}
	public void setHolidaystarttime(String holidaystarttime) {
		this.holidaystarttime = holidaystarttime;
	}
	public String getHolidayendtime() {
		return holidayendtime;
	}
	public void setHolidayendtime(String holidayendtime) {
		this.holidayendtime = holidayendtime;
	}
	public String getFeeinformation() {
		return feeinformation;
	}
	public void setFeeinformation(String feeinformation) {
		this.feeinformation = feeinformation;
	}
	public String getBasicparkingtime() {
		return basicparkingtime;
	}
	public void setBasicparkingtime(String basicparkingtime) {
		this.basicparkingtime = basicparkingtime;
	}
	public String getBasicparkingfee() {
		return basicparkingfee;
	}
	public void setBasicparkingfee(String basicparkingfee) {
		this.basicparkingfee = basicparkingfee;
	}
	public String getUnittime() {
		return unittime;
	}
	public void setUnittime(String unittime) {
		this.unittime = unittime;
	}
	public String getUnitfee() {
		return unitfee;
	}
	public void setUnitfee(String unitfee) {
		this.unitfee = unitfee;
	}
	public String getApplicationtime() {
		return applicationtime;
	}
	public void setApplicationtime(String applicationtime) {
		this.applicationtime = applicationtime;
	}
	public String getTicketfee() {
		return ticketfee;
	}
	public void setTicketfee(String ticketfee) {
		this.ticketfee = ticketfee;
	}
	public String getPassfee() {
		return passfee;
	}
	public void setPassfee(String passfee) {
		this.passfee = passfee;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getOrganizationname() {
		return organizationname;
	}
	public void setOrganizationname(String organizationname) {
		this.organizationname = organizationname;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getHardness() {
		return hardness;
	}
	public void setHardness(String hardness) {
		this.hardness = hardness;
	}
	public String getParkingspace() {
		return parkingspace;
	}
	public void setParkingspace(String parkingspace) {
		this.parkingspace = parkingspace;
	}
	public String getBasedate() {
		return basedate;
	}
	public void setBasedate(String basedate) {
		this.basedate = basedate;
	}
	
	public ParkingLot(String managementnumber, String name, String classification, String parkinglottype,
			String ocationaddress, String numberaddress, String parkinglots, String operatingdays, String weekstarttime,
			String weekendtime, String beginstime, String endtime, String holidaystarttime, String holidayendtime,
			String feeinformation, String basicparkingtime, String basicparkingfee, String unittime, String unitfee,
			String applicationtime, String ticketfee, String passfee, String payment, String remarks,
			String organizationname, String phonenumber, String latitude, String hardness, String parkingspace,
			String basedate) {
		super();
		this.managementnumber = managementnumber;
		this.name = name;
		this.classification = classification;
		this.parkinglottype = parkinglottype;
		this.ocationaddress = ocationaddress;
		this.numberaddress = numberaddress;
		this.parkinglots = parkinglots;
		this.operatingdays = operatingdays;
		this.weekstarttime = weekstarttime;
		Weekendtime = weekendtime;
		this.beginstime = beginstime;
		this.endtime = endtime;
		this.holidaystarttime = holidaystarttime;
		this.holidayendtime = holidayendtime;
		this.feeinformation = feeinformation;
		this.basicparkingtime = basicparkingtime;
		this.basicparkingfee = basicparkingfee;
		this.unittime = unittime;
		this.unitfee = unitfee;
		this.applicationtime = applicationtime;
		this.ticketfee = ticketfee;
		this.passfee = passfee;
		this.payment = payment;
		this.remarks = remarks;
		this.organizationname = organizationname;
		this.phonenumber = phonenumber;
		this.latitude = latitude;
		this.hardness = hardness;
		this.parkingspace = parkingspace;
		this.basedate = basedate;
	}
	
	public ParkingLot() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
