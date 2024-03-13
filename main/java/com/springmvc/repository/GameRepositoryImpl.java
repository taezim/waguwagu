package com.springmvc.repository;

import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Game;
import com.springmvc.domain.Match;

@Repository
public class GameRepositoryImpl implements GameRepository{

	
	private JdbcTemplate template;
	private List<Game> listOfGames = new ArrayList<Game>();
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public List<Game> readAllGame() {
	    String SQL = "SELECT * FROM game g LEFT JOIN matching m ON g.g_id = m.g_id ORDER BY g.g_date DESC;";

	    List<Game> games = template.query(SQL, (rs, rowNum) -> {
	        String gameId = rs.getString("g.g_id");

	        Game game = new Game();
	        game.setGameId(gameId);
	        game.setTeamId1(rs.getString("g.t_id1"));
	        game.setTeamName1(rs.getString("g.t_name1"));
	        game.setDate(rs.getString("g.g_date"));
	        game.setUserId(rs.getString("g.userid"));
	        game.setUserName(rs.getString("g.username"));
	        game.setUserNumber(rs.getString("g.userphone"));
	        game.setStadium(rs.getString("g.g_stadium"));
	        game.setFileName(rs.getString("g.g_filename"));
	        //game.setFileName(rs.getString("g.g_time"));
	        // java.sql.Time을 LocalTime으로 변환하여 설정
	        
			/* game.setTime(localTime); */
	        
	        Match match = new Match();
	        match.setTeamId(rs.getString("m.t_id"));
	        match.setTeamName(rs.getString("m.t_name"));
	        match.setUserId(rs.getString("m.userid"));
	        match.setUserName(rs.getString("m.username"));
	        match.setUserNumber(rs.getString("m.userphone"));
	        match.setFileName(rs.getString("m.g_filename"));

	        game.getMatches().add(match);

	        return game;
	    });

	    return games;
	}

	@Override
	public Game readGameById(String gameId) {
		String SQL = "SELECT * FROM game g LEFT JOIN matching m ON g.g_id = m.g_id WHERE g.g_id = ?";
		Map<String, Game> gameMap = new HashMap<>();
	    
	    template.query(SQL, new Object[]{gameId}, rs -> {
	        String currentGameId  = rs.getString("g.g_id");
	        
	        // Game 객체가 이미 Map에 있는지 확인
	        Game game = gameMap.get(currentGameId );
	        if (game == null) {
	            // Map에 없다면 Game 객체 생성
	            game = new Game();
	            game.setGameId(currentGameId );
	            // 기존의 Game 속성 설정 코드
	            gameMap.put(currentGameId , game);
	        }
	        
	        game.setTeamId1(rs.getString("g.t_id1"));
	        game.setTeamName1(rs.getString("g.t_name1"));
	        game.setDate(rs.getString("g.g_date"));
	        game.setUserId(rs.getString("g.userid"));
	        game.setUserName(rs.getString("g.username"));
	        game.setUserNumber(rs.getString("g.userphone"));
	        game.setStadium(rs.getString("g.g_stadium"));
	        game.setFileName(rs.getString("g.g_filename"));
	        // java.sql.Time을 LocalTime으로 변환하여 설정
	        //game.setFileName(rs.getString("g.g_time"));
			/* game.setTime(localTime); */
	        
	        // Match 객체 생성 및 설정
	        Match match = new Match();
	        match.setTeamId(rs.getString("m.t_id"));
	        match.setTeamName(rs.getString("m.t_name"));
	        match.setUserId(rs.getString("m.userid"));
	        match.setUserName(rs.getString("m.username"));
	        match.setUserNumber(rs.getString("m.userphone"));
	        match.setFileName(rs.getString("m.g_filename"));
	        // 다른 Match 속성 설정 코드들...

	        // Game 객체에 Match 추가
	        game.getMatches().add(match);
	    });     
	    return gameMap.get(gameId);
	}

	@Override
	public void setNewGame(Game game) {
		
		String SQL = "INSERT INTO game(g_id, t_id1, t_name1, g_date, userid, username, userphone, g_stadium, g_filename)"+"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		template.update(SQL,game.getGameId(), game.getTeamId1(), game.getTeamName1(), game.getDate(), game.getUserId(), game.getUserName(), game.getUserNumber(), game.getStadium(),game.getFileName());
		System.out.println("memberId="+game.getUserId());
	}

	@Override
	public void setUpdateGame(Game game) {
		if(game.getFileName()!=null) {
			String SQL = "UPDATE game SET t_id1=?,t_name1=?,g_date=?,userid=?,username=?,userphone=?,g_stadium=?,g_filename=? WHERE g_id=?";
			template.update(SQL,game.getTeamId1(), game.getTeamName1(), game.getDate(), game.getUserId(),game.getUserName(),game.getUserNumber(),game.getStadium(),game.getFileName(),game.getGameId());
		}
		else if(game.getFileName()==null) {
			String SQL = "UPDATE game SET t_id1=?,t_name1=?,g_date=?,userid=?,username=?,userphone=?,g_stadium=? WHERE g_id=?";
			template.update(SQL, game.getTeamId1(), game.getTeamName1(), game.getDate(), game.getUserId(),game.getUserName(),game.getUserNumber(),game.getStadium(),game.getGameId());
		}
		
	}

	@Override
	public void setDeleteGame(String gameId) {
		String SQL = "DELETE FROM game WHERE g_id=?";
		this.template.update(SQL, gameId);
		
	}
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

}
