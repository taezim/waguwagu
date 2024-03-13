package com.springmvc.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Team;
import com.springmvc.domain.TeamWinning;
import com.springmvc.service.TeamWinningService;


@Repository
public class TeamWinningRepositoryImpl implements TeamWinningRepository{

	private JdbcTemplate template;
	
	@Autowired
	private TeamRepository teamRepository;
	
	@Autowired
	private TeamWinningService teamWinningService;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template=new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<TeamWinning> readAllWinningList() {
		String SQL = "SELECT * FROM t_score";
		List<TeamWinning> listOfWinnings = template.query(SQL, new TeamWinningRowMapper());
		
		
		return listOfWinnings;
	}

	@Override
	public TeamWinning readWinningById(String teamId) {
	    String SQL = "SELECT * FROM t_score WHERE teamid=?";
	    List<TeamWinning> resultList = template.query(SQL, new Object[]{teamId}, new TeamWinningRowMapper());

	    if (!resultList.isEmpty()) {
	        // teamId에 해당하는 결과가 있는 경우
	        return resultList.get(0); // 일단은 첫 번째 결과를 반환하도록 함
	    } else {
	        // teamId에 해당하는 결과가 없는 경우
	    	return null;  //해당 값없어도 예외 던지지않고 페이지 그대로 출력함
	        //throw new IllegalArgumentException("일치하는 결과가 없습니다.");
	    }
		
	}

	 //최근10경기보여주기
	
	@Override
	public List<TeamWinning> getRecentMatchesResults(String teamId) {
		String SQL = "SELECT * FROM t_score WHERE teamId=? ORDER BY ts_date desc limit 10";
		List<TeamWinning> listOfRecent = template.query(SQL, new TeamWinningRowMapper(), teamId);

	    // 해당 TeamWinning 객체 가져오기
	    TeamWinning teamWinning = readWinningById(teamId);

	    // 가져온 TeamWinning 객체에 recent 저장
	    if (teamWinning != null) {
			/* teamWinning.setRecent(listOfRecent); */
	    }

	    return listOfRecent;
	}
	
	
	
	//create
	@Override 
	public void setNewWinning(TeamWinning teamWinning) {
		String SQL = "INSERT INTO t_score (ts_id, teamid, ts_matches, ts_result, ts_date)"+"VALUES(?, ?, ?, ?, ?)";
		template.update(SQL,teamWinning.getWinningId(),teamWinning.getTeamId(),teamWinning.getMatches(),teamWinning.getResult(),teamWinning.getDate());
	}

	@Override
	public void setUpdateWinning(TeamWinning teamWinning) {
		String SQL = "UPDATE t_score SET teamid=?, ts_matches=?, ts_result=?, ts_date=? WHERE ts_id=?";
		template.update(SQL,teamWinning.getTeamId(),teamWinning.getMatches(),teamWinning.getResult(),teamWinning.getDate(),teamWinning.getWinningId());
	}

	@Override
	public void setDeleteWinning(String winningId) {
		String SQL = "DELETE FROM t_score WHERE ts_id=?";
		this.template.update(SQL, winningId);
		
	}


	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public int totalWins(String teamId) {
		String SQL = "SELECT COUNT(*) AS totalWins FROM t_score WHERE teamId=? AND ts_result='Win'";
		
		int totalWins = template.queryForObject(SQL, Integer.class, teamId);
		
		// 해당 TeamWinning 객체 가져오기
	    TeamWinning teamWinning = readWinningById(teamId);

	    // 가져온 TeamWinning 객체에 totalWins 저장
	    if (teamWinning != null) {
	        
	        teamWinning.setTotalWins(totalWins);
	    }

	    return totalWins;
	
	}

	@Override
	public int totalTie(String teamId) {
		String SQL = "SELECT COUNT(*) AS totalTie FROM t_score WHERE teamId=? AND ts_result='Tie'";
	
		int totalTie = template.queryForObject(SQL, Integer.class, teamId);
	
		// 해당 TeamWinning 객체 가져오기
	    TeamWinning teamWinning = readWinningById(teamId);

	    // 가져온 TeamWinning 객체에 totalTie 저장
	    if (teamWinning != null) {
	        
	        teamWinning.setTotalWins(totalTie);
	    }

	    return totalTie;
	}

	@Override
	public int totalLose(String teamId) {
		String SQL = "SELECT COUNT(*) AS totalLose FROM t_score WHERE teamId=? AND ts_result='Lose'";
		
		int totalLose = template.queryForObject(SQL, Integer.class, teamId);
		// 해당 TeamWinning 객체 가져오기
	    TeamWinning teamWinning = readWinningById(teamId);

	    // 가져온 TeamWinning 객체에 totalLose 저장
	    if (teamWinning != null) {
	        
	        teamWinning.setTotalWins(totalLose);
	    }

	    return totalLose;
	
	}
	
