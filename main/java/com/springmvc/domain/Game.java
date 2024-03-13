package com.springmvc.domain;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Game implements Serializable {
	
	private static final long serialVersionUID = -1774939428596054428L;
	
	private String gameId;  //게임아이디
	private String teamId1;  //팀아이디1 not null

	private String teamName1;  //팀명1 not null
	private String time;
	private String date;  //경기날짜
	private String userId;   //사용자 아이디
	private String userName;  //사용자 이름
	private String userNumber;   //사용자전화번호
	private String stadium;   //경기장
	private String fileName;
	private MultipartFile gameImage;
	private Match match;
	private List<Match> matches = new ArrayList<>();
	
	public List<Match> getMatches(){
		return matches;
	}
	
	public Game() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		
		this.time = time;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getGameImage() {
		return gameImage;
	}

	public void setGameImage(MultipartFile gameImage) {
		this.gameImage = gameImage;
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public String getTeamId1() {
		return teamId1;
	}

	public void setTeamId1(String teamId1) {
		this.teamId1 = teamId1;
	}

	

	public String getTeamName1() {
		return teamName1;
	}

	public void setTeamName1(String teamName1) {
		this.teamName1 = teamName1;
	}

	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getStadium() {
		return stadium;
	}

	public void setStadium(String stadium) {
		this.stadium = stadium;
	}

	public Match getMatch() {
		return match;
	}

	public void setMatch(Match match) {
		this.match = match;
	}


	
}
