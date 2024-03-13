package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Match implements Serializable {


	private static final long serialVersionUID = 1226981758454687975L;
	
	private Game game;
	private String gameId;  //게임아이디
	private String teamId;  //팀아이디 not null

	private String teamName;  //팀명 not null

	//private String date;  //경기날짜
	private String userId;   //사용자 아이디
	private String userName;  //사용자 이름
	private String userNumber;   //사용자전화번호
	//private String stadium;   //경기장
	private String fileName;
	private MultipartFile gameImage;
	public Match() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getGameId() {
		return gameId;
	}
	public void setGameId(String gameId) {
		this.gameId = gameId;
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
	
//	public String getDate() {
//		return date;
//	}
//	public void setDate(String date) {
//		this.date = date;
//	}
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
//	public String getStadium() {
//		return stadium;
//	}
//	public void setStadium(String stadium) {
//		this.stadium = stadium;
//	}
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
	public Game getGame() {
		return game;
	}
	public void setGame(Game game) {
		this.game = game;
	}
	

}