	//승률 보여주기 (나중에 순위 보여주려면 저기서 내림차순?으로 순위 매기기 그리고 where 조건하고 sql문 조금 바꿔야함 groupby teamId로 해야함

	@Override
	public double calculateWinningRate(String teamId) {
		String SQL = "SELECT COUNT(*) FROM t_score WHERE teamId=? AND ts_result='Win'";
		int totalWins = template.queryForObject(SQL, Integer.class, teamId);
		
		String totalGamesSQL = "SELECT COUNT(*) FROM t_score WHERE teamId=?";
		int totalGames = template.queryForObject(totalGamesSQL, Integer.class, teamId);
		
		 double rate = (totalGames > 0) ? ((double) totalWins / totalGames) * 100 : 0.0;

		    // 해당 TeamWinning 객체 가져오기
		    TeamWinning teamWinning = readWinningById(teamId);

		    // 가져온 TeamWinning 객체에 winningRate 저장
		    if (teamWinning != null) {
		        teamWinning.setRate(Math.round(rate * 1000.0) / 1000.0);
		    }

		    return Math.round(rate * 1000.0) / 1000.0;
		}

	@Override
	public int totalGames(String teamId) {
		String SQL = "SELECT COUNT(*) FROM t_score WHERE teamId=?";
		int matches = template.queryForObject(SQL, Integer.class, teamId);
	
	    TeamWinning teamWinning = readWinningById(teamId);

	    // 가져온 TeamWinning 객체에 matches 저장
	    if (teamWinning != null) {
	        
	        teamWinning.setTotalWins(matches);
	    }

	    return matches;
	}

	@Override
	public List<TeamWinning> calAndSortWinningRate(){
		  List<TeamWinning> allWinningList = readAllWinningList();

		    // 중복된 teamId를 제거하기 위한 Set
		    Set<String> uniqueTeamIds = new HashSet<>();

		    // 중복을 제거하고 계산한 결과를 저장할 List
		    List<TeamWinning> uniqueWinningList = new ArrayList<>();

		    // 팀별 계산한 것들 저장
		    for (TeamWinning teamWinning : allWinningList) {
		        String teamId = teamWinning.getTeamId();

		        // 중복된 teamId인 경우 스킵
		        if (uniqueTeamIds.contains(teamId)) {
		            continue;
		        }

		        // 중복 제거된 teamId를 Set에 추가
		        uniqueTeamIds.add(teamId);
		
		        
		        // TeamWinning에서 팀 이름을 가져오기 위해 Repository 또는 Service를 이용하여 Team 객체를 조회
		        Team team = teamRepository.readTeamById(teamId);
		        
				/* Team team = new Team(); */
		        int totalWins = totalWins(teamId);
		        int totalLose = totalLose(teamId);
		        int totalTie = totalTie(teamId);
		        double winningRate = calculateWinningRate(teamId);
		        int totalGames = totalGames(teamId);
		        String recent = teamWinningService.getRecentMatchesResult(teamId);
		        String teamName = team.getTeamName();
		        String fileName = team.getFileName();
		        
		        // 새로운 TeamWinning 객체에 값 설정
		        TeamWinning uniqueTeamWinning = new TeamWinning();
		        uniqueTeamWinning.setTeamId(teamId);
		        uniqueTeamWinning.setTotalWins(totalWins);
		        uniqueTeamWinning.setTotalLose(totalLose);
		        uniqueTeamWinning.setTotalTie(totalTie);
		        uniqueTeamWinning.setRate(winningRate);
		        uniqueTeamWinning.setMatches(totalGames);
		        uniqueTeamWinning.setRecent(recent);
		        uniqueTeamWinning.setTeamName(teamName);
		        uniqueTeamWinning.setFileName(fileName);
		        System.out.println(teamName);
		        System.out.println(fileName);
		        // Team이 null이 아닌 경우에만 팀 이름 설정
		        if (team != null) {
		            uniqueTeamWinning.setTeamName(team.getTeamName());
		            System.out.println(team.getTeamName());
		        }
		        
		        // 중복을 제거하고 계산한 결과를 저장
		        uniqueWinningList.add(uniqueTeamWinning);
		        
		    }

		    // 승률을 기준으로 내림차순으로 정렬
		    Collections.sort(uniqueWinningList, Comparator.comparingDouble(TeamWinning::getRate).reversed());

		 // 순위 부여 및 출력
		    int rank = 1;
		    for (TeamWinning teamWinning : uniqueWinningList) {
		        teamWinning.setRank(rank++);
		    }


		    
		    return uniqueWinningList;
	}
}