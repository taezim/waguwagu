package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Atbat;

@Repository
public class AtbatRepositoryImpl implements AtbatRepository {

	
	//DB 
	
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	//객체들 담을 list 객체 생성
	private List<Atbat> listOfAtbat = new ArrayList<Atbat>();
	
	@Override
	public List<Atbat> readAllAtbat() {
		// TODO Auto-generated method stub
		String SQL = "select * from atbat";
		List<Atbat> listOfAtbat = template.query(SQL, new AtbatRowMapper());
		return listOfAtbat;
	}

	@Override
	public Atbat readAtbatByNumber(String atbatnumber) {
		// TODO Auto-generated method stub
		Atbat atbatInfo = null;
		
		String SQL = "select count(*) from atbat where atbatplayerID=?";
		int rowCount = template.queryForObject(SQL, Integer.class, atbatnumber);
		if(rowCount != 0)
		{
			SQL = "select * from atbat where atbatplayerID =? ";
			atbatInfo = template.queryForObject(SQL, new Object[] {atbatnumber}, new AtbatRowMapper());
		}
		return atbatInfo;
	}

	@Override
	public List<Atbat> readAtbatListByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void createAtbat(Atbat answer) {
	    if (answer.getMatches() == 0) {
	        answer.setOdds(0.0f);
	    } else {
	        answer.setOdds((float) (answer.getWin() * 100) / answer.getMatches());
	    }
	    
	    if (answer.getInnings() == 0) {
	        answer.setOnBaseAllowed(0.0);
	    } else {
	        answer.setOnBaseAllowed((double) (answer.getHitsAllowed() + answer.getWalks() + answer.getHitByPitch()) / (answer.getInnings() * 3));
	    }

	    String SQL = "INSERT INTO atbat (atbatplayerID, matches, win, loss, save, hold, odds, innings, hitsAllowed, homeRunsAllowed, walks, hitByPitch, strikeouts, runs, earnedRuns, onBaseAllowed) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	    template.update(SQL, answer.getAtbatplayerID(),
	            answer.getMatches(),
	            answer.getWin(),
	            answer.getLoss(),
	            answer.getSave(),
	            answer.getHold(),
	            answer.getOdds(),
	            answer.getInnings(),
	            answer.getHitsAllowed(),
	            answer.getHomeRunsAllowed(),
	            answer.getWalks(),
	            answer.getHitByPitch(),
	            answer.getStrikeouts(),
	            answer.getRuns(),
	            answer.getEarnedRuns(),
	            answer.getOnBaseAllowed());
	    
	    listOfAtbat.add(answer);
	}


	@Override
	public void updateAtbat(Atbat person) {
	    // TODO Auto-generated method stub
		String SQL = "UPDATE atbat SET matches=?, win=?, loss=?, save=?, hold=?, odds=?, innings=?, hitsAllowed=?, homeRunsAllowed=?, walks=?, hitByPitch=?, strikeouts=?, runs=?, earnedRuns=?,  onBaseAllowed=? WHERE atbatplayerID = ?";

		template.update(SQL, person.getMatches(),
		        person.getWin(),
		        person.getLoss(),
		        person.getSave(),
		        person.getHold(),
		        person.getOdds(),
		        person.getInnings(),
		        person.getHitsAllowed(),
		        person.getHomeRunsAllowed(),
		        person.getWalks(),
		        person.getHitByPitch(),
		        person.getStrikeouts(),
		        person.getRuns(),
		        person.getEarnedRuns(),
		        person.getOnBaseAllowed(),
		        person.getAtbatplayerID());


	}


	@Override
	public void deleteAtbat(String pnumber) {
		// TODO Auto-generated method stub
		String SQL = "delete from atbat where atbatplayerID = ?";
		this.template.update(SQL, pnumber);
	}

}