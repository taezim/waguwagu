package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Match;
import com.springmvc.repository.MatchRepository;

@Service
public class MatchServiceImpl implements MatchService{

	@Autowired
	MatchRepository matchRepository;
	
	@Override
	public Match readMatchById(String gameId) {
		Match gameById = matchRepository.readMatchById(gameId);
		return gameById;
	}

	@Override
	public void setNewMatch(Match match) {
		matchRepository.setNewMatch(match);
		
	}

	@Override
	public void setUpdateMatch(Match match) {
		matchRepository.setUpdateMatch(match);
		
	}

	@Override
	public void setDeletMatch(String gameId) {
		matchRepository.setDeletMatch(gameId);
		
	}

}
