package com.springmvc.domain;

public class Hospitalanswer {
	
	private String answernumber; //답변변호
	private String questionnumber; //질문번호
	private String respondentid; //답변자 아이디
	private String answercontent; //답변내용
	private String replaydate; //답변날짜
	private String hospitalid;
	
	public String getAnswernumber() {
		return answernumber;
	}
	public void setAnswernumber(String answernumber) {
		this.answernumber = answernumber;
	}
	public String getQuestionnumber() {
		return questionnumber;
	}
	public void setQuestionnumber(String questionnumber) {
		this.questionnumber = questionnumber;
	}
	public String getRespondentid() {
		return respondentid;
	}
	public void setRespondentid(String respondentid) {
		this.respondentid = respondentid;
	}
	public String getAnswercontent() {
		return answercontent;
	}
	public void setAnswercontent(String answercontent) {
		this.answercontent = answercontent;
	}
	public String getReplaydate() {
		return replaydate;
	}
	public void setReplaydate(String replaydate) {
		this.replaydate = replaydate;
	}
	public String getHospitalid() {
		return hospitalid;
	}
	public void setHospitalid(String hospitalid) {
		this.hospitalid = hospitalid;
	}
	
	public Hospitalanswer(String answernumber, String questionnumber, String respondentid, String answercontent,
			String replaydate, String hospitalid) {
		super();
		this.answernumber = answernumber;
		this.questionnumber = questionnumber;
		this.respondentid = respondentid;
		this.answercontent = answercontent;
		this.replaydate = replaydate;
		this.hospitalid = hospitalid;
	}
	
	public Hospitalanswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
