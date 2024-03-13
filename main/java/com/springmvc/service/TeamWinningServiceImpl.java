package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.TeamWinning;
import com.springmvc.repository.TeamWinningRepository;

@Service
public class TeamWinningServiceImpl implements TeamWinningService {

	@Autowired
	private TeamWinningRepository teamWinningRepository;
	
	
	@Override
	public List<TeamWinning> readAllWinningList() {
		
		return teamWinningRepository.readAllWinningList();
	}

	@Override
	public TeamWinning readWinningById(String teamId) {
		TeamWinning teamById = teamWinningRepository.readWinningById(teamId);
		return teamById;
	}

//최근10경기
	@Override
	public String getRecentMatchesResult(String teamId) {
		List<TeamWinning> recentMatchesResults = teamWinningRepository.getRecentMatchesResults(teamId);
		return calculateRecentMatchesResult(recentMatchesResults);
	}
	
	private String calculateRecentMatchesResult(List<TeamWinning> recentMatchesResults) {
		int recentWins=0;
		int recentTies=0;
		int recentLosses=0;
		
		for(TeamWinning result : recentMatchesResults) {
			if("Win".equals(result.getResult())) {
				recentWins++;
			}
			else if("Lose".equals(result.getResult())) {
				recentLosses++;
			}
			else if("Tie".equals(result.getResult())) {
				recentTies++;
			}
		}
		return recentWins + "승" + recentTies + "무" +recentLosses+"패";
	}
	

	@Override
	public void setNewWinning(TeamWinning teamWinning) {
		teamWinningRepository.setNewWinning(teamWinning);
		
	}

	@Override
	public void setUpdateWinning(TeamWinning teamWinning) {
		teamWinningRepository.setUpdateWinning(teamWinning);
		
	}

	@Override
	public void setDeleteWinning(String winningId) {
		teamWinningRepository.setDeleteWinning(winningId);
		
	}

	@Override
	public int totalWins(String teamId) {
		// TODO Auto-generated method stub
		return teamWinningRepository.totalWins(teamId);
	}

	@Override
	public int totalTie(String teamId) {
		// TODO Auto-generated method stub
		return teamWinningRepository.totalTie(teamId);
	}

	@Override
	public int totalLose(String teamId) {
		// TODO Auto-generated method stub
		return teamWinningRepository.totalLose(teamId);
	}

	@Override
	public double calculateWinningRate(String teamId) {
		// TODO Auto-generated method stub
		return teamWinningRepository.calculateWinningRate(teamId);
	}

	@Override
	public int totalGames(String teamId) {
		// TODO Auto-generated method stub
		return teamWinningRepository.totalGames(teamId);
	} 

	

}