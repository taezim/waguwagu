package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Team;

public interface TeamRepository {

	List<Team> readAllTeamList();
	List<Team> readTeamListByArea(String prefArea);
	
	Team readTeamById(String teamId);
	void setNewTeam(Team team);
	
	void setUpdateTeam(Team team);
	void setDeleteTeam(String teamId);
	List<Team> findByLocation(String location);
	void joinTeam(String userId, String teamId);
	boolean isMember(String userId, String teamId);
}
