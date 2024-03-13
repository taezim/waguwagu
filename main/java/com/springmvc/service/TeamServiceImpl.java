package com.springmvc.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Team;
import com.springmvc.repository.TeamRepository;

@Service
public class TeamServiceImpl implements TeamService{
	
	private JdbcTemplate template;
	
	@Autowired
	private TeamRepository teamRepository;

	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}


	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Override
	public List<Team> readAllTeamList() {
		// TODO Auto-generated method stub
		return teamRepository.readAllTeamList();
	}

	@Override
	public List<Team> readTeamListByCategory(String prefArea) {

		List<Team> teamsByArea = teamRepository.readTeamListByArea(prefArea);
		
		return teamsByArea;
	}

	@Override
	public Team readTeamById(String teamId) {
		Team teamById = teamRepository.readTeamById(teamId);
		
		return teamById;
	}

	@Override
	public void setNewTeam(Team team) {
		teamRepository.setNewTeam(team);
		
	}

	@Override
	public void setUpdateTeam(Team team) {
		teamRepository.setUpdateTeam(team);
		
	}

	@Override
	public void setDeleteTeam(String teamId) {
		teamRepository.setDeleteTeam(teamId);
		
	}

	@Override
	public List<Team> findByLocation(String location) {
		// TODO Auto-generated method stub
		return teamRepository.findByLocation(location);
	}

	@Override
	public boolean joinTeam(String userId, String teamId) {
		// 이미 팀에 속한 멤버인지 확인
        boolean isMember = teamRepository.isMember(userId, teamId);

        // 팀에 속하지 않은 경우에만 가입 처리
        if (!isMember) {
            teamRepository.joinTeam(userId, teamId);
            return true;
        }
        return false;
		
	}

	@Override
	public String getTeamName(String teamId) {
		try {
	        String SQL = "select t_name from team where t_id=?";
	        return template.queryForObject(SQL, String.class, teamId);
	    } catch (EmptyResultDataAccessException e) {
	        // 예외가 발생하면 null을 반환하거나 다른 적절한 값을 반환할 수 있습니다.
	        return null;
	    }
	}


	@Override
	public String getTeamImage(String teamId) {
		try {
	        String SQL = "select t_filename from team where t_id=?";
	        return template.queryForObject(SQL, String.class, teamId);
	    } catch (EmptyResultDataAccessException e) {
	        // 예외가 발생하면 null을 반환하거나 다른 적절한 값을 반환할 수 있습니다.
	        return null;
	    }
	}
	
}
