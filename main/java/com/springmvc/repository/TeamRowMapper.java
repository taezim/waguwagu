package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.jstl.sql.Result;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Team;

public class TeamRowMapper implements RowMapper<Team>{

	public Team mapRow(ResultSet rs, int rowNum) throws SQLException{
		Team team = new Team();
		team.setTeamId(rs.getString(1));
		team.setTeamName(rs.getString(2));
		team.setMemberNumber(rs.getInt(3));
		team.setPhoneNumber(rs.getString(4));
		team.setLeaderName(rs.getString(5));
		team.setPrefArea(rs.getString(6));
		team.setFileName(rs.getString(7));
		team.setDescription(rs.getString(8));
		return team;
	}
}
