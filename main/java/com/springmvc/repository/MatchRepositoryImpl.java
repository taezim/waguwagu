package com.springmvc.repository;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Match;


@Repository
public class MatchRepositoryImpl implements MatchRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template=new JdbcTemplate(dataSource);
	}
	
	@Override
	public Match readMatchById(String gameId) {

	    Match matchInfo = null;
	    
	    String SQL = "select count(*) from matching where g_id=?";
	    
	    int rowCount = template.queryForObject(SQL, Integer.class, gameId);
	    
	    if(rowCount != 0) {
	        SQL = "select * from matching where g_id=?";
	        matchInfo = template.queryForObject(SQL, new Object[] {gameId}, new MatchRowMapper());
	    }
		/*
		 * if(rowCount == 0) { throw new IllegalArgumentException("일치하는 항목이 없습니다."); }
		 */
	    return matchInfo;
	}

	@Override
	public void setNewMatch(Match match) {
		String SQL = "insert into matching(g_id,t_id,t_name,userid,username,userphone,g_filename)"+"values(?,?,?,?,?,?,?)";
		
		template.update(SQL,match.getGameId(), match.getTeamId(), match.getTeamName(), match.getUserId(),match.getUserName(),match.getUserNumber(),match.getFileName());
		System.out.println("setNew도착");
		System.out.println(match.getFileName());
	}

	@Override
	public void setUpdateMatch(Match match) {
		
		if(match.getFileName()!=null) {
			String SQL = "UPDATE matching SET t_id=?,t_name=?,userid=?,username=?,userphone=?,g_stadium=?,g_filename=? WHERE g_id=?";
			template.update(SQL, match.getTeamId(), match.getTeamName(), match.getUserId(),match.getUserName(),match.getUserNumber(),match.getFileName(),match.getGameId());
		}
		else if(match.getFileName()==null) {
			String SQL = "UPDATE matching SET t_id=?,t_name=?,userid=?,username=?,userphone=? WHERE g_id=?";
			template.update(SQL, match.getTeamId(), match.getTeamName(), match.getUserId(),match.getUserName(),match.getUserNumber(),match.getGameId());
		}
		
	}

	@Override
	public void setDeletMatch(String gameId) {
		String SQL = "DELETE FROM matching WHERE g_id=?";
		this.template.update(SQL, gameId);
		
	}

}
