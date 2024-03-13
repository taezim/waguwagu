package com.springmvc.domain;

public class Batter {

	private int	batterplayerID; //1 선수 식별자
	private int matches; //2 경기 횟수 //공통
	
	// 타자
	private int atBats; //18 타석 수
	private	int strokes; //29 타수 수
	private	int score; //30 득점 수
	private int hits; //19 안타 수
	private int doubles; //20 2루타 수
	private int triples; //21 3루타 수
	private int homeRuns; //22 홈런 수
	private int rbis; //23 타점 수
	private int stolenBases; //24 도루 수
	private int doublePlays; //25 병살타 수

	private double battingAverage; //26 타율

	private double sluggingPercentage; //27 장타율

	private double onBasePercentage; //28 출루율
	
	

	public int getBatterplayerID() {
		return batterplayerID;
	}



	public void setBatterplayerID(int batterplayerID) {
		this.batterplayerID = batterplayerID;
	}



	public int getMatches() {
		return matches;
	}



	public void setMatches(int matches) {
		this.matches = matches;
	}



	public int getAtBats() {
		return atBats;
	}



	public void setAtBats(int atBats) {
		this.atBats = atBats;
	}



	public int getStrokes() {
		return strokes;
	}



	public void setStrokes(int strokes) {
		this.strokes = strokes;
	}



	public int getScore() {
		return score;
	}



	public void setScore(int score) {
		this.score = score;
	}



	public int getHits() {
		return hits;
	}



	public void setHits(int hits) {
		this.hits = hits;
	}



	public int getDoubles() {
		return doubles;
	}



	public void setDoubles(int doubles) {
		this.doubles = doubles;
	}



	public int getTriples() {
		return triples;
	}



	public void setTriples(int triples) {
		this.triples = triples;
	}



	public int getHomeRuns() {
		return homeRuns;
	}



	public void setHomeRuns(int homeRuns) {
		this.homeRuns = homeRuns;
	}



	public int getRbis() {
		return rbis;
	}



	public void setRbis(int rbis) {
		this.rbis = rbis;
	}



	public int getStolenBases() {
		return stolenBases;
	}



	public void setStolenBases(int stolenBases) {
		this.stolenBases = stolenBases;
	}



	public int getDoublePlays() {
		return doublePlays;
	}



	public void setDoublePlays(int doublePlays) {
		this.doublePlays = doublePlays;
	}



	public double getBattingAverage() {
		return battingAverage;
	}



	public void setBattingAverage(double battingAverage) {
		this.battingAverage = battingAverage;
	}



	public double getSluggingPercentage() {
		return sluggingPercentage;
	}



	public void setSluggingPercentage(double sluggingPercentage) {
		this.sluggingPercentage = sluggingPercentage;
	}



	public double getOnBasePercentage() {
		return onBasePercentage;
	}



	public void setOnBasePercentage(double onBasePercentage) {
		this.onBasePercentage = onBasePercentage;
	}



	public Batter() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
