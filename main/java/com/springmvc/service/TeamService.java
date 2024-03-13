package com.springmvc.service;

import java.util.List;


import com.springmvc.domain.Team;

public interface TeamService {

	List<Team> readAllTeamList();
	List<Team> readTeamListByCategory(String category);
	
	Team readTeamById(String teamId);
	
	void setNewTeam(Team team);
	
	void setUpdateTeam(Team team);
	void setDeleteTeam(String teamId);

	List<Team> findByLocation(String location);
	boolean joinTeam(String userId, String teamId);
	
	String getTeamId(String userId);
}
