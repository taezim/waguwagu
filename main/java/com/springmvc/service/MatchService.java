package com.springmvc.service;

import com.springmvc.domain.Match;

public interface MatchService {

	Match readMatchById(String gameId);
	
	void setNewMatch(Match match);
	void setUpdateMatch(Match match);
	void setDeletMatch(String gameId);
}
