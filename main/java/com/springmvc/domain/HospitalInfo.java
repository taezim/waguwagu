package com.springmvc.domain;

import java.io.Serializable;

public class HospitalInfo implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 9210551159295495721L;
	
	private int id; //아이디
	private String addr;  //주소
    private String clCd;
    private String clCdNm;
    private int cmdcGdrCnt;
    private int cmdcIntnCnt;
    private int cmdcResdntCnt;
    private int cmdcSdrCnt;
    private int detyGdrCnt;
    private int detyIntnCnt;
    private int detyResdntCnt;
    private int detySdrCnt;
    private int drTotCnt;
    private String emdongNm;
    private String estbDd;
    private String hospUrl;  //병원홈페이지
    private int mdeptGdrCnt;
    private int mdeptIntnCnt;
    private int mdeptResdntCnt;
    private int mdeptSdrCnt;
    private int pnursCnt;
    private String postNo;
    private String sgguCd;
    private String sgguCdNm;
    private String sidoCd;
    private String sidoCdNm;
    private String telno;  //병원 전화번호
    private double XPos;  //x좌표
    private double YPos;  //y좌표
    private String yadmNm;  //병원 이름
    private String ykiho;

    // 생성자, Getter 및 Setter 메서드는 생략합니다.

	/*
	 * @Override public String toString() { return "DataVO{" + "addr='" + addr +
	 * '\'' + ", clCd='" + clCd + '\'' + ", clCdNm='" + clCdNm + '\'' +
	 * ", cmdcGdrCnt=" + cmdcGdrCnt + ", cmdcIntnCnt=" + cmdcIntnCnt +
	 * ", cmdcResdntCnt=" + cmdcResdntCnt + ", cmdcSdrCnt=" + cmdcSdrCnt +
	 * ", detyGdrCnt=" + detyGdrCnt + ", detyIntnCnt=" + detyIntnCnt +
	 * ", detyResdntCnt=" + detyResdntCnt + ", detySdrCnt=" + detySdrCnt +
	 * ", drTotCnt=" + drTotCnt + ", emdongNm='" + emdongNm + '\'' + ", estbDd='" +
	 * estbDd + '\'' + ", hospUrl='" + hospUrl + '\'' + ", mdeptGdrCnt=" +
	 * mdeptGdrCnt + ", mdeptIntnCnt=" + mdeptIntnCnt + ", mdeptResdntCnt=" +
	 * mdeptResdntCnt + ", mdeptSdrCnt=" + mdeptSdrCnt + ", pnursCnt=" + pnursCnt +
	 * ", postNo='" + postNo + '\'' + ", sgguCd='" + sgguCd + '\'' + ", sgguCdNm='"
	 * + sgguCdNm + '\'' + ", sidoCd='" + sidoCd + '\'' + ", sidoCdNm='" + sidoCdNm
	 * + '\'' + ", telno='" + telno + '\'' + ", XPos=" + XPos + ", YPos=" + YPos +
	 * ", yadmNm='" + yadmNm + '\'' + ", ykiho='" + ykiho + '\'' + '}'; }
	 */
    
	public HospitalInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getClCd() {
		return clCd;
	}

	public void setClCd(String clCd) {
		this.clCd = clCd;
	}

	public String getClCdNm() {
		return clCdNm;
	}

	public void setClCdNm(String clCdNm) {
		this.clCdNm = clCdNm;
	}

	public int getCmdcGdrCnt() {
		return cmdcGdrCnt;
	}

	public void setCmdcGdrCnt(int cmdcGdrCnt) {
		this.cmdcGdrCnt = cmdcGdrCnt;
	}

	public int getCmdcIntnCnt() {
		return cmdcIntnCnt;
	}

	public void setCmdcIntnCnt(int cmdcIntnCnt) {
		this.cmdcIntnCnt = cmdcIntnCnt;
	}

	public int getCmdcResdntCnt() {
		return cmdcResdntCnt;
	}

	public void setCmdcResdntCnt(int cmdcResdntCnt) {
		this.cmdcResdntCnt = cmdcResdntCnt;
	}

	public int getCmdcSdrCnt() {
		return cmdcSdrCnt;
	}

	public void setCmdcSdrCnt(int cmdcSdrCnt) {
		this.cmdcSdrCnt = cmdcSdrCnt;
	}

	public int getDetyGdrCnt() {
		return detyGdrCnt;
	}

	public void setDetyGdrCnt(int detyGdrCnt) {
		this.detyGdrCnt = detyGdrCnt;
	}

	public int getDetyIntnCnt() {
		return detyIntnCnt;
	}

	public void setDetyIntnCnt(int detyIntnCnt) {
		this.detyIntnCnt = detyIntnCnt;
	}

	public int getDetyResdntCnt() {
		return detyResdntCnt;
	}

	public void setDetyResdntCnt(int detyResdntCnt) {
		this.detyResdntCnt = detyResdntCnt;
	}

	public int getDetySdrCnt() {
		return detySdrCnt;
	}

	public void setDetySdrCnt(int detySdrCnt) {
		this.detySdrCnt = detySdrCnt;
	}

	public int getDrTotCnt() {
		return drTotCnt;
	}

	public void setDrTotCnt(int drTotCnt) {
		this.drTotCnt = drTotCnt;
	}

	public String getEmdongNm() {
		return emdongNm;
	}

	public void setEmdongNm(String emdongNm) {
		this.emdongNm = emdongNm;
	}

	public String getEstbDd() {
		return estbDd;
	}

	public void setEstbDd(String estbDd) {
		this.estbDd = estbDd;
	}

	public String getHospUrl() {
		return hospUrl;
	}

	public void setHospUrl(String hospUrl) {
		this.hospUrl = hospUrl;
	}

	public int getMdeptGdrCnt() {
		return mdeptGdrCnt;
	}

	public void setMdeptGdrCnt(int mdeptGdrCnt) {
		this.mdeptGdrCnt = mdeptGdrCnt;
	}

	public int getMdeptIntnCnt() {
		return mdeptIntnCnt;
	}

	public void setMdeptIntnCnt(int mdeptIntnCnt) {
		this.mdeptIntnCnt = mdeptIntnCnt;
	}

	public int getMdeptResdntCnt() {
		return mdeptResdntCnt;
	}

	public void setMdeptResdntCnt(int mdeptResdntCnt) {
		this.mdeptResdntCnt = mdeptResdntCnt;
	}

	public int getMdeptSdrCnt() {
		return mdeptSdrCnt;
	}

	public void setMdeptSdrCnt(int mdeptSdrCnt) {
		this.mdeptSdrCnt = mdeptSdrCnt;
	}

	public int getPnursCnt() {
		return pnursCnt;
	}

	public void setPnursCnt(int pnursCnt) {
		this.pnursCnt = pnursCnt;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getSgguCd() {
		return sgguCd;
	}

	public void setSgguCd(String sgguCd) {
		this.sgguCd = sgguCd;
	}

	public String getSgguCdNm() {
		return sgguCdNm;
	}

	public void setSgguCdNm(String sgguCdNm) {
		this.sgguCdNm = sgguCdNm;
	}

	public String getSidoCd() {
		return sidoCd;
	}

	public void setSidoCd(String sidoCd) {
		this.sidoCd = sidoCd;
	}

	public String getSidoCdNm() {
		return sidoCdNm;
	}

	public void setSidoCdNm(String sidoCdNm) {
		this.sidoCdNm = sidoCdNm;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public double getXPos() {
		return XPos;
	}

	public void setXPos(double xPos) {
		XPos = xPos;
	}

	public double getYPos() {
		return YPos;
	}

	public void setYPos(double yPos) {
		YPos = yPos;
	}

	public String getYadmNm() {
		return yadmNm;
	}

	public void setYadmNm(String yadmNm) {
		this.yadmNm = yadmNm;
	}

	public String getYkiho() {
		return ykiho;
	}

	public void setYkiho(String ykiho) {
		this.ykiho = ykiho;
	}
	
}
