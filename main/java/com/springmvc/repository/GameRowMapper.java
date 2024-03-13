package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Game;
import com.springmvc.domain.Match;

public class GameRowMapper implements RowMapper<Game>{

	@Override
	public Game mapRow(ResultSet rs, int rowNum) throws SQLException {
		Game game = new Game();
		game.setGameId(rs.getString(1));
		game.setTeamId1(rs.getString(2));
	
		game.setTeamName1(rs.getString(3));
	
		game.setDate(rs.getString(4));
		game.setUserId(rs.getString(5));
		game.setUserName(rs.getString(6));
		game.setUserNumber(rs.getString(7));
		game.setStadium(rs.getString(8));
		game.setFileName(rs.getString(9));
		//game.setTime(rs.getString(10));
		
		
		
		Match match = new Match();
		
		match.setGameId(rs.getString("g_id"));
		match.setTeamId(rs.getString("t_id"));
		match.setTeamName(rs.getString("t_name"));		
		match.setUserId(rs.getString("userid"));
		match.setUserName(rs.getString("username"));
		match.setUserNumber(rs.getString("userphone"));		
		match.setFileName(rs.getString("g_filename"));
		
		game.getMatches().add(match);
		
		return game;
	}

}
