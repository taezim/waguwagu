package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.TeamWinning;

public class TeamWinningRowMapper implements RowMapper<TeamWinning> {
	

	@Override
	public TeamWinning mapRow(ResultSet rs, int rowNum) throws SQLException {
		TeamWinning teamWinning = new TeamWinning();
		teamWinning.setWinningId(rs.getString(1));
		teamWinning.setTeamId(rs.getString(2));
		teamWinning.setMatches(rs.getInt(3));
		teamWinning.setResult(rs.getString(4));
		teamWinning.setDate(rs.getString(5));
		
		return teamWinning;
	}
	
}