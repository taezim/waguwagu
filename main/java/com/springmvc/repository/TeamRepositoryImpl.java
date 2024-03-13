package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Team;

@Repository
public class TeamRepositoryImpl implements TeamRepository{
	
	private JdbcTemplate template;
	

	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}


	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}


	@Override
	public List<Team> readAllTeamList() {
		String SQL = "SELECT * FROM team";
		List<Team> listOfTeams = template.query(SQL, new TeamRowMapper());
		return listOfTeams;
	}

	@Override
	public List<Team> readTeamListByArea(String prefArea) {

		List<Team> teamsByArea = new ArrayList<Team>();
		
		String SQL = "SELECT * FROM team where t_place LIKE '%"+prefArea+"%'";
		teamsByArea = template.query(SQL, new TeamRowMapper());
		
		return teamsByArea;
	}

	@Override
	public Team readTeamById(String teamId) {
		Team teamInfo = null;
		String SQL = "SELECT COUNT(*) FROM TEAM WHERE t_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, teamId);
		if(rowCount!=0) {
			SQL = "SELECT * FROM team WHERE t_id=?";
			teamInfo = template.queryForObject(SQL, new Object[] {teamId}, new TeamRowMapper());
		}
		if(teamInfo==null) {
			throw new IllegalArgumentException("구단 ID가 "+teamId+"인 구단을 찾을 수 없습니다.");
		}

		return teamInfo;
	}

	@Override
	public void setNewTeam(Team team) {
		
		String SQL = "INSERT INTO team (t_id, t_name, t_people, t_number, t_leader, t_place, t_filename,description)" + "VALUES(?, ?, ?, ?, ?, ?, ?,?)";
		template.update(SQL, team.getTeamId(),team.getTeamName(),team.getMemberNumber(),team.getPhoneNumber(),team.getLeaderName(),team.getPrefArea(),team.getFileName(),team.getDescription());
	}

	@Override
	public void setUpdateTeam(Team team) {
		
		if(team.getFileName()!=null) {
			String SQL = "UPDATE team SET t_name=?, t_people=?, t_number=?, t_leader=?, t_place=?, t_filename=?, description=? WHERE t_id=?";
			template.update(SQL, team.getTeamName(),team.getMemberNumber(),team.getPhoneNumber(),team.getLeaderName(),team.getPrefArea(),team.getFileName(),team.getDescription(),team.getTeamId());
		}
		else if(team.getFileName()==null) {
			String SQL = "UPDATE team SET t_name=?, t_people=?, t_number=?, t_leader=?, t_place=?, description=? WHERE t_id=?";
			template.update(SQL, team.getTeamName(),team.getMemberNumber(),team.getPhoneNumber(),team.getLeaderName(),team.getPrefArea(),team.getDescription(), team.getTeamId());

		}
	}

	@Override
	public void setDeleteTeam(String teamId) {
		String SQL = "DELETE FROM team WHERE t_id=?";
		this.template.update(SQL, teamId);
	}


	@Override
	public List<Team> findByLocation(String location) {
	    if (StringUtils.isBlank(location) || location.equals(" ")) {
	        // 빈 문자열이나 null 또는 공백이면 전체 조회
	        String SQL = "SELECT * FROM team";
	        return template.query(SQL, new TeamRowMapper());
	    } else {
	        // 아니면 지정된 지역을 조회
	        String SQL = "SELECT * FROM team WHERE t_place LIKE ?";
	        String parameter = "%" + location + "%";
	        return template.query(SQL, new Object[] {parameter}, new TeamRowMapper());
	    }
	}


	@Override
	public void joinTeam(String userId, String teamId) {
		
		String updateMemberSQL = "UPDATE member SET m_team = ? WHERE m_id = ?";
	    template.update(updateMemberSQL, teamId, userId);
	    
		String SQL = "INSERT INTO teammember (userid, t_id, joindate) VALUES (?, ?, CURRENT_TIMESTAMP)";
        template.update(SQL, userId, teamId);
		
	}


	@Override
	public boolean isMember(String userId, String teamId) {
		String SQL = "SELECT COUNT(*) FROM teammember WHERE userid = ? AND t_id = ?";
        int count = template.queryForObject(SQL, Integer.class, userId, teamId);
        return count > 0;
	}

	
	

}
