package com.springmvc.domain;

import java.io.Serializable;
import java.util.List;

public class TeamWinning implements Serializable{

	
	private static final long serialVersionUID = -3281574142158274296L;

	
	private String winningId;  //구단성적아이디
	private String teamId;  //팀아이디
	private int matches;  //경기수
	private double rate; //승룰
	private String recent; //최근결과
	private String date; //경기날짜
	private String result;  //경기결과
	private int totalWins;
	private int totalTie;
	private int totalLose;
	private String teamName;
	private int rank;
	private String fileName;
	private String fileImage;
	private String gameId;
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileImage() {
		return fileImage;
	}

	public void setFileImage(String fileImage) {
		this.fileImage = fileImage;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getRecent() {
		return recent;
	}

	public void setRecent(String recent) {
		this.recent = recent;
	}

	public int getTotalWins() {
		return totalWins;
	}

	public void setTotalWins(int totalWins) {
		this.totalWins = totalWins;
	}

	public int getTotalTie() {
		return totalTie;
	}

	public void setTotalTie(int totalTie) {
		this.totalTie = totalTie;
	}

	public int getTotalLose() {
		return totalLose;
	}

	public void setTotalLose(int totalLose) {
		this.totalLose = totalLose;
	}

	
	public TeamWinning() {
		super();
		// TODO Auto-generated constructor stub
	}



    // countRecentWins 메서드를 구현하지 않고, 서비스 레이어에서 처리하는 것이 좋을 것 같습니다.
    // 메서드를 호출하는 측에서 필요한 로직을 구현하도록 유도합니다.	

	public String getWinningId() {
		return winningId;
	}


	public void setWinningId(String winningId) {
		this.winningId = winningId;
	}


	public String getTeamId() {
		return teamId;
	}


	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}


	public int getMatches() {
		return matches;
	}


	public void setMatches(int matches) {
		this.matches = matches;
	}


	public double getRate() {
		return rate;
	}


	public void setRate(double rate) {
		this.rate = rate;
	}





	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	
	
}