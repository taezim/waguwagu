package com.springmvc.repository;

import com.springmvc.domain.Match;

public interface MatchRepository {
	
	Match readMatchById(String gameId);
	
	void setNewMatch(Match match);
	void setUpdateMatch(Match match);
	void setDeletMatch(String gameId);
}
