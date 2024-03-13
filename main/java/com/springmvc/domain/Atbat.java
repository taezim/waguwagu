package com.springmvc.domain;

public class Atbat {

	private int atbatplayerID; //1 선수 식별자
	private int matches; //2 경기 횟수 //공통
	private int win; //3 승리 횟수
	private int loss; //4 패배 횟수
	private int save; //5 세이브 횟수
	private int hold; //6 홀드 횟수
	private float odds; //7 승률
	private double innings; //8 이닝 수
	private int hitsAllowed; //9 피안타 수
	private int homeRunsAllowed; //10 피홈런 수
	private int walks; //11 볼넷 수 //공통
	private int hitByPitch; //12 사구 수
	private int strikeouts; //13 삼진 수 //공통
	private int runs; //14 실점 수
	private int earnedRuns; //15 자책점 수
	private double onBaseAllowed; //16 출루 허용률
	
	
	public int getAtbatplayerID() {
		return atbatplayerID;
	}
	
	
	
	
	public int getMatches() {
		return matches;
	}




	public void setMatches(int matches) {
		this.matches = matches;
	}




	public int getWin() {
		return win;
	}




	public void setWin(int win) {
		this.win = win;
	}




	public int getLoss() {
		return loss;
	}




	public void setLoss(int loss) {
		this.loss = loss;
	}




	public int getSave() {
		return save;
	}




	public void setSave(int save) {
		this.save = save;
	}




	public int getHold() {
		return hold;
	}




	public void setHold(int hold) {
		this.hold = hold;
	}




	public float getOdds() {
		return odds;
	}




	public void setOdds(float odds) {
		this.odds = odds;
	}




	public double getInnings() {
		return innings;
	}




	public void setInnings(double innings) {
		this.innings = innings;
	}




	public int getHitsAllowed() {
		return hitsAllowed;
	}




	public void setHitsAllowed(int hitsAllowed) {
		this.hitsAllowed = hitsAllowed;
	}




	public int getHomeRunsAllowed() {
		return homeRunsAllowed;
	}




	public void setHomeRunsAllowed(int homeRunsAllowed) {
		this.homeRunsAllowed = homeRunsAllowed;
	}




	public int getWalks() {
		return walks;
	}




	public void setWalks(int walks) {
		this.walks = walks;
	}




	public int getHitByPitch() {
		return hitByPitch;
	}




	public void setHitByPitch(int hitByPitch) {
		this.hitByPitch = hitByPitch;
	}




	public int getStrikeouts() {
		return strikeouts;
	}




	public void setStrikeouts(int strikeouts) {
		this.strikeouts = strikeouts;
	}




	public int getRuns() {
		return runs;
	}




	public void setRuns(int runs) {
		this.runs = runs;
	}




	public int getEarnedRuns() {
		return earnedRuns;
	}




	public void setEarnedRuns(int earnedRuns) {
		this.earnedRuns = earnedRuns;
	}




	public double getOnBaseAllowed() {
		return onBaseAllowed;
	}




	public void setOnBaseAllowed(double onBaseAllowed) {
		this.onBaseAllowed = onBaseAllowed;
	}




	public void setAtbatplayerID(int atbatplayerID) {
		this.atbatplayerID = atbatplayerID;
	}




	public Atbat() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
