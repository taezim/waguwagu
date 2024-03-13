package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Batter;

@Repository
public class BatterRepositoryImpl implements BatterRepository {

//DB 

private JdbcTemplate template;

@Autowired
public void setJdbctemplate(DataSource dataSource)
{
	this.template = new JdbcTemplate(dataSource);
}

//객체들 담을 list 객체 생성
private List<Batter> listOfBatter = new ArrayList<Batter>();

@Override
public List<Batter> readAllBatters() {
	// TODO Auto-generated method stub
	String SQL = "select * from batter";
	List<Batter> listOfBatter = template.query(SQL, new BatterRowMapper());
	return listOfBatter;
}

@Override
public Batter readBatterByNumber(String batterNumber) {
	// TODO Auto-generated method stub
	Batter batterInfo = null;
	
	String SQL = "select count(*) from batter where batterplayerID=?";
	int rowCount = template.queryForObject(SQL, Integer.class, batterNumber);
	if(rowCount != 0)
	{
		SQL = "select * from batter where batterplayerID =? ";
		batterInfo = template.queryForObject(SQL, new Object[] {batterNumber}, new BatterRowMapper());
	}
	return batterInfo;
}

@Override
public List<Batter> readBatterListByCategory(String category) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void createBatter(Batter batter) {
	// TODO Auto-generated method stub
	String SQL = "INSERT INTO batter (batterplayerID, matches, atBats, strokes, score, hits, doubles, triples, homeRuns, rbis, stolenBases, doublePlays, battingAverage, sluggingPercentage, onBasePercentage) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	template.update(SQL, batter.getBatterplayerID(),
	        batter.getMatches(),
	        batter.getAtBats(),
	        batter.getStrokes(),
	        batter.getScore(),
	        batter.getHits(),
	        batter.getDoubles(),
	        batter.getTriples(),
	        batter.getHomeRuns(),
	        batter.getRbis(),
	        batter.getStolenBases(),
	        batter.getDoublePlays(),
	        batter.getBattingAverage(),
	        batter.getSluggingPercentage(),
	        batter.getOnBasePercentage());

	
	listOfBatter.add(batter);
}



@Override
public void updateBatter(Batter batter) {
    // TODO Auto-generated method stub
	String SQL = "UPDATE batter SET matches=?, atBats=?, strokes=?, score=?, hits=?, doubles=?, triples=?, homeRuns=?, rbis=?, stolenBases=?, doublePlays=?, battingAverage=?, sluggingPercentage=?, onBasePercentage=? WHERE batterplayerID = ?";

	template.update(SQL, batter.getMatches(),
	        batter.getAtBats(),
	        batter.getStrokes(),
	        batter.getScore(),
	        batter.getHits(),
	        batter.getDoubles(),
	        batter.getTriples(),
	        batter.getHomeRuns(),
	        batter.getRbis(),
	        batter.getStolenBases(),
	        batter.getDoublePlays(),
	        batter.getBattingAverage(),
	        batter.getSluggingPercentage(),
	        batter.getOnBasePercentage(),
	        batter.getBatterplayerID());


}


@Override
public void deleteBatter(String batterNumber) {
	// TODO Auto-generated method stub
	String SQL = "delete from batter where batterplayerID = ?";
	this.template.update(SQL, batterNumber);
}
}