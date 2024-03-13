package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Batter;

public class BatterRowMapper implements RowMapper<Batter>{

 public Batter mapRow(ResultSet rs, int rowNum) throws SQLException 
 {
        Batter batter = new Batter();
        batter.setBatterplayerID(rs.getInt(1));
        batter.setMatches(rs.getInt(2));
        batter.setAtBats(rs.getInt(3));
        batter.setStrokes(rs.getInt(4));
        batter.setScore(rs.getInt(5));
        batter.setHits(rs.getInt(6));
        batter.setDoubles(rs.getInt(7));
        batter.setTriples(rs.getInt(8));
        batter.setHomeRuns(rs.getInt(9));
        batter.setRbis(rs.getInt(10));
        batter.setStolenBases(rs.getInt(11));
        batter.setDoublePlays(rs.getInt(12));
        batter.setBattingAverage(rs.getDouble(13));
        batter.setSluggingPercentage(rs.getDouble(14));
        batter.setOnBasePercentage(rs.getDouble(15));
        
        return batter;
    }
}
