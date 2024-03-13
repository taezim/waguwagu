package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Match;

public class MatchRowMapper implements RowMapper<Match>{

	@Override
	public Match mapRow(ResultSet rs, int rowNum) throws SQLException {
		Match match = new Match();
		match.setGameId(rs.getString(1));
		match.setTeamId(rs.getString(2));

		match.setTeamName(rs.getString(3));
		
		match.setUserId(rs.getString(4));
		match.setUserName(rs.getString(5));
		match.setUserNumber(rs.getString(6));
		
		match.setFileName(rs.getString(7));
		return match;
	}

}
