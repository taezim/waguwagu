package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.TeamWinning;

public interface TeamWinningService {

	List<TeamWinning> readAllWinningList();
	TeamWinning readWinningById(String winningId);
	String getRecentMatchesResult(String teamId);
	int totalWins(String teamId);
	int totalTie(String teamId);
	int totalLose(String teamId);
	int totalGames(String teamId);
	void setNewWinning(TeamWinning teamWinning);
	void setUpdateWinning(TeamWinning teamWinning);
	void setDeleteWinning(String winningId);
	double calculateWinningRate(String teamId);

}