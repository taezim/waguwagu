package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Atbat;

public class AtbatRowMapper implements RowMapper<Atbat>{

	 public Atbat mapRow(ResultSet rs, int rowNum) throws SQLException 
	 {
	        Atbat atbat = new Atbat();
	        atbat.setAtbatplayerID(rs.getInt(1));
	        atbat.setMatches(rs.getInt(2));
	        atbat.setWin(rs.getInt(3));
	        atbat.setLoss(rs.getInt(4));
	        atbat.setSave(rs.getInt(5));
	        atbat.setHold(rs.getInt(6));
	        atbat.setOdds(rs.getFloat(7));
	        atbat.setInnings(rs.getDouble(8));
	        atbat.setHitsAllowed(rs.getInt(9));
	        atbat.setHomeRunsAllowed(rs.getInt(10));
	        atbat.setWalks(rs.getInt(11));
	        atbat.setHitByPitch(rs.getInt(12));
	        atbat.setStrikeouts(rs.getInt(13));
	        atbat.setRuns(rs.getInt(14));
	        atbat.setEarnedRuns(rs.getInt(15));
	        atbat.setOnBaseAllowed(rs.getDouble(16));
	        
	        return atbat;
	    }
	
}