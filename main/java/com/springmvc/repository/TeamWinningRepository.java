package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.TeamWinning;

public interface TeamWinningRepository {

	List<TeamWinning> readAllWinningList();
	TeamWinning readWinningById(String teamId);
	List<TeamWinning> getRecentMatchesResults(String teamId);
	List<TeamWinning> calAndSortWinningRate();
	int totalWins(String teamId);
	int totalTie(String teamId);
	int totalLose(String teamId);
	int totalGames(String teamId);
	double calculateWinningRate(String teamId);
	
	void setNewWinning(TeamWinning teamWinning);
	void setUpdateWinning(TeamWinning teamWinning);
	void setDeleteWinning(String winningId);
}
//이 클래스는 주로 데이터베이스에서 조회된 특정 팀의 성적 정보를 담는 데 사용되며, 
//객체 간의 데이터 전송이나 저장에 용이합니다. 
//JPA(Entity)로 사용되기 위해서 @Entity 어노테이션이 추가되면 특정 데이터베이스 테이블과 매핑할 수 있습니다.